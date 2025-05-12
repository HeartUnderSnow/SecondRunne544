% MSR Reactor Simulation Analysis Script
% Created to analyze Serpent2 simulation results
% Date: May 12, 2025

% Clear workspace and close all figures
clear all;
close all;
clc;

fprintf('Starting analysis of MSR reactor simulation results...\n');

% Define normalization parameters
% These will be used to convert to absolute flux (neutrons/cm²/s)
% Default source strength for MSR (adjust based on your reactor power)
sourceStrength = 1.0e17; % neutrons/second - adjust for your reactor power

% Load detector data
try
    run('nattyCore_det0.m');
    fprintf('Successfully loaded detector data\n');
catch
    error('Could not load detector data file (nattyCore_det0.m)');
end

% Load general results
try
    run('nattyCore_res.m');
    fprintf('Successfully loaded general results\n');
catch
    error('Could not load general results file (nattyCore_res.m)');
end

% Check for TOT_SRCRATE variable and handle it
if ~exist('TOT_SRCRATE', 'var')
    % If TOT_SRCRATE doesn't exist, create it from other variables or use a default
    fprintf('Warning: TOT_SRCRATE variable not found in result files.\n');
    fprintf('Using simulation population as normalization factor.\n');
    
    % Use population size as a fallback normalization
    if exist('POP', 'var')
        TOT_SRCRATE = POP;
    else
        TOT_SRCRATE = 1.0; % Default fallback
        fprintf('Warning: Using default normalization factor of 1.0\n');
    end
end

% Ensure TOT_SRCRATE is a scalar
if numel(TOT_SRCRATE) > 1
    fprintf('Warning: TOT_SRCRATE is not a scalar. Using the first element.\n');
    TOT_SRCRATE = TOT_SRCRATE(1);
end

% Print basic simulation info
fprintf('\n==== Simulation Information ====\n');
fprintf('Title: %s\n', TITLE);
fprintf('Version: %s\n', VERSION);
fprintf('Compilation date: %s\n', COMPILE_DATE);
fprintf('Run start date: %s\n', START_DATE);
fprintf('Run completion date: %s\n', COMPLETE_DATE);
fprintf('Population per cycle: %d\n', POP);
fprintf('Number of batches: %d\n', BATCHES);
fprintf('CPU time: %.2f hours\n', TOT_CPU_TIME/3600);
fprintf('Running time: %.2f hours\n', RUNNING_TIME/3600);

% Print key neutronics results
fprintf('\n==== Key Results ====\n');
fprintf('Criticality (k-eff): %.5f ± %.5f\n', ANA_KEFF(1), ANA_KEFF(2));
fprintf('Neutron generation time: %.2e s\n', ADJ_NAUCHI_GEN_TIME(1));
fprintf('Average neutron lethargy: %.4f\n', ANA_ALF(1));
fprintf('Mean neutron energy: %.4e MeV\n', ANA_EALF(1));

% Check if room detectors recorded anything
fprintf('\n==== Detector Status ====\n');

if sum(DETRoom1Det(:,11)) == 0
    fprintf('Room1Det: No data recorded\n');
else
    fprintf('Room1Det: Data available\n');
end

if sum(DETRoom2Det(:,11)) == 0
    fprintf('Room2Det: No data recorded\n');
else
    fprintf('Room2Det: Data available\n');
end

if sum(DETRoom3Det(:,11)) == 0
    fprintf('Room3Det: No data recorded\n');
else
    fprintf('Room3Det: Data available\n');
end

if exist('DETFluxDet', 'var')
    fprintf('FluxDet: Data available - %d energy bins\n', size(DETFluxDet,1));
else
    fprintf('FluxDet: No data recorded\n');
end

% Create figure for flux spectrum
figure('Position', [100, 100, 1000, 800]);

