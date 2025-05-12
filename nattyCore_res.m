
% Increase counter:

if (exist('idx', 'var'));
  idx = idx + 1;
else;
  idx = 1;
end;

% Version, title and date:

VERSION                   (idx, [1:  13]) = 'Serpent 2.2.1' ;
COMPILE_DATE              (idx, [1:  20]) = 'Mar 20 2025 11:47:38' ;
DEBUG                     (idx, 1)        = 0 ;
TITLE                     (idx, [1:  12]) = 'natMaterials' ;
CONFIDENTIAL_DATA         (idx, 1)        = 0 ;
INPUT_FILE_NAME           (idx, [1:  49]) = '/home/galriel/serpent2/3rdne544project/nattyCore2' ;
WORKING_DIRECTORY         (idx, [1:  22]) = '/home/galriel/serpent2' ;
HOSTNAME                  (idx, [1:   9]) = 'archlinux' ;
CPU_TYPE                  (idx, [1:  46]) = '11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz' ;
CPU_MHZ                   (idx, 1)        = 184.0 ;
START_DATE                (idx, [1:  24]) = 'Mon May 12 02:31:58 2025' ;
COMPLETE_DATE             (idx, [1:  24]) = 'Mon May 12 09:32:46 2025' ;

% Run parameters:

POP                       (idx, 1)        = 5000 ;
BATCHES                   (idx, 1)        = 200 ;
SRC_NORM_MODE             (idx, 1)        = 2 ;
SEED                      (idx, 1)        = 1747038718073 ;
UFS_MODE                  (idx, 1)        = 0 ;
UFS_ORDER                 (idx, 1)        = 1.00000 ;
NEUTRON_TRANSPORT_MODE    (idx, 1)        = 1 ;
PHOTON_TRANSPORT_MODE     (idx, 1)        = 0 ;
GROUP_CONSTANT_GENERATION (idx, 1)        = 1 ;
B1_CALCULATION            (idx, [1:  3])  = [ 0 0 0 ] ;
B1_IMPLICIT_LEAKAGE       (idx, 1)        = 0 ;
B1_BURNUP_CORRECTION      (idx, 1)        = 0 ;

CRIT_SPEC_MODE            (idx, 1)        = 0 ;
IMPLICIT_REACTION_RATES   (idx, 1)        = 1 ;

% Optimization:

OPTIMIZATION_MODE         (idx, 1)        = 4 ;
RECONSTRUCT_MICROXS       (idx, 1)        = 1 ;
RECONSTRUCT_MACROXS       (idx, 1)        = 1 ;
DOUBLE_INDEXING           (idx, 1)        = 0 ;
MG_MAJORANT_MODE          (idx, 1)        = 0 ;

% Parallelization:

MPI_TASKS                 (idx, 1)        = 1 ;
OMP_THREADS               (idx, 1)        = 1 ;
MPI_REPRODUCIBILITY       (idx, 1)        = 0 ;
OMP_REPRODUCIBILITY       (idx, 1)        = 1 ;
SHARE_BUF_ARRAY           (idx, 1)        = 1 ;
SHARE_RES2_ARRAY          (idx, 1)        = 1 ;
OMP_SHARED_QUEUE_LIM      (idx, 1)        = 0 ;

% File paths:

XS_DATA_FILE_PATH         (idx, [1:  20]) = 'Serpent2xsdata/xsdir' ;
DECAY_DATA_FILE_PATH      (idx, [1:  30]) = 'Serpent2xsdata/sss_jeff311.dec' ;
SFY_DATA_FILE_PATH        (idx, [1:   3]) = 'N/A' ;
NFY_DATA_FILE_PATH        (idx, [1:  30]) = 'Serpent2xsdata/sss_jeff311.nfy' ;
BRA_DATA_FILE_PATH        (idx, [1:   3]) = 'N/A' ;

% Collision and reaction sampling (neutrons/photons):

