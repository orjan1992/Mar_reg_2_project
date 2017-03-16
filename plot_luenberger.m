close all
load('log.mat', 'x');

l = 1:length(x(1, :));
t = x(1, l);

eta_hat = x(2:4, l);
nu_hat = x(5:7, l);
b_hat = x(8:10, l);
eta = x(11:13, l);
eta_m = x(14:16, l);
nu = x(17:19, l);
tau = x(20:22, l);
eta_d = x(23:25, l);
eta_tilde = eta-eta_hat;
nu_tilde = nu-nu_hat;
hold on
close all

%% Eta
% x
f1 = figure;
subplot(3, 2, 1);
plot(t, eta_hat(1, :), t, eta(1, :), t, eta_d(1, :));
xlabel('Time [s]');
ylabel('Distance [m]');
title('Eta x');
legend('x hat', 'x', 'x_d');
% y
subplot(3, 2, 3);
plot(t, eta_hat(2, :), t, eta(2, :), t, eta_d(2, :));
xlabel('Time [s]');
ylabel('Distance [m]');
title('Eta y');
legend('y hat', 'y', 'y_d');
% y
subplot(3, 2, 5);
plot(t, eta_hat(3, :), t, eta(3, :), t, eta_d(3, :));
xlabel('Time [s]');
ylabel('Distance [m]');
title('Eta \psi');
legend('\psi hat', '\psi', '\psi_d');

% x tilde
subplot(3, 2, 2);
plot(t, eta_tilde(1, l));
xlabel('Time [s]');
ylabel('Distance [m]');
title('Eta tilde x');
% x tilde
subplot(3, 2, 4);
plot(t, eta_tilde(2, l));
xlabel('Time [s]');
ylabel('Distance [m]');
title('Eta tilde y');
% x tilde
subplot(3, 2, 6);
plot(t, eta_tilde(3, l));
xlabel('Time [s]');
ylabel('Distance [m]');
title('Eta tilde psi');

%% Nu
% x
f2 = figure;
subplot(3, 2, 1);
plot(t, nu_hat(1, :), t, nu(1, :));
xlabel('Time [s]');
ylabel('Distance [m]');
title('nu u');
legend('u hat', 'u');
% y
subplot(3, 2, 3);
plot(t, nu_hat(2, :), t, nu(2, :));
xlabel('Time [s]');
ylabel('Distance [m]');
title('nu v');
legend('v hat', 'v');
% y
subplot(3, 2, 5);
plot(t, nu_hat(3, :), t, nu(3, :));
xlabel('Time [s]');
ylabel('Distance [m]');
title('nu r');
legend('r hat', 'r');

% x tilde
subplot(3, 2, 2);
plot(t, nu_tilde(1, l));
xlabel('Time [s]');
ylabel('Distance [m]');
title('nu tilde u');
% u tilde
subplot(3, 2, 4);
plot(t, nu_tilde(2, l));
xlabel('Time [s]');
ylabel('Distance [m]');
title('nu tilde v');
% u tilde
subplot(3, 2, 6);
plot(t, nu_tilde(3, l));
xlabel('Time [s]');
ylabel('Distance [m]');
title('nu tilde r');

% %% bias
% % b1
% f3 = figure;
% subplot(3, 1, 1);
% plot(t, b_hat(1, :));
% xlabel('Time [s]');
% ylabel('Force [N]');
% title('Bias x');
% % b1
% subplot(3, 1, 2);
% plot(t, b_hat(2, :));
% xlabel('Time [s]');
% ylabel('Force [N]');
% title('Bias y');
% % b1
% subplot(3, 1, 3);
% plot(t, b_hat(3, :));
% xlabel('Time [s]');
% ylabel('Force [Nm]');
% title('Bias r');
% hold off
%% tau
f4 = figure;
%tau X
subplot(3, 1, 1);
plot(t, tau(1, l));
xlabel('Time [s]');
ylabel('X');
title('\tau_x, X');
% u tilde
subplot(3, 1, 2);
plot(t, tau(2, l));
xlabel('Time [s]');
ylabel('Y');
title('\tau_y, Y');
% u tilde
subplot(3, 1, 3);
plot(t, tau(3, l));
xlabel('Time [s]');
ylabel('R');
title('\tau_\psi, R');