% Extract energy bins and flux values
if exist('DETFluxDetE', 'var') && exist('DETFluxDet', 'var')
    energy_bins = DETFluxDetE(:,3); % Mean energy of each bin
    raw_flux_values = DETFluxDet(:,11); % Raw flux values from Serpent
    rel_errors = DETFluxDet(:,12); % Relative errors
    
    % Calculate energy bin widths (for flux per unit energy)
    energy_lower = DETFluxDetE(:,1);
    energy_upper = DETFluxDetE(:,2);
    energy_widths = energy_upper - energy_lower;
    
    % Calculate normalization factor from Serpent results
    % This converts the statistical weight to absolute flux
    if exist('TOT_SRCRATE', 'var') && TOT_SRCRATE ~= 0
        norm_factor = sourceStrength / TOT_SRCRATE;
    else
        % Fallback if TOT_SRCRATE is zero or doesn't exist
        fprintf('Warning: Using alternative normalization method.\n');
        if exist('SRC_MULT', 'var') && SRC_MULT(1) ~= 0
            norm_factor = sourceStrength / SRC_MULT(1);
        else
            % If all else fails, use a default normalization
            norm_factor = sourceStrength;
            fprintf('Warning: Using direct source strength as normalization factor.\n');
        end
    end
    
    % Convert to flux per unit energy (neutrons/cm²/s/MeV)
    % Dividing by energy bin width gives flux per unit energy
    flux_per_energy = raw_flux_values .* norm_factor ./ energy_widths;
    
    % For total flux in each bin (neutrons/cm²/s)
    flux_values = raw_flux_values .* norm_factor;
    
    % Calculate absolute errors
    flux_errors = rel_errors .* flux_values;
    flux_per_energy_errors = rel_errors .* flux_per_energy;
    
    % Plot flux spectrum (log-log scale)
    subplot(2,2,1);
    loglog(energy_bins, flux_per_energy, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4);
    hold on;
    loglog(energy_bins, flux_per_energy + flux_per_energy_errors, 'r--', 'LineWidth', 0.5);
    loglog(energy_bins, flux_per_energy - flux_per_energy_errors, 'r--', 'LineWidth', 0.5);
    grid on;
    xlabel('Energy (MeV)');
    ylabel('Neutron Flux (n/cm²/s)');
    title('Neutron Energy Spectrum (log-log)');
    
    % Set more detailed x-axis ticks
    xticks = [1e-8, 3e-8, 1e-7, 3e-7, 1e-6, 3e-6, 1e-5, 3e-5, 1e-4, 3e-4, ...
              1e-3, 3e-3, 1e-2, 3e-2, 1e-1, 3e-1, 1, 3, 10, 20];
    set(gca, 'XTick', xticks);
    
    % Create custom tick labels
    xticklabels = {};
    for i = 1:length(xticks)
        if xticks(i) >= 1
            xticklabels{i} = num2str(xticks(i));
        else
            exp_val = floor(log10(xticks(i)));
            mantissa = xticks(i) / 10^exp_val;
            if abs(mantissa - 1) < 1e-10
                xticklabels{i} = sprintf('10^{%d}', exp_val);
            else
                xticklabels{i} = sprintf('%gx10^{%d}', mantissa, exp_val);
            end
        end
    end
    set(gca, 'XTickLabel', xticklabels);
    set(gca, 'XTickLabelRotation', 45);
    
    % Add minor grid
    set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
    grid(gca, 'minor');
    
    % Plot flux spectrum (linear-log scale)
    subplot(2,2,2);
    semilogx(energy_bins, flux_per_energy, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4);
    hold on;
    semilogx(energy_bins, flux_per_energy + flux_per_energy_errors, 'r--', 'LineWidth', 0.5);
    semilogx(energy_bins, flux_per_energy - flux_per_energy_errors, 'r--', 'LineWidth', 0.5);
    grid on;
    xlabel('Energy (MeV)');
    ylabel('Neutron Flux (n/cm²/s)');
    title('Neutron Energy Spectrum (linear-log)');
    
    % Set more detailed x-axis ticks
    xticks = [1e-8, 3e-8, 1e-7, 3e-7, 1e-6, 3e-6, 1e-5, 3e-5, 1e-4, 3e-4, ...
              1e-3, 3e-3, 1e-2, 3e-2, 1e-1, 3e-1, 1, 3, 10, 20];
    set(gca, 'XTick', xticks);
    set(gca, 'XTickLabel', xticklabels);
    set(gca, 'XTickLabelRotation', 45);
    
    % Add minor grid
    set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
    grid(gca, 'minor');
    
    % Plot relative errors
    subplot(2,2,3);
    semilogx(energy_bins, rel_errors * 100, 'r-o', 'LineWidth', 1.5, 'MarkerSize', 4);
    grid on;
    xlabel('Energy (MeV)');
    ylabel('Relative Error (%)');
    title('Relative Errors in Flux Measurements');
    
    % Set more detailed x-axis ticks
    set(gca, 'XTick', xticks);
    set(gca, 'XTickLabel', xticklabels);
    set(gca, 'XTickLabelRotation', 45);
    
    % Add minor grid
    set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
    grid(gca, 'minor');
    
    % Calculate integral quantities (in neutrons/cm²/s)
    thermal_flux = sum(flux_values(energy_bins < 0.625));
    epithermal_flux = sum(flux_values(energy_bins >= 0.625 & energy_bins < 1.0));
    fast_flux = sum(flux_values(energy_bins >= 1.0));
    total_flux = sum(flux_values);
    
    % Calculate thermal utilization and other parameters
    thermal_fraction = thermal_flux / total_flux;
    epithermal_fraction = epithermal_flux / total_flux;
    fast_fraction = fast_flux / total_flux;
    
    % Print integral flux parameters
    fprintf('\n==== Integral Flux Parameters ====\n');
    fprintf('Total flux: %.4e neutrons/cm²/s\n', total_flux);
    fprintf('Thermal flux (<0.625 MeV): %.4e neutrons/cm²/s (%.2f%%)\n', thermal_flux, thermal_fraction*100);
    fprintf('Epithermal flux (0.625-1.0 MeV): %.4e neutrons/cm²/s (%.2f%%)\n', epithermal_flux, epithermal_fraction*100);
    fprintf('Fast flux (>1.0 MeV): %.4e neutrons/cm²/s (%.2f%%)\n', fast_flux, fast_fraction*100);
    
    % Print average flux in different energy regions
    fprintf('\n==== Average Flux by Energy Region ====\n');
    thermal_bins = sum(energy_bins < 0.625);
    epithermal_bins = sum(energy_bins >= 0.625 & energy_bins < 1.0);
    fast_bins = sum(energy_bins >= 1.0);
    
    if thermal_bins > 0
        fprintf('Average thermal flux: %.4e neutrons/cm²/s per bin\n', thermal_flux/thermal_bins);
    end
    if epithermal_bins > 0
        fprintf('Average epithermal flux: %.4e neutrons/cm²/s per bin\n', epithermal_flux/epithermal_bins);
    end
    if fast_bins > 0
        fprintf('Average fast flux: %.4e neutrons/cm²/s per bin\n', fast_flux/fast_bins);
    end
    
    % Create a pie chart showing flux distribution
    subplot(2,2,4);
    pie([thermal_fraction, epithermal_fraction, fast_fraction], ...
        {sprintf('Thermal (%.1f%%)', thermal_fraction*100), ...
         sprintf('Epithermal (%.1f%%)', epithermal_fraction*100), ...
         sprintf('Fast (%.1f%%)', fast_fraction*100)});
    title('Neutron Energy Distribution');
    colormap(jet);
