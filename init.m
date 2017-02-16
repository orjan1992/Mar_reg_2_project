clear
eta_0 = [0 0 0];
nu_0 =[0 0 0];
%Par.tau_max = [1.03 0 0];
Par.K_psi_init = 0.28;

%%thrust for simulink sim
Par.Thrust = [1 0 0; 0.5 0 0];
Par.thrust_time = [0; 10];

%% outside workspace
Par.Workspace.origin = [0, 0]';
Par.Workspace.threshold = 2;
Par.Workspace.scale = 100;
Par.Workspace.x_max_limit = 100;
Par.Workspace.x_min_limit = -Par.Workspace.x_max_limit;
Par.Workspace.y_min_limit = -Par.Workspace.x_max_limit;
Par.Workspace.y_max_limit = Par.Workspace.x_max_limit;

Par.Workspace.x_min = Par.Workspace.x_min_limit + Par.Workspace.threshold;
Par.Workspace.x_max = Par.Workspace.x_max_limit - Par.Workspace.threshold;
Par.Workspace.y_min = Par.Workspace.y_min_limit + Par.Workspace.threshold;
Par.Workspace.y_max = Par.Workspace.y_max_limit - Par.Workspace.threshold;

%% noise and dropout
Par.SensNoiseEnabled = 1;
Par.Freeze.Enable = 0;
Par.Freeze.length = 2;
Par.Freeze.threshold = 2.8;%3.0;

Par.Step_size = 0.01;
Par.Sample_time = 0.01;
Par.Sample_rate = 1/Par.Sample_time;

%% thruster
Par.Thrust_lim = [1.03 2.5 0.98]';

%% Lowpass filter
Par.Lowpass.omega.c_u = 100;
Par.Lowpass.omega.c_v = Par.Lowpass.omega.c_u;
Par.Lowpass.omega.c_psi = Par.Lowpass.omega.c_u;

sim('main', 'FixedStep', num2str(Par.Sample_time));