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
alfa1 = x(26:28, l);

eta_hat(3, l) = eta_hat(3, l)*180/pi;
nu_hat(3, l) = nu_hat(3, l)*180/pi;
eta(3, l) = eta(3, l)*180/pi;
eta_m(3, l) = eta_m(3, l)*180/pi;
nu(3, l) = nu(3, l)*180/pi;
eta_d(3, l) = eta_d(3, l)*180/pi;
alfa1(3, l) = alfa1(3, l)*180/pi;

eta_tilde = eta-eta_hat;
nu_tilde = nu-nu_hat;
eta_d_tilde = eta_d - eta_hat;
z_2 = nu_hat-alfa1;
close all
report_plot = 0;
if report_plot
else
    %% Eta
    % x
    f1 = figure;
    subplot(3, 2, 1);
    plot(t, eta_hat(1, l), t, eta(1, l), t, eta_d(1, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title('\eta x');
    legend({'$\hat{x}$', 'x', '$x_d$'},'Interpreter','latex');
    grid on;
    % y
    subplot(3, 2, 3);
    plot(t, eta_hat(2, l), t, eta(2, l), t, eta_d(2, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title('\eta y');
    legend({'$\hat{y}$', 'y', '$y_d$'},'Interpreter','latex');
    grid on;
    % y
    subplot(3, 2, 5);
    plot(t, eta_hat(3, l), t, eta(3, l), t, eta_d(3, l));
    xlabel('Time [s]');
    ylabel('Angle [degrees]');
    title('\eta \psi');
    legend({'$\hat{\psi}$', '$\psi$', '$\psi_d$'},'Interpreter','latex');
    grid on;

    % x tilde
    subplot(3, 2, 2);
    plot(t, eta_tilde(1, l), t, eta_d_tilde(1, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\tilde{x}$'}, 'Interpreter','latex');
    legend({'$\tilde{\eta}$ x', '$RZ_1$ x'},'Interpreter','latex');
    grid on;
    % y tilde
    subplot(3, 2, 4);
    plot(t, eta_tilde(2, l), t, eta_d_tilde(2, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\tilde{y}$'}, 'Interpreter','latex');
    legend({'$\tilde{\eta}$ y', '$RZ_1$ y'},'Interpreter','latex');
    grid on;
    % psi tilde
    subplot(3, 2, 6);
    plot(t, eta_tilde(3, l), t, eta_d_tilde(3, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\tilde{\psi}$'}, 'Interpreter','latex');
    legend({'$\tilde{\eta}~\psi$', '$RZ_1~\psi$'},'Interpreter','latex');
    grid on;

    %% Nu
    % u
    f2 = figure;
    subplot(3, 2, 1);
    plot(t, nu_hat(1, l), t, nu(1, l), t, alfa1(1, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\nu$ u'},'Interpreter','latex');
    legend({'$\hat{\nu}~u$', 'u', '$\alpha_1$'},'Interpreter','latex');
    grid on;
    % v
    subplot(3, 2, 3);
    plot(t, nu_hat(2, l), t, nu(2, l), t, alfa1(2, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\nu$ v'},'Interpreter','latex');
    legend({'$\hat{\nu}~v$', 'v', '$\alpha_1$'},'Interpreter','latex');
    grid on;
    % r
    subplot(3, 2, 5);
    plot(t, nu_hat(3, l), t, nu(3, l), t, alfa1(3, l));
    xlabel('Time [s]');
    ylabel('Angle [degrees]');
    title('$\nu$ r','Interpreter','latex');
    legend({'$\hat{\nu}~r$', '$\alpha_1$'},'Interpreter','latex');
    grid on;

    % x tilde
    subplot(3, 2, 2);
    plot(t, nu_tilde(1, l), t, z_2(1, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\tilde{\nu}~u$'},'Interpreter','latex');
    legend({'$\tilde{\nu}~u$', '$z_2$'},'Interpreter','latex');
    grid on;
    % u tilde
    subplot(3, 2, 4);
    plot(t, nu_tilde(2, l), t, z_2(2, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\tilde{\nu}~v$'},'Interpreter','latex');
    legend({'$\tilde{\nu}~v$', '$z_2$'},'Interpreter','latex');
    grid on;
    % u tilde
    subplot(3, 2, 6);
    plot(t, nu_tilde(3, l), t, z_2(3, l));
    xlabel('Time [s]');
    ylabel('Angle [degrees]');
    title({'$\tilde{\nu}~r$'},'Interpreter','latex');
    legend({'$\tilde{\nu}~r$', '$z_2$'},'Interpreter','latex');
    grid on;

    % %% bias
    % % b1
    % f3 = figure;
    % subplot(3, 1, 1);
    % plot(t, b_hat(1, l));
    % xlabel('Time [s]');
    % ylabel('Force [N]');
    % title('Bias x');
    % % b1
    % subplot(3, 1, 2);
    % plot(t, b_hat(2, l));
    % xlabel('Time [s]');
    % ylabel('Force [N]');
    % title('Bias y');
    % % b1
    % subplot(3, 1, 3);
    % plot(t, b_hat(3, l));
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
    grid on;
    % u tilde
    subplot(3, 1, 2);
    plot(t, tau(2, l));
    xlabel('Time [s]');
    ylabel('Y');
    title('\tau_y, Y');
    grid on;
    % u tilde
    subplot(3, 1, 3);
    plot(t, tau(3, l));
    xlabel('Time [s]');
    ylabel('R');
    title('\tau_\psi, R');
    grid on;

    %% xy plot
    f5 = figure;
    plot(eta_hat(2, l), eta_hat(1, l));
    hold on;
    plot(eta(2, l), eta(1, l));
    plot(eta_d(2, l), eta_d(1, l));
    j = 0;
    k = 1;
    for i = l
        if t(i) >= j
            ha(k) = annotation('textarrow', 'String',strcat('t = ', num2str(t(i))));  % store the arrow information in ha(i)
            ha(k).Parent = gca;           % associate the arrow the the current axes
            ha(k).X = [eta(2, i), eta(2, i)+sin(eta(3, i)*pi/180)];          % the location in data units
            ha(k).Y = [eta(1, i), eta(1, i)+cos(eta(3, i)*pi/180)];   
            k = k+1;
            j = j+40;
        end
    end
    Par.Guidance.r = [6 1];
    Par.Guidance.c = [5 3];
    % s = 0:0.01:2*pi;
    s = -30:0.1:100;
    for i = 1:length(s)
        x_d(i) = Par.Guidance.r(1)*cos(s(i)) + Par.Guidance.c(1);
        y_d(i) = Par.Guidance.r(2)*sin(s(i)) + Par.Guidance.c(2);
    end

    % lim = [min([xlim, ylim]) max([xlim, ylim])];
    % xlim(lim);
    % ylim(lim);
    % legend({'$\hat{\eta}$', '$\eta$' '$\eta_d$'},'Interpreter','latex');
    % 
    % f6 = figure;
    % tri_size = 1;
    % N_frames = 200;
    % l2 = 1:floor(length(l)/N_frames):length(l);
    % 
    % for i = l2
    %     r = eta(3, i)*pi/180;
    %     x = eta(2, i);
    %     y = eta(1, i);
    %     plot(eta(2, 1:i), eta(1, 1:i), 'b');
    %     axis([lim lim])
    %     hold on;
    %     plot([x+cos(r + pi/2)*tri_size/2, x+cos(r)*tri_size], [y+sin(r + pi/2)*tri_size/2, y+sin(r)*tri_size], 'Color', 'r');
    %     plot([x+cos(r - pi/2)*tri_size/2, x+cos(r)*tri_size], [y+sin(r - pi/2)*tri_size/2, y+sin(r)*tri_size], 'Color', 'r');
    %     plot([x+cos(r + pi/2)*tri_size/2, x+cos(r - pi/2)*tri_size/2], [y+sin(r + pi/2)*tri_size/2, y+sin(r - pi/2)*tri_size/2], 'Color', 'r');
    %     hold off;
    %     M(i)=getframe(gca);
    % end
end