end

% Save the figure
saveas(gcf, 'flux_spectrum_analysis.png');
fprintf('\nAnalysis complete. Figure saved as "flux_spectrum_analysis.png"\n');

% Additional statistical analysis if needed
if exist('INF_FLX', 'var')
    figure('Position', [100, 100, 800, 600]);
    
    % Plot group constants if available
    if exist('INF_NSF', 'var') && exist('INF_FISS', 'var')
        subplot(2,1,1);
        plot(INF_NSF(:,1), 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4, 'DisplayName', 'Nu-Sigma-Fission');
        hold on;
        plot(INF_FISS(:,1), 'r-s', 'LineWidth', 1.5, 'MarkerSize', 4, 'DisplayName', 'Sigma-Fission');
        grid on;
        legend('show');
        title('Fission Cross Sections');
        
        subplot(2,1,2);
        if exist('INF_KAPPA', 'var')
            plot(INF_KAPPA(:,1), 'g-^', 'LineWidth', 1.5, 'MarkerSize', 4);
            grid on;
            title('Energy per Fission (KAPPA)');
        end
    end
    
    % Save the figure
    saveas(gcf, 'additional_analysis.png');
    fprintf('Additional analysis figure saved as "additional_analysis.png"\n');
end

% ANSI/ANS-6.1.1-1977 flux-to-dose conversion
if exist('energy_bins', 'var') && exist('flux_values', 'var')
    % ANSI/ANS-6.1.1-1977 flux-to-dose conversion factors
    % Energy [MeV], Conversion Factor [(rem/hr)/(n/cm²/s)]
    ansi_energy = [2.5e-8, 1.0e-7, 1.0e-6, 1.0e-5, 1.0e-4, 1.0e-3, ...
                   1.0e-2, 1.0e-1, 5.0e-1, 1.0, 2.5, 5.0, 7.0, 10.0, 14.0, 20.0];
                
    ansi_factors = [3.67e-6, 3.67e-6, 4.46e-6, 4.54e-6, 4.18e-6, 3.76e-6, ...
                    3.56e-6, 2.17e-5, 9.26e-5, 1.32e-4, 1.25e-4, 1.56e-4, ...
                    1.47e-4, 1.47e-4, 2.08e-4, 2.27e-4];
    
    % Interpolate conversion factors to match the energy bins in the simulation
    interp_factors = interp1(log(ansi_energy), ansi_factors, log(energy_bins), 'pchip', 'extrap');
    
    % Calculate dose rate for each energy bin
    dose_rates = flux_values .* interp_factors;
    
    % Total dose rate
    total_dose = sum(dose_rates);
    
    % Create dose rate figure with multiple plots
    figure('Position', [100, 100, 1200, 800]);
    
    % Plot 1: Dose rate spectrum
    subplot(2,2,1);
    loglog(energy_bins, dose_rates, 'm-o', 'LineWidth', 1.5, 'MarkerSize', 4);
    grid on;
    xlabel('Energy (MeV)');
    ylabel('Dose Rate (rem/hr)');
    title('Neutron Dose Rate Spectrum');
    
    % Set more detailed x-axis ticks
    xticks = [1e-8, 3e-8, 1e-7, 3e-7, 1e-6, 3e-6, 1e-5, 3e-5, 1e-4, 3e-4, ...
              1e-3, 3e-3, 1e-2, 3e-2, 1e-1, 3e-1, 1, 3, 10, 20];
    set(gca, 'XTick', xticks);
    set(gca, 'XTickLabel', xticklabels);
    set(gca, 'XTickLabelRotation', 45);
    
    % Add minor grid lines
    set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
    grid(gca, 'minor');
    
    % Plot 2: Compare flux and dose contributions (Octave-compatible)
    subplot(2,2,2);
    % Create dual y-axis plot manually for Octave compatibility
    if exist('OCTAVE_VERSION', 'builtin')
        % Octave version - use plotyy for dual y-axis
        [ax, h1, h2] = plotyy(energy_bins, flux_values, energy_bins, dose_rates, ...
                              @loglog, @loglog);
        
        % Customize the plot
        set(h1, 'Color', 'b', 'Marker', 'o', 'LineWidth', 1.5, 'MarkerSize', 4);
        set(h2, 'Color', 'r', 'Marker', 'o', 'LineWidth', 1.5, 'MarkerSize', 4);
        
        xlabel('Energy (MeV)');
        ylabel(ax(1), 'Flux (n/cm²/s)');
        ylabel(ax(2), 'Dose Rate (rem/hr)');
        set(ax(1), 'YColor', 'b');
        set(ax(2), 'YColor', 'r');
        
        % Set more detailed x-axis ticks for both axes
        set(ax(1), 'XTick', xticks);
        set(ax(1), 'XTickLabel', xticklabels);
        set(ax(1), 'XTickLabelRotation', 45);
        set(ax(2), 'XTick', xticks);
        set(ax(2), 'XTickLabelRotation', 45);
        
        title('Flux vs Dose Rate');
        grid on;
        legend([h1, h2], {'Flux', 'Dose Rate'}, 'Location', 'northeast');
    else
        % MATLAB version - use yyaxis
        yyaxis left
        loglog(energy_bins, flux_values, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4);
        ylabel('Flux (n/cm²/s)');
        xlabel('Energy (MeV)');
        
        yyaxis right
        loglog(energy_bins, dose_rates, 'r-o', 'LineWidth', 1.5, 'MarkerSize', 4);
        ylabel('Dose Rate (rem/hr)');
        title('Flux vs Dose Rate');
        grid on;
        legend('Flux', 'Dose Rate', 'Location', 'northeast');
        
        % Set more detailed x-axis ticks
        set(gca, 'XTick', xticks);
        set(gca, 'XTickLabel', xticklabels);
        set(gca, 'XTickLabelRotation', 45);
    end
    
    % Plot 3: Cumulative dose contribution
    subplot(2,2,3);
    cumulative_dose = cumsum(dose_rates) / total_dose * 100;
    semilogx(energy_bins, cumulative_dose, 'g-o', 'LineWidth', 1.5, 'MarkerSize', 4);
    grid on;
    xlabel('Energy (MeV)');
    ylabel('Cumulative Dose Contribution (%)');
    title('Cumulative Dose vs Energy');
    
    % Set more detailed x-axis ticks
    set(gca, 'XTick', xticks);
    set(gca, 'XTickLabel', xticklabels);
    set(gca, 'XTickLabelRotation', 45);
    
    % Add reference lines (Octave-compatible)
    hold on;
    line(get(gca, 'XLim'), [50 50], 'Color', 'k', 'LineStyle', '--', 'LineWidth', 1);
    line(get(gca, 'XLim'), [90 90], 'Color', 'k', 'LineStyle', '--', 'LineWidth', 1);
    text(1e-6, 52, '50%', 'FontSize', 9, 'BackgroundColor', 'w');
    text(1e-6, 92, '90%', 'FontSize', 9, 'BackgroundColor', 'w');
    hold off;
    
    % Add minor grid lines
    set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
    grid(gca, 'minor');
    
    % Plot 4: Dose contribution by energy region
    subplot(2,2,4);
    thermal_dose = sum(dose_rates(energy_bins < 0.625));
    epithermal_dose = sum(dose_rates(energy_bins >= 0.625 & energy_bins < 1.0));
    fast_dose = sum(dose_rates(energy_bins >= 1.0));
    pie([thermal_dose, epithermal_dose, fast_dose], ...
        {sprintf('Thermal (%.1f%%)', 100*thermal_dose/total_dose), ...
         sprintf('Epithermal (%.1f%%)', 100*epithermal_dose/total_dose), ...
         sprintf('Fast (%.1f%%)', 100*fast_dose/total_dose)});
    title('Dose Contribution by Energy Range');
    colormap(cool);
    
    % Save the dose figure
    saveas(gcf, 'dose_analysis.png');
    
    % Create an additional comparison plot
    figure('Position', [100, 100, 1000, 600]);
    
    % Show flux and dose on different y axes with better visibility (Octave-compatible)
    if exist('OCTAVE_VERSION', 'builtin')
        % Octave version - use plotyy for dual axes
        [ax, h1, h2] = plotyy(energy_bins, flux_values, energy_bins, dose_rates, ...
                              @loglog, @loglog);
        
        % Customize the lines
        set(h1, 'Color', 'b', 'Marker', 'o', 'LineWidth', 2, 'MarkerSize', 6);
        set(h2, 'Color', 'r', 'Marker', 's', 'LineWidth', 2, 'MarkerSize', 6);
        
        % Set labels and colors
        xlabel('Energy (MeV)');
        ylabel(ax(1), 'Neutron Flux (n/cm²/s)');
        ylabel(ax(2), 'Dose Rate (rem/hr)');
        set(ax(1), 'YColor', 'b');
        set(ax(2), 'YColor', 'r');
        
        % Set custom x-axis ticks for both axes
        xticks = [1e-8, 1e-7, 1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1, 10, 20];
        set(ax(1), 'XTick', xticks);
        set(ax(1), 'XTickLabel', {'10^{-8}', '10^{-7}', '10^{-6}', '10^{-5}', '10^{-4}', ...
                                  '10^{-3}', '10^{-2}', '10^{-1}', '10^0', '10^1', '20'});
        set(ax(2), 'XTick', xticks);
        
        % Add minor grid
        set(ax(1), 'XMinorTick', 'on', 'YMinorTick', 'on');
        grid(ax(1), 'minor');
        
        title('Neutron Flux and Dose Rate vs Energy');
        grid on;
        
        % Add vertical lines at ANSI energy points
        hold(ax(1), 'on');
        for i = 1:length(ansi_energy)
            line(ax(1), [ansi_energy(i) ansi_energy(i)], get(ax(1), 'YLim'), ...
                 'Color', 'k', 'LineStyle', '--', 'LineWidth', 0.5);
        end
        
        % Add annotations for key energy regions
        text(ax(1), 1e-7, 0.85*max(flux_values), 'Thermal', 'FontSize', 10, ...
             'BackgroundColor', 'w', 'EdgeColor', 'k');
        text(ax(1), 1e-1, 0.85*max(flux_values), 'Epithermal', 'FontSize', 10, ...
             'BackgroundColor', 'w', 'EdgeColor', 'k');
        text(ax(1), 2, 0.85*max(flux_values), 'Fast', 'FontSize', 10, ...
             'BackgroundColor', 'w', 'EdgeColor', 'k');
        
        % Create legend using line handles
        legend([h1, h2], {'Neutron Flux', 'Dose Rate'}, 'Location', 'northwest');
    else
        % MATLAB version - use yyaxis
        yyaxis left
        loglog(energy_bins, flux_values, 'b-o', 'LineWidth', 2, 'MarkerSize', 6);
        ylabel('Neutron Flux (n/cm²/s)');
        xlabel('Energy (MeV)');
        set(gca, 'YColor', 'b');
        
        yyaxis right
        loglog(energy_bins, dose_rates, 'r-s', 'LineWidth', 2, 'MarkerSize', 6);
        ylabel('Dose Rate (rem/hr)');
        set(gca, 'YColor', 'r');
        
        title('Neutron Flux and Dose Rate vs Energy');
        grid on;
        
        % Set custom x-axis ticks
        xticks = [1e-8, 1e-7, 1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1, 10, 20];
        set(gca, 'XTick', xticks);
        set(gca, 'XTickLabel', {'10^{-8}', '10^{-7}', '10^{-6}', '10^{-5}', '10^{-4}', ...
                               '10^{-3}', '10^{-2}', '10^{-1}', '10^0', '10^1', '20'});
        
        % Add minor grid
        set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
        grid(gca, 'minor');
        
        legend('Neutron Flux', 'Dose Rate', 'Location', 'northwest');
        
        % Mark the ANSI energy points on the plot
        hold on;
        
        % Add vertical lines at ANSI energy points  
        for i = 1:length(ansi_energy)
            if exist('OCTAVE_VERSION', 'builtin')
                % Octave version - use line function
                line([ansi_energy(i) ansi_energy(i)], get(gca, 'YLim'), ...
                     'Color', 'k', 'LineStyle', '--', 'LineWidth', 0.5);
            else
                % MATLAB version - use xline
                xline(ansi_energy(i), '--k', 'Alpha', 0.3);
            end
        end
        
        % Add annotations for key energy regions
        text(1e-7, 0.85*max(flux_values), 'Thermal', 'FontSize', 10, ...
             'BackgroundColor', 'w', 'EdgeColor', 'k');
        text(1e-1, 0.85*max(flux_values), 'Epithermal', 'FontSize', 10, ...
             'BackgroundColor', 'w', 'EdgeColor', 'k');
        text(2, 0.85*max(flux_values), 'Fast', 'FontSize', 10, ...
             'BackgroundColor', 'w', 'EdgeColor', 'k');
    end
    
    % Save the comparison figure
    saveas(gcf, 'flux_dose_comparison.png');
    
    % Print dose information
    fprintf('\n==== Dose Rate Analysis ====\n');
    fprintf('Total neutron dose rate: %.4e rem/hr\n', total_dose);
    fprintf('Thermal contribution (<0.625 MeV): %.4e rem/hr (%.2f%%)\n', ...
            thermal_dose, 100*thermal_dose/total_dose);
    fprintf('Epithermal contribution (0.625-1.0 MeV): %.4e rem/hr (%.2f%%)\n', ...
            epithermal_dose, 100*epithermal_dose/total_dose);
    fprintf('Fast contribution (>1.0 MeV): %.4e rem/hr (%.2f%%)\n', ...
            fast_dose, 100*fast_dose/total_dose);
    
    % Generate a more detailed dose analysis
    fprintf('\n==== Detailed Dose Rate by Energy Bin ====\n');
    fprintf('Energy (MeV)    Flux (n/cm²/s)    Dose Factor    Dose Rate (rem/hr)\n');
    fprintf('============    =============     ===========   ==================\n');
    
    % Find the highest contributing bins
    [sorted_dose, indices] = sort(dose_rates, 'descend');
    
    % Show the top 20 contributing bins
    for i = 1:min(20, length(indices))
        idx = indices(i);
        fprintf('%12.4e    %12.4e    %12.4e    %12.4e\n', ...
                energy_bins(idx), flux_values(idx), interp_factors(idx), dose_rates(idx));
    end
    
    % Create bins for the ANSI energy ranges and show contributions
    fprintf('\n==== Dose Rate by ANSI Energy Ranges ====\n');
    fprintf('Energy Range (MeV)         Dose Rate (rem/hr)    Percentage\n');
    fprintf('==================        ==================    ==========\n');
    
    for i = 1:length(ansi_energy)-1
        % Find energy bins within this ANSI range
        mask = energy_bins >= ansi_energy(i) & energy_bins < ansi_energy(i+1);
        range_dose = sum(dose_rates(mask));
        
        if range_dose > 0
            fprintf('%8.2e - %8.2e    %12.4e          %6.2f%%\n', ...
                    ansi_energy(i), ansi_energy(i+1), range_dose, 100*range_dose/total_dose);
        end
    end
    
    % Also handle the last bin (anything above 20 MeV)
    mask = energy_bins >= ansi_energy(end);
    range_dose = sum(dose_rates(mask));
    if range_dose > 0
        fprintf('%8.2e - Inf          %12.4e          %6.2f%%\n', ...
                ansi_energy(end), range_dose, 100*range_dose/total_dose);
    end
