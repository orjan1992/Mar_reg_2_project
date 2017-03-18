clear, close all, clc
%% model
Par.Model.nu_0 = [0 0 0];
Par.Model.eta_0 = [1 1 0];
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
Par.Noise.Enable = 0;
Par.Noise.power = 1e-4;
Par.Noise.Sample_freq = 100;

Par.Freeze.Enable = 0;
Par.Freeze.length = 1.5;
Par.Freeze.threshold = 8;%3.0;
Par.Freeze.Power = 1;
Par.Sample_time = 1/Par.Noise.Sample_freq;

%% thruster
Par.Thrust_lim = [1.03 2.5 0.98]';

%% Observer
L_1 = [1 1 1]*5;
L_2 = [1 1 1]*1;
L_3 = [1 1 1]*1;
Par.Observer.M_inv = inv([16.79 0 0; 0 15.7900 0.5546; 0 0.5546 2.7600]);
Par.Observer.L_1 = diag(L_1);
Par.Observer.L_2 = diag(L_2);
Par.Observer.L_3 = diag(L_3);
Par.Observer.x_0 = [1 1 0 0 0 0 0 0 0];

%% DP
Par.Guidance.mu = 1;
Par.Guidance.U_ref = 0.1; %m/s
Par.Guidance.U_ref_dot = 0; %m/s
Par.Guidance.s_0 = 0;
Par.Guidance.eta_d_0 = [1 1 0];
Par.Guidance.eta_d_1 = [10 10 0];
Par.Guidance.K_p = diag([0.2 0.2 0.1]);
Par.Guidance.alfa_1_0 = [0 0 0];
Par.Guidance.C_2 = 1;
Par.Guidance.z_1_0 = [0 0 0];

sim('main_luenberger');
% %% checking L matrices
% if all(eig(Par.Observer.L_1*Par.Observer.L_2+ Par.Observer.L_2*Par.Observer.L_1)) > 0
%     fprintf('All eigenvalues OK for no Bias\n');
% end
% if sum(sum(Par.Observer.L_3 ~= zeros(3))) >= 1
%     if all(eig(Par.Observer.L_1*Par.Observer.L_2+ Par.Observer.L_2*Par.Observer.L_1 - 2*Par.Observer.L_3) > 0)...
%             && all(eig(Par.Observer.L_3\Par.Observer.L_1 - inv(Par.Observer.L_2)) > 0)
%         fprintf('Eigenvalues OK for bias.\n');
%     else
%         fprintf('Eigenvalues NOT OK.\n');
%     end
% end
plot_luenberger;