MEAN_SRC_WGT              (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
SOURCE_SAMPLING_EFF       (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
MIN_MACROXS               (idx, [1:   4]) = [  5.00000E-02 0.0E+00  0.00000E+00 0.0E+00 ];
DT_THRESH                 (idx, [1:   2]) = [  9.00000E-01  9.00000E-01 ] ;
ST_FRAC                   (idx, [1:   4]) = [  2.28029E-02 0.00102  0.00000E+00 0.0E+00 ];
DT_FRAC                   (idx, [1:   4]) = [  9.77197E-01 2.4E-05  0.00000E+00 0.0E+00 ];
DT_EFF                    (idx, [1:   4]) = [  3.24112E-01 4.1E-05  0.00000E+00 0.0E+00 ];
REA_SAMPLING_EFF          (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
REA_SAMPLING_FAIL         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_COL_EFF               (idx, [1:   4]) = [  3.24272E-01 4.3E-05  0.00000E+00 0.0E+00 ];
AVG_TRACKING_LOOPS        (idx, [1:   8]) = [  7.49052E+00 0.00088  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
CELL_SEARCH_FRAC          (idx, [1:  10]) = [  9.64180E-01 1.4E-06  3.53937E-02 3.8E-05  4.26047E-04 0.00040  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
AVG_TRACKS                (idx, [1:   4]) = [  7.71626E+03 0.00695  0.00000E+00 0.0E+00 ];
AVG_REAL_COL              (idx, [1:   4]) = [  7.71603E+03 0.00695  0.00000E+00 0.0E+00 ];
AVG_VIRT_COL              (idx, [1:   4]) = [  1.60788E+04 0.00695  0.00000E+00 0.0E+00 ];
AVG_SURF_CROSS            (idx, [1:   4]) = [  9.42916E+01 0.00694  0.00000E+00 0.0E+00 ];
LOST_PARTICLES            (idx, 1)        = 0 ;

% Run statistics:

CYCLE_IDX                 (idx, 1)        = 200 ;
SIMULATED_HISTORIES       (idx, 1)        = 5000 ;
SIMULATION_COMPLETED      (idx, 1)        = 1 ;

% Running times:

TOT_CPU_TIME              (idx, 1)        =  4.18753E+02 ;
RUNNING_TIME              (idx, 1)        =  4.20803E+02 ;
INIT_TIME                 (idx, [1:   2]) = [  3.98233E-01  3.98233E-01 ] ;
PROCESS_TIME              (idx, [1:   2]) = [  2.13333E-03  2.13333E-03 ] ;
TRANSPORT_CYCLE_TIME      (idx, [1:   3]) = [  4.20403E+02  4.20403E+02  0.00000E+00 ] ;
MPI_OVERHEAD_TIME         (idx, [1:   2]) = [  0.00000E+00  0.00000E+00 ] ;
ESTIMATED_RUNNING_TIME    (idx, [1:   2]) = [  4.20803E+02  0.00000E+00 ] ;
CPU_USAGE                 (idx, 1)        = 0.99513 ;
TRANSPORT_CPU_USAGE       (idx, [1:   2]) = [  9.95420E-01 0.00081 ];
OMP_PARALLEL_FRAC         (idx, 1)        =  9.99672E-01 ;

% Memory usage:

AVAIL_MEM                 (idx, 1)        = 31876.53 ;
ALLOC_MEMSIZE             (idx, 1)        = 2128.79 ;
MEMSIZE                   (idx, 1)        = 2072.82 ;
XS_MEMSIZE                (idx, 1)        = 1947.79 ;
MAT_MEMSIZE               (idx, 1)        = 122.70 ;
RES_MEMSIZE               (idx, 1)        = 0.85 ;
IFC_MEMSIZE               (idx, 1)        = 0.00 ;
MISC_MEMSIZE              (idx, 1)        = 1.48 ;
UNKNOWN_MEMSIZE           (idx, 1)        = 0.00 ;
UNUSED_MEMSIZE            (idx, 1)        = 55.98 ;

% Geometry parameters:

TOT_CELLS                 (idx, 1)        = 20 ;
UNION_CELLS               (idx, 1)        = 0 ;

% Neutron energy grid:

NEUTRON_ERG_TOL           (idx, 1)        =  0.00000E+00 ;
NEUTRON_ERG_NE            (idx, 1)        = 730582 ;
NEUTRON_EMIN              (idx, 1)        =  1.00000E-11 ;
NEUTRON_EMAX              (idx, 1)        =  2.00000E+01 ;

% Unresolved resonance probability table sampling:

URES_DILU_CUT             (idx, 1)        =  1.00000E-09 ;
URES_EMIN                 (idx, 1)        =  1.00000E+37 ;
URES_EMAX                 (idx, 1)        = -1.00000E+37 ;
URES_AVAIL                (idx, 1)        = 18 ;
URES_USED                 (idx, 1)        = 0 ;

% Nuclides and reaction channels:

TOT_NUCLIDES              (idx, 1)        = 46 ;
TOT_TRANSPORT_NUCLIDES    (idx, 1)        = 46 ;
TOT_DOSIMETRY_NUCLIDES    (idx, 1)        = 0 ;
TOT_DECAY_NUCLIDES        (idx, 1)        = 0 ;
TOT_PHOTON_NUCLIDES       (idx, 1)        = 0 ;
TOT_REA_CHANNELS          (idx, 1)        = 1153 ;
TOT_TRANSMU_REA           (idx, 1)        = 0 ;

% Neutron physics options:

USE_DELNU                 (idx, 1)        = 0 ;
USE_URES                  (idx, 1)        = 0 ;
USE_DBRC                  (idx, 1)        = 0 ;
IMPL_CAPT                 (idx, 1)        = 0 ;
IMPL_NXN                  (idx, 1)        = 1 ;
IMPL_FISS                 (idx, 1)        = 0 ;
DOPPLER_PREPROCESSOR      (idx, 1)        = 1 ;
TMS_MODE                  (idx, 1)        = 0 ;
SAMPLE_FISS               (idx, 1)        = 1 ;
SAMPLE_CAPT               (idx, 1)        = 1 ;
SAMPLE_SCATT              (idx, 1)        = 1 ;

% Energy deposition:

EDEP_MODE                 (idx, 1)        = 0 ;
EDEP_DELAYED              (idx, 1)        = 1 ;
EDEP_KEFF_CORR            (idx, 1)        = 1 ;
EDEP_LOCAL_EGD            (idx, 1)        = 0 ;
EDEP_COMP                 (idx, [1:   9]) = [ 0 0 0 0 0 0 0 0 0 ] ;
EDEP_CAPT_E               (idx, 1)        =  0.00000E+00 ;

% Radioactivity data:

TOT_ACTIVITY              (idx, 1)        =  0.00000E+00 ;
TOT_DECAY_HEAT            (idx, 1)        =  0.00000E+00 ;
TOT_SF_RATE               (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ACTIVITY         (idx, 1)        =  0.00000E+00 ;
ACTINIDE_DECAY_HEAT       (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ACTIVITY  (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_DECAY_HEAT(idx, 1)        =  0.00000E+00 ;
INHALATION_TOXICITY       (idx, 1)        =  0.00000E+00 ;
INGESTION_TOXICITY        (idx, 1)        =  0.00000E+00 ;
ACTINIDE_INH_TOX          (idx, 1)        =  0.00000E+00 ;
ACTINIDE_ING_TOX          (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_INH_TOX   (idx, 1)        =  0.00000E+00 ;
FISSION_PRODUCT_ING_TOX   (idx, 1)        =  0.00000E+00 ;
SR90_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
TE132_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
I131_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
I132_ACTIVITY             (idx, 1)        =  0.00000E+00 ;
CS134_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
CS137_ACTIVITY            (idx, 1)        =  0.00000E+00 ;
PHOTON_DECAY_SOURCE       (idx, [1:   2]) = [  0.00000E+00  0.00000E+00 ] ;
NEUTRON_DECAY_SOURCE      (idx, 1)        =  0.00000E+00 ;
ALPHA_DECAY_SOURCE        (idx, 1)        =  0.00000E+00 ;
ELECTRON_DECAY_SOURCE     (idx, 1)        =  0.00000E+00 ;

% Normalization coefficient:

NORM_COEF                 (idx, [1:   4]) = [  1.03289E+11 0.01672  0.00000E+00 0.0E+00 ];

% Analog reaction rate estimators:

CONVERSION_RATIO          (idx, [1:   2]) = [  3.11695E-01 0.00054 ];
U235_FISS                 (idx, [1:   4]) = [  3.07799E+16 0.00035  9.98024E-01 1.4E-05 ];
U238_FISS                 (idx, [1:   4]) = [  6.09418E+13 0.00727  1.97582E-03 0.00719 ];
U235_CAPT                 (idx, [1:   4]) = [  9.97260E+15 0.00060  2.21935E-01 0.00055 ];
U238_CAPT                 (idx, [1:   4]) = [  1.27025E+16 0.00060  2.82686E-01 0.00048 ];

% Neutron balance (particles/weight):

BALA_SRC_NEUTRON_SRC      (idx, [1:   2]) = [ 1000000 1.00000E+06 ] ;
BALA_SRC_NEUTRON_FISS     (idx, [1:   2]) = [ 78215203 1.54728E+08 ] ;
BALA_SRC_NEUTRON_NXN      (idx, [1:   2]) = [ 0 1.65374E+06 ] ;
BALA_SRC_NEUTRON_VR       (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_SRC_NEUTRON_TOT      (idx, [1:   2]) = [ 79215203 1.57381E+08 ] ;

BALA_LOSS_NEUTRON_CAPT    (idx, [1:   2]) = [ 46690534 9.30197E+07 ] ;
BALA_LOSS_NEUTRON_FISS    (idx, [1:   2]) = [ 32295869 6.38948E+07 ] ;
BALA_LOSS_NEUTRON_LEAK    (idx, [1:   2]) = [ 228800 4.66957E+05 ] ;
BALA_LOSS_NEUTRON_CUT     (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_LOSS_NEUTRON_ERR     (idx, [1:   2]) = [ 0 0.00000E+00 ] ;
BALA_LOSS_NEUTRON_TOT     (idx, [1:   2]) = [ 79215203 1.57381E+08 ] ;

BALA_NEUTRON_DIFF         (idx, [1:   2]) = [ 0 0.00000E+00 ] ;

% Normalized total reaction rates (neutrons):

TOT_POWER                 (idx, [1:   2]) = [  1.00000E+06 0.0E+00 ];
TOT_POWDENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_GENRATE               (idx, [1:   2]) = [  7.47279E+16 2.4E-07 ];
TOT_FISSRATE              (idx, [1:   2]) = [  3.08559E+16 2.0E-08 ];
TOT_CAPTRATE              (idx, [1:   2]) = [  4.49269E+16 0.00033 ];
TOT_ABSRATE               (idx, [1:   2]) = [  7.57829E+16 0.00020 ];
TOT_SRCRATE               (idx, [1:   2]) = [  5.16447E+14 0.01672 ];
TOT_FLUX                  (idx, [1:   2]) = [  2.62237E+19 0.00088 ];
TOT_PHOTON_PRODRATE       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
TOT_LEAKRATE              (idx, [1:   2]) = [  2.25197E+14 0.00437 ];
ALBEDO_LEAKRATE           (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_LOSSRATE              (idx, [1:   2]) = [  7.60081E+16 0.00020 ];
TOT_CUTRATE               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
TOT_RR                    (idx, [1:   2]) = [  7.40244E+18 0.00030 ];
INI_FMASS                 (idx, 1)        =  0.00000E+00 ;
TOT_FMASS                 (idx, 1)        =  0.00000E+00 ;

% Six-factor formula:

SIX_FF_ETA                (idx, [1:   2]) = [  1.67407E+00 0.00028 ];
SIX_FF_F                  (idx, [1:   2]) = [  8.88731E-01 0.00015 ];
SIX_FF_P                  (idx, [1:   2]) = [  1.23412E+02 0.04761 ];
SIX_FF_EPSILON            (idx, [1:   2]) = [  1.71478E+00 0.00032 ];
SIX_FF_LF                 (idx, [1:   2]) = [  9.53782E-01 0.00112 ];
SIX_FF_LT                 (idx, [1:   2]) = [  5.57183E-01 0.01924 ];
SIX_FF_KINF               (idx, [1:   2]) = [  3.08586E+02 0.04868 ];
SIX_FF_KEFF               (idx, [1:   2]) = [  1.47625E+02 0.02021 ];

% Fission neutron and energy production:

NUBAR                     (idx, [1:   2]) = [  2.42183E+00 2.6E-07 ];
FISSE                     (idx, [1:   2]) = [  2.02279E+02 2.0E-08 ];

% Criticality eigenvalues:

ANA_KEFF                  (idx, [1:   6]) = [  9.93132E-01 0.00012  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
IMP_KEFF                  (idx, [1:   2]) = [  9.93604E-01 0.00020 ];
COL_KEFF                  (idx, [1:   2]) = [  9.93139E-01 0.00011 ];
ABS_KEFF                  (idx, [1:   2]) = [  9.93604E-01 0.00020 ];
ABS_KINF                  (idx, [1:   2]) = [  9.96587E-01 0.00020 ];
ANA_EXT_K                 (idx, [1:  20]) = [  1.21630E+00 0.00103  1.14466E+00 0.00105  1.07824E+00 0.00107  1.03713E+00 0.00107  1.01539E+00 0.00105  1.00351E+00 0.00103  9.95298E-01 0.00106  9.95091E-01 0.00102  9.93143E-01 0.00109  9.91284E-01 0.00115 ];
SRC_MULT                  (idx, [1:   2]) = [  1.55728E+02 0.02154 ];
MEAN_NGEN                 (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PROMPT_CHAIN_LENGTH       (idx, [1:   2]) = [  1.03467E+01 0.00275 ];
GEOM_ALBEDO               (idx, [1:   6]) = [  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00  1.00000E+00 0.0E+00 ];

% ALF (Average lethargy of neutrons causing fission):
% Based on E0 = 2.000000E+01 MeV

ANA_ALF                   (idx, [1:   2]) = [  1.63895E+01 7.6E-05 ];
IMP_ALF                   (idx, [1:   2]) = [  1.63887E+01 4.5E-05 ];

% EALF (Energy corresponding to average lethargy of neutrons causing fission):

ANA_EALF                  (idx, [1:   2]) = [  1.52482E-06 0.00125 ];
IMP_EALF                  (idx, [1:   2]) = [  1.52587E-06 0.00074 ];

% AFGE (Average energy of neutrons causing fission):

ANA_AFGE                  (idx, [1:   2]) = [  1.52264E-02 0.00464 ];
IMP_AFGE                  (idx, [1:   2]) = [  1.52078E-02 0.00042 ];

% Forward-weighted delayed neutron parameters:

PRECURSOR_GROUPS          (idx, 1)        = 6 ;
FWD_ANA_BETA_ZERO         (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
FWD_ANA_LAMBDA            (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Beta-eff using Meulekamp's method:

ADJ_MEULEKAMP_BETA_EFF    (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_MEULEKAMP_LAMBDA      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using Nauchi's method:

IFP_CHAIN_LENGTH          (idx, 1)        = 15 ;
ADJ_NAUCHI_GEN_TIME       (idx, [1:   6]) = [  9.62566E-05 0.00063  9.62566E-05 0.00063  0.00000E+00 0.0E+00 ];
ADJ_NAUCHI_LIFETIME       (idx, [1:   6]) = [  9.62566E-05 0.00063  9.62566E-05 0.00063  0.00000E+00 0.0E+00 ];
ADJ_NAUCHI_BETA_EFF       (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_NAUCHI_LAMBDA         (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using IFP:

ADJ_IFP_GEN_TIME          (idx, [1:   6]) = [  9.62848E-05 0.00145  9.62848E-05 0.00145  0.00000E+00 0.0E+00 ];
ADJ_IFP_LIFETIME          (idx, [1:   6]) = [  9.62848E-05 0.00145  9.62848E-05 0.00145  0.00000E+00 0.0E+00 ];
ADJ_IFP_IMP_BETA_EFF      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_IMP_LAMBDA        (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_BETA_EFF      (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ANA_LAMBDA        (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
ADJ_IFP_ROSSI_ALPHA       (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Adjoint weighted time constants using perturbation technique:

ADJ_PERT_GEN_TIME         (idx, [1:   2]) = [  8.36473E-04 0.02065 ];
ADJ_PERT_LIFETIME         (idx, [1:   2]) = [  8.36473E-04 0.02065 ];
ADJ_PERT_BETA_EFF         (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ADJ_PERT_ROSSI_ALPHA      (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Inverse neutron speed :

ANA_INV_SPD               (idx, [1:   2]) = [  5.84494E-07 0.00221 ];

% Analog slowing-down and thermal neutron lifetime (total/prompt/delayed):

ANA_SLOW_TIME             (idx, [1:   6]) = [  3.82445E-05 0.00025  3.82445E-05 0.00025  0.00000E+00 0.0E+00 ];
ANA_THERM_TIME            (idx, [1:   6]) = [  4.60285E-04 0.00322  4.60285E-04 0.00322  0.00000E+00 0.0E+00 ];
ANA_THERM_FRAC            (idx, [1:   6]) = [  6.17582E+01 0.02145  6.17582E+01 0.02145  0.00000E+00 0.0E+00 ];
ANA_DELAYED_EMTIME        (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
ANA_MEAN_NCOL             (idx, [1:   4]) = [  9.74057E+01 5.2E-05  1.02176E+02 6.9E-05 ];

% Group constant generation:

GC_UNIVERSE_NAME          (idx, [1:   1]) = '0' ;

% Micro- and macro-group structures:

MICRO_NG                  (idx, 1)        = 70 ;
MICRO_E                   (idx, [1:  71]) = [  2.00000E+01  6.06550E+00  3.67900E+00  2.23100E+00  1.35300E+00  8.21000E-01  5.00000E-01  3.02500E-01  1.83000E-01  1.11000E-01  6.74300E-02  4.08500E-02  2.47800E-02  1.50300E-02  9.11800E-03  5.50000E-03  3.51910E-03  2.23945E-03  1.42510E-03  9.06898E-04  3.67262E-04  1.48728E-04  7.55014E-05  4.80520E-05  2.77000E-05  1.59680E-05  9.87700E-06  4.00000E-06  3.30000E-06  2.60000E-06  2.10000E-06  1.85500E-06  1.50000E-06  1.30000E-06  1.15000E-06  1.12300E-06  1.09700E-06  1.07100E-06  1.04500E-06  1.02000E-06  9.96000E-07  9.72000E-07  9.50000E-07  9.10000E-07  8.50000E-07  7.80000E-07  6.25000E-07  5.00000E-07  4.00000E-07  3.50000E-07  3.20000E-07  3.00000E-07  2.80000E-07  2.50000E-07  2.20000E-07  1.80000E-07  1.40000E-07  1.00000E-07  8.00000E-08  6.70000E-08  5.80000E-08  5.00000E-08  4.20000E-08  3.50000E-08  3.00000E-08  2.50000E-08  2.00000E-08  1.50000E-08  1.00000E-08  5.00000E-09  1.00000E-11 ];

MACRO_NG                  (idx, 1)        = 2 ;
MACRO_E                   (idx, [1:   3]) = [  1.00000E+37  6.25000E-07  0.00000E+00 ];

% Micro-group spectrum:

INF_MICRO_FLX             (idx, [1: 140]) = [  5.74189E+06 0.01784  2.67388E+07 0.01895  6.58657E+07 0.01760  1.21493E+08 0.01880  1.48033E+08 0.01780  1.75764E+08 0.01701  1.27807E+08 0.01788  1.04775E+08 0.01708  1.57983E+08 0.01887  1.45403E+08 0.01791  1.65114E+08 0.01814  1.55396E+08 0.01778  1.63961E+08 0.01823  1.60430E+08 0.01803  1.62517E+08 0.01882  1.37738E+08 0.01736  1.39399E+08 0.01787  1.40166E+08 0.01802  1.38261E+08 0.01825  2.67684E+08 0.01794  2.53060E+08 0.01707  1.80083E+08 0.01958  1.13450E+08 0.01817  1.26323E+08 0.01755  1.14681E+08 0.01799  9.41813E+07 0.02017  1.55417E+08 0.01725  3.14077E+07 0.01851  3.87366E+07 0.01767  3.48847E+07 0.01749  2.06820E+07 0.02118  3.56488E+07 0.01894  2.41976E+07 0.01664  2.07836E+07 0.01855  4.02300E+06 0.02701  3.86915E+06 0.01542  3.97159E+06 0.01739  4.03257E+06 0.02108  4.08340E+06 0.02691  3.94418E+06 0.02084  4.15362E+06 0.02192  3.81400E+06 0.02029  7.26854E+06 0.01908  1.18397E+07 0.02116  1.52971E+07 0.01939  4.22758E+07 0.01597  5.30142E+07 0.03411  7.08751E+07 0.02124  5.48789E+07 0.02537  4.24855E+07 0.03915  3.39384E+07 0.02777  3.76364E+07 0.02717  6.99451E+07 0.01891  8.51999E+07 0.02581  1.41757E+08 0.02351  1.77097E+08 0.01503  2.07173E+08 0.01637  1.07718E+08 0.02719  7.00637E+07 0.02160  4.64648E+07 0.02569  3.81965E+07 0.03893  3.49426E+07 0.02694  2.85985E+07 0.04329  1.73918E+07 0.03794  1.52549E+07 0.03489  1.28557E+07 0.04430  1.01356E+07 0.03663  7.71031E+06 0.06212  4.31107E+06 0.03691  1.52800E+06 0.08161 ];

% Integral parameters:

INF_KINF                  (idx, [1:   2]) = [  9.96435E-01 0.00040 ];

% Flux spectra in infinite geometry:

INF_FLX                   (idx, [1:   4]) = [  2.09415E+19 0.00875  7.05693E+18 0.01082 ];
INF_FISS_FLX              (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

INF_TOT                   (idx, [1:   4]) = [  3.37797E-01 0.00038  1.17342E-01 0.00256 ];
INF_CAPT                  (idx, [1:   4]) = [  1.71544E-03 0.00054  1.70603E-03 0.00309 ];
INF_ABS                   (idx, [1:   4]) = [  2.37085E-03 0.00047  4.42793E-03 0.00284 ];
INF_FISS                  (idx, [1:   4]) = [  6.55413E-04 0.00042  2.72190E-03 0.00270 ];
INF_NSF                   (idx, [1:   4]) = [  1.58820E-03 0.00042  6.58932E-03 0.00270 ];
INF_NUBAR                 (idx, [1:   4]) = [  2.42320E+00 6.7E-07  2.42085E+00 0.0E+00 ];
INF_KAPPA                 (idx, [1:   4]) = [  2.02292E+02 3.9E-08  2.02270E+02 3.9E-09 ];
INF_INVV                  (idx, [1:   4]) = [  8.49897E-08 0.00121  2.07090E-06 0.00126 ];

% Total scattering cross sections:

INF_SCATT0                (idx, [1:   4]) = [  3.35426E-01 0.00038  1.12912E-01 0.00255 ];
INF_SCATT1                (idx, [1:   4]) = [  2.05906E-02 0.00055  8.49125E-03 0.00218 ];
INF_SCATT2                (idx, [1:   4]) = [  3.42655E-03 0.00147  1.55734E-03 0.00404 ];
INF_SCATT3                (idx, [1:   4]) = [  6.01813E-04 0.00667  5.67779E-04 0.00731 ];
INF_SCATT4                (idx, [1:   4]) = [  2.26119E-04 0.01641  2.65419E-04 0.01782 ];
INF_SCATT5                (idx, [1:   4]) = [  4.90676E-05 0.06344  1.58824E-04 0.02148 ];
INF_SCATT6                (idx, [1:   4]) = [  2.24702E-05 0.16537  9.13059E-05 0.05604 ];
INF_SCATT7                (idx, [1:   4]) = [  8.57412E-06 0.24444  6.95437E-05 0.04051 ];

% Total scattering production cross sections:

INF_SCATTP0               (idx, [1:   4]) = [  3.35467E-01 0.00038  1.12912E-01 0.00255 ];
INF_SCATTP1               (idx, [1:   4]) = [  2.06014E-02 0.00055  8.49125E-03 0.00218 ];
INF_SCATTP2               (idx, [1:   4]) = [  3.42847E-03 0.00146  1.55734E-03 0.00404 ];
INF_SCATTP3               (idx, [1:   4]) = [  6.02084E-04 0.00663  5.67779E-04 0.00731 ];
INF_SCATTP4               (idx, [1:   4]) = [  2.26116E-04 0.01636  2.65419E-04 0.01782 ];
INF_SCATTP5               (idx, [1:   4]) = [  4.89555E-05 0.06389  1.58824E-04 0.02148 ];
INF_SCATTP6               (idx, [1:   4]) = [  2.23662E-05 0.16599  9.13059E-05 0.05604 ];
INF_SCATTP7               (idx, [1:   4]) = [  8.52444E-06 0.24498  6.95437E-05 0.04051 ];

% Diffusion parameters:

INF_TRANSPXS              (idx, [1:   4]) = [  2.99592E-01 0.00038  9.85582E-02 0.00312 ];
INF_DIFFCOEF              (idx, [1:   4]) = [  1.11263E+00 0.00038  3.38239E+00 0.00314 ];

% Reduced absoption and removal:

INF_RABSXS                (idx, [1:   4]) = [  2.33015E-03 0.00048  4.42793E-03 0.00284 ];
INF_REMXS                 (idx, [1:   4]) = [  4.33690E-03 0.00041  5.80658E-03 0.00268 ];

% Poison cross sections:

INF_I135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_YIELD          (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MICRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_I135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_XE135_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM147_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM148M_MACRO_ABS      (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_PM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_SM149_MACRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison universe-averaged densities:

I135_ADENS                (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
XE135_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM147_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM148_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM148M_ADENS              (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
PM149_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
SM149_ADENS               (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Poison decay constants:

PM147_LAMBDA              (idx, 1)        =  8.37272E-09 ;
PM148_LAMBDA              (idx, 1)        =  1.49451E-06 ;
PM148M_LAMBDA             (idx, 1)        =  1.95433E-07 ;
PM149_LAMBDA              (idx, 1)        =  3.62737E-06 ;
I135_LAMBDA               (idx, 1)        =  2.93061E-05 ;
XE135_LAMBDA              (idx, 1)        =  2.10657E-05 ;
XE135M_LAMBDA             (idx, 1)        =  7.55556E-04 ;
I135_BR                   (idx, 1)        =  8.34914E-01 ;

% Fission spectra:

INF_CHIT                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHIP                  (idx, [1:   4]) = [  1.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
INF_CHID                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

INF_S0                    (idx, [1:   8]) = [  3.33460E-01 0.00038  1.96666E-03 0.00071  1.37723E-03 0.00249  1.11535E-01 0.00256 ];
INF_S1                    (idx, [1:   8]) = [  2.10059E-02 0.00054 -4.15295E-04 0.00133 -3.07806E-05 0.02060  8.52203E-03 0.00215 ];
INF_S2                    (idx, [1:   8]) = [  3.48389E-03 0.00144 -5.73329E-05 0.00750 -6.44685E-05 0.01153  1.62180E-03 0.00400 ];
INF_S3                    (idx, [1:   8]) = [  6.19365E-04 0.00643 -1.75520E-05 0.01521 -3.01328E-05 0.01156  5.97912E-04 0.00667 ];
INF_S4                    (idx, [1:   8]) = [  2.35023E-04 0.01577 -8.90444E-06 0.02937 -1.61940E-05 0.03452  2.81613E-04 0.01741 ];
INF_S5                    (idx, [1:   8]) = [  5.26756E-05 0.06242 -3.60807E-06 0.08879 -8.21663E-06 0.03441  1.67041E-04 0.02117 ];
INF_S6                    (idx, [1:   8]) = [  2.45809E-05 0.15434 -2.11069E-06 0.06178 -5.38377E-06 0.05586  9.66897E-05 0.05356 ];
INF_S7                    (idx, [1:   8]) = [  9.70650E-06 0.21896 -1.13238E-06 0.20147 -3.36604E-06 0.08524  7.29097E-05 0.04032 ];

% Scattering production matrixes:

INF_SP0                   (idx, [1:   8]) = [  3.33500E-01 0.00038  1.96666E-03 0.00071  1.37723E-03 0.00249  1.11535E-01 0.00256 ];
INF_SP1                   (idx, [1:   8]) = [  2.10167E-02 0.00054 -4.15295E-04 0.00133 -3.07806E-05 0.02060  8.52203E-03 0.00215 ];
INF_SP2                   (idx, [1:   8]) = [  3.48580E-03 0.00143 -5.73329E-05 0.00750 -6.44685E-05 0.01153  1.62180E-03 0.00400 ];
INF_SP3                   (idx, [1:   8]) = [  6.19636E-04 0.00639 -1.75520E-05 0.01521 -3.01328E-05 0.01156  5.97912E-04 0.00667 ];
INF_SP4                   (idx, [1:   8]) = [  2.35021E-04 0.01572 -8.90444E-06 0.02937 -1.61940E-05 0.03452  2.81613E-04 0.01741 ];
INF_SP5                   (idx, [1:   8]) = [  5.25635E-05 0.06285 -3.60807E-06 0.08879 -8.21663E-06 0.03441  1.67041E-04 0.02117 ];
INF_SP6                   (idx, [1:   8]) = [  2.44768E-05 0.15489 -2.11069E-06 0.06178 -5.38377E-06 0.05586  9.66897E-05 0.05356 ];
INF_SP7                   (idx, [1:   8]) = [  9.65681E-06 0.21944 -1.13238E-06 0.20147 -3.36604E-06 0.08524  7.29097E-05 0.04032 ];

% Micro-group spectrum:

B1_MICRO_FLX              (idx, [1: 140]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Integral parameters:

B1_KINF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_KEFF                   (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_B2                     (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];
B1_ERR                    (idx, [1:   2]) = [  0.00000E+00 0.0E+00 ];

% Critical spectra in infinite geometry:

B1_FLX                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS_FLX               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reaction cross sections:

B1_TOT                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CAPT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_ABS                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_FISS                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NSF                    (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_NUBAR                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_KAPPA                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_INVV                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering cross sections:

B1_SCATT0                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT1                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT2                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT3                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT4                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT5                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT6                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATT7                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Total scattering production cross sections:

B1_SCATTP0                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP1                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP2                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP3                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP4                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP5                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP6                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SCATTP7                (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Diffusion parameters:

B1_TRANSPXS               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_DIFFCOEF               (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Reduced absoption and removal:

B1_RABSXS                 (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_REMXS                  (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Poison cross sections:

B1_I135_YIELD             (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_YIELD           (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_YIELD            (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_I135_MICRO_ABS         (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM147_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM148M_MICRO_ABS       (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_PM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MICRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_XE135_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SM149_MACRO_ABS        (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Fission spectra:

B1_CHIT                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHIP                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_CHID                   (idx, [1:   4]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering matrixes:

B1_S0                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S1                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S2                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S3                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S4                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S5                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S6                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_S7                     (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Scattering production matrixes:

B1_SP0                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP1                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP2                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP3                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP4                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP5                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP6                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
B1_SP7                    (idx, [1:   8]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

% Additional diffusion parameters:

CMM_TRANSPXS              (idx, [1:   4]) = [  1.51687E-01 0.00128  1.05517E+00 0.01695 ];
CMM_TRANSPXS_X            (idx, [1:   4]) = [  1.39935E-01 0.00151  1.23289E+00 0.03604 ];
CMM_TRANSPXS_Y            (idx, [1:   4]) = [  1.57679E-01 0.00151  1.42150E+00 0.04348 ];
CMM_TRANSPXS_Z            (idx, [1:   4]) = [  1.59005E-01 0.00226  7.62516E-01 0.01327 ];
CMM_DIFFCOEF              (idx, [1:   4]) = [  2.19754E+00 0.00128  3.16728E-01 0.01708 ];
CMM_DIFFCOEF_X            (idx, [1:   4]) = [  2.38210E+00 0.00151  2.73916E-01 0.04044 ];
CMM_DIFFCOEF_Y            (idx, [1:   4]) = [  2.11405E+00 0.00151  2.38420E-01 0.04237 ];
CMM_DIFFCOEF_Z            (idx, [1:   4]) = [  2.09646E+00 0.00227  4.37847E-01 0.01337 ];

% Delayed neutron parameters (Meulekamp method):

BETA_EFF                  (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];
LAMBDA                    (idx, [1:  14]) = [  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00  0.00000E+00 0.0E+00 ];