end

% Create a figure to compare with typical MSR flux spectrum
figure('Position', [100, 100, 1000, 600]);
subplot(1,2,1);
loglog(energy_bins, flux_per_energy, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4);
grid on;
xlabel('Energy (MeV)');
ylabel('Neutron Flux (n/cm²/s)');
title('Simulated Neutron Spectrum');

% Set more detailed x-axis ticks
set(gca, 'XTick', xticks);
set(gca, 'XTickLabel', xticklabels);
set(gca, 'XTickLabelRotation', 45);

% Energy grid for lethargy plot
subplot(1,2,2);
semilogx(energy_bins, flux_per_energy .* energy_bins, 'r-o', 'LineWidth', 1.5, 'MarkerSize', 4);
grid on;
xlabel('Energy (MeV)');
ylabel('E×Φ(E) (n/cm²/s)');
title('Flux per Unit Lethargy');

% Set more detailed x-axis ticks
set(gca, 'XTick', xticks);
set(gca, 'XTickLabel', xticklabels);
set(gca, 'XTickLabelRotation', 45);

saveas(gcf, 'flux_lethargy_analysis.png');

% Export data to CSV for further analysis
if exist('dose_rates', 'var')
    flux_dose_data = [energy_lower, energy_upper, energy_bins, flux_values, flux_errors, ...
                     flux_per_energy, flux_per_energy_errors, dose_rates];
    flux_dose_headers = {'Energy_Lower(MeV)', 'Energy_Upper(MeV)', 'Energy_Mean(MeV)', ...
                       'Flux(n/cm²/s)', 'Flux_Error(n/cm²/s)', ...
                       'Flux_per_Energy(n/cm²/s/MeV)', 'Flux_per_Energy_Error(n/cm²/s/MeV)', ...
                       'Dose_Rate(rem/hr)'};
