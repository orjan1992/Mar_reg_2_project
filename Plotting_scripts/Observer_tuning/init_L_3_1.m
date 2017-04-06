clear, close all, clc
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
Par.Noise.Enable = 1;
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
L_1 = [1 1 1];
L_2 = [2 2 2];
L_3 = [1 1 1]*1;
Par.Observer.M_inv = inv([16.79 0 0; 0 15.7900 0.5546; 0 0.5546 2.7600]);
Par.Observer.L_1 = diag(L_1);
Par.Observer.L_2 = diag(L_2);
Par.Observer.L_3 = diag(L_3);
Par.Observer.x_0 = zeros(9, 1);
Par.Model.Eta_0 = [11, 3, pi/2];
Par.Observer.x_0(1:3) = Par.Model.Eta_0;

%% DP
Par.Guidance.mu = 0;
Par.Guidance.U_ref = 0.05; %m/s
Par.Guidance.U_ref_dot = 0; %m/s
Par.Guidance.s_0 = 0;
Par.Guidance.eta_d_0 = Par.Model.Eta_0 + [0.1 0.1 0];
Par.Guidance.eta_d_1 = [10 10 0];
Par.Guidance.K_p = diag([0.1 0.2 0.5]);
Par.Guidance.c_2 = 1.8;
Par.Guidance.M = [16.79 0 0; 0 15.7900 0.5546; 0 0.5546 2.7600];
Par.Guidance.Ellipsoid = 1;
Par.Guidance.r = [6 1];
Par.Guidance.c = [5 3];
Par.Guidance.constant_heading = 0;
Par.Guidance.heading = pi/2;
%    fig = figure();
L = [2 1 0.5 0.1 0.01];
f1 = figure();
% f2 = figure();
leg ={};
for i = 1:length(L)
    Par.Observer.L_3(1,1) = L(i);
    sim('main_luenberger');
    pause(2);
    load('log.mat', 'x');

    l = 1:length(x(1, :));
    t = x(1, l);
%     eta = x(11:13, l);
%     eta_hat = x(2:4, l);
%     eta_tilde = eta-eta_hat;
    nu = x(17:19, l);
    nu_hat = x(5:7, l);
    nu_tilde = nu-nu_hat;
%     figure(f2);
%     hold on;
%     plot(t, eta_tilde(1, l), 'Linewidth', 1.5);
    figure(f1);
    hold on;
    plot(t, nu_tilde(1, l), 'Linewidth', 1.5);
    leg{i} = num2str(L(i));
    variance(i) = var(nu_tilde(1, l));
    fprintf('L = %f\n', L(i));
    if sum(sum(Par.Observer.L_3 ~= zeros(3))) >= 1
    if all(eig(Par.Observer.L_1*Par.Observer.L_2+ Par.Observer.L_2*Par.Observer.L_1 - 2*Par.Observer.L_3) > 0)...
            && all(eig(Par.Observer.L_3\Par.Observer.L_1 - inv(Par.Observer.L_2)) > 0)
        fprintf('Eigenvalues OK for bias.\n');
    else
        fprintf('Eigenvalues NOT OK.\n');
    end
end
    %fprintf('K_p = %4.2f, \t\t Var(eta_tilde) = %5.4d\n', K_p(i), var(eta_tilde(1, l)));
%     fig = multiplot('x_tilde', fig, K_p(i), 0);
    pause(2);
end
figure(f1);
legend(leg, 'Interpreter', 'Latex');
xlabel('Time [s]');
ylabel('[m/s]');
title('$\tilde{u}$ with different values of $L_3(1,1)$', 'Interpreter', 'Latex');
grid on;
print('L_3_1','-depsc')
% figure(f2);
% legend(leg, 'Interpreter', 'Latex');
% xlabel('Time [s]');
% ylabel('[m]');
% title('$\tilde{x}$ with different values of $L_3(1,1)$', 'Interpreter', 'Latex');
% grid on;
