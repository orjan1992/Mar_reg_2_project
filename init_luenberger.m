clear

%%thrust for simulink sim
Par.Thrust = [1 0 0; -1 0 0];
Par.thrust_time = [0; 50];

%% outside workspace
Par.Workspace.origin = [0, 0]';
Par.Workspace.threshold = 2.2;
Par.Workspace.scale = 250;
Par.Workspace.x_max_limit = 100;
Par.Workspace.x_min_limit = -Par.Workspace.x_max_limit;
Par.Workspace.y_min_limit = -Par.Workspace.x_max_limit;
Par.Workspace.y_max_limit = Par.Workspace.x_max_limit;

Par.Workspace.x_min = Par.Workspace.x_min_limit + Par.Workspace.threshold;
Par.Workspace.x_max = Par.Workspace.x_max_limit - Par.Workspace.threshold;
Par.Workspace.y_min = Par.Workspace.y_min_limit + Par.Workspace.threshold;
Par.Workspace.y_max = Par.Workspace.y_max_limit - Par.Workspace.threshold;

%% noise and dropout
Par.Freeze.Enable = 0;
Par.Freeze.length = 1.5;
Par.Freeze.threshold = 8;%3.0;
Par.Freeze.Power = 1;

Par.Noise.Enable = 0;
Par.Noise.power = 1e-3;
Par.Noise.Sample_freq = 100;
%% thruster
Par.Thrust_lim = [1.03 2.5 0.98]';

%% Observer
L_1 = [1 1 1];
L_2 = [1 1 1];
L_3 = [0 0 0];
Par.Observer.M_inv = inv([16.79 0 0; 0 15.7900 0.5546; 0 0.5546 2.7600]);
Par.Observer.L_1 = diag(L_1);
Par.Observer.L_2 = diag(L_2);
Par.Observer.L_3 = diag(L_3);