else
    flux_dose_data = [energy_lower, energy_upper, energy_bins, flux_values, flux_errors, ...
                     flux_per_energy, flux_per_energy_errors];
    flux_dose_headers = {'Energy_Lower(MeV)', 'Energy_Upper(MeV)', 'Energy_Mean(MeV)', ...
                       'Flux(n/cm²/s)', 'Flux_Error(n/cm²/s)', ...
                       'Flux_per_Energy(n/cm²/s/MeV)', 'Flux_per_Energy_Error(n/cm²/s/MeV)'};
end

% Check if we're running in Octave or MATLAB
if exist('OCTAVE_VERSION', 'builtin')
    % We're in Octave - use csvwrite with a separate header file
    fprintf('Detected Octave environment. Using Octave-compatible CSV export.\n');
    
    % Write the data
    csvwrite('flux_dose_data.csv', flux_dose_data);
    
    % Write headers to a separate file
    fid = fopen('flux_dose_data_headers.txt', 'w');
    fprintf(fid, '%s,', flux_dose_headers{1:end-1});
    fprintf(fid, '%s\n', flux_dose_headers{end});
    fclose(fid);
    
    % Create combined CSV file with headers
    fid_header = fopen('flux_dose_data_headers.txt', 'r');
    fid_data = fopen('flux_dose_data.csv', 'r');
    fid_combined = fopen('flux_dose_data_with_headers.csv', 'w');
    
    % Write headers
    header_line = fgetl(fid_header);
    fprintf(fid_combined, '%s\n', header_line);
    
    % Write data
    while ~feof(fid_data)
        line = fgetl(fid_data);
        if ischar(line)
            fprintf(fid_combined, '%s\n', line);
        end
    end
    
    fclose(fid_header);
    fclose(fid_data);
    fclose(fid_combined);
    
    fprintf('Flux and dose data exported to "flux_dose_data_with_headers.csv"\n');
else
    % We're in MATLAB - use writetable as originally written
    flux_dose_table = array2table(flux_dose_data, 'VariableNames', flux_dose_headers);
    writetable(flux_dose_table, 'flux_dose_data.csv');
    fprintf('Flux and dose data exported to "flux_dose_data.csv"\n');
end

% Also export ANSI/ANS-6.1.1-1977 data to CSV for reference
ansi_data = [ansi_energy', ansi_factors'];
ansi_headers = {'Energy(MeV)', 'Conversion_Factor(rem/hr_per_n/cm²/s)'};

if exist('OCTAVE_VERSION', 'builtin')
    % We're in Octave
    csvwrite('ansi_ans_611_1977.csv', ansi_data);
    
    % Write headers to a separate file
    fid = fopen('ansi_ans_611_1977_headers.txt', 'w');
    fprintf(fid, '%s,', ansi_headers{1:end-1});
    fprintf(fid, '%s\n', ansi_headers{end});
    fclose(fid);
    
    % Create combined CSV file with headers
    fid_header = fopen('ansi_ans_611_1977_headers.txt', 'r');
    fid_data = fopen('ansi_ans_611_1977.csv', 'r');
    fid_combined = fopen('ansi_ans_611_1977_with_headers.csv', 'w');
    
    % Write headers
    header_line = fgetl(fid_header);
    fprintf(fid_combined, '%s\n', header_line);
    
    % Write data
    while ~feof(fid_data)
        line = fgetl(fid_data);
        if ischar(line)
            fprintf(fid_combined, '%s\n', line);
        end
    end
    
    fclose(fid_header);
    fclose(fid_data);
    fclose(fid_combined);
    
    fprintf('ANSI/ANS-6.1.1-1977 data exported to "ansi_ans_611_1977_with_headers.csv"\n');
else
    % We're in MATLAB
    ansi_table = array2table(ansi_data, 'VariableNames', ansi_headers);
    writetable(ansi_table, 'ansi_ans_611_1977.csv');
    fprintf('ANSI/ANS-6.1.1-1977 data exported to "ansi_ans_611_1977.csv"\n');
end

fprintf('\nAnalysis completed successfully.\n');
fprintf('\nNOTE: The absolute flux values depend on the source strength\n');
fprintf('      which was set to %.2e neutrons/s in this analysis.\n', sourceStrength);
fprintf('      Adjust the sourceStrength variable at the beginning of the script\n');
fprintf('      to match your reactor power for accurate absolute flux values.\n');
fprintf('\nDose conversion factors were taken from ANSI/ANS-6.1.1-1977 standard.\n');
fprintf('      The dose rate calculations assume unshielded neutron flux.\n');
