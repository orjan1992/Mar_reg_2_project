close all
fname = 'test.csv';
M = csvread(fname, 1, 0);

l = 1:size(M, 1);
t = M(l, 26)';
t = t - t(1);

eta_d = [M(l, 1)';M(l, 2)';M(l, 3)'];
eta_m = [M(l, 4)';M(l, 5)';M(l, 6)'];
alpha = [M(l, 7)';M(l, 8)';M(l, 9)'];
s = M(l, 10)';
tau_d = [M(l, 11)';M(l, 12)';M(l, 13)'];
tau_out = [M(l, 14)';M(l, 15)';M(l, 16)'];
eta_hat = [M(l, 17)';M(l, 18)';M(l, 19)'];
nu_hat = [M(l, 20)';M(l, 21)';M(l, 22)'];
b_hat = [M(l, 23)';M(l, 24)';M(l, 25)'];
b_hat = [M(l, 23)';M(l, 24)';M(l, 25)'];



eta_tilde = eta_m-eta_hat;
nu_bar = alpha-nu_hat;
for i = l
    R = [cos(eta_hat(3, i)) -sin(eta_hat(3, i)) 0; sin(eta_hat(3, i)) cos(eta_hat(3, i)) 0; 0 0 1];
    eta_d_tilde(:,i) = R*(eta_d(:, i) - eta_hat(:, i));
end
z_2 = nu_hat-alpha;
    %% Eta
    % x
    f1 = figure;
    subplot(3, 2, 1);
    plot(t, eta_hat(1, l), t, eta_m(1, l), t, eta_d(1, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title('\eta x');
    legend({'$\hat{x}$', 'x', '$x_d$'},'Interpreter','latex');
    grid on;
    % y
    subplot(3, 2, 3);
    plot(t, eta_hat(2, l), t, eta_m(2, l), t, eta_d(2, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title('\eta y');
    legend({'$\hat{y}$', 'y', '$y_d$'},'Interpreter','latex');
    grid on;
    % y
    subplot(3, 2, 5);
    plot(t, eta_hat(3, l), t, eta_m(3, l), t, eta_d(3, l));
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
    plot(t, nu_hat(1, l), t, alpha(1, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\nu$ u'},'Interpreter','latex');
    legend({'$\hat{\nu}~u$', 'u', '$\alpha_1$'},'Interpreter','latex');
    grid on;
    % v
    subplot(3, 2, 3);
    plot(t, nu_hat(2, l), t, alpha(2, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\nu$ v'},'Interpreter','latex');
    legend({'$\hat{\nu}~v$', 'v', '$\alpha_1$'},'Interpreter','latex');
    grid on;
    % r
    subplot(3, 2, 5);
    plot(t, nu_hat(3, l), t, alpha(3, l));
    xlabel('Time [s]');
    ylabel('Angle [degrees]');
    title('$\nu$ r','Interpreter','latex');
    legend({'$\hat{\nu}~r$', '$\alpha_1$'},'Interpreter','latex');
    grid on;

    % x tilde
    subplot(3, 2, 2);
    plot(t, nu_bar(1, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\tilde{\nu}~u$'},'Interpreter','latex');
    legend({'$\tilde{\nu}~u$', '$z_2$'},'Interpreter','latex');
    grid on;
    % u tilde
    subplot(3, 2, 4);
    plot(t, nu_bar(2, l));
    xlabel('Time [s]');
    ylabel('Distance [m]');
    title({'$\tilde{\nu}~v$'},'Interpreter','latex');
    legend({'$\tilde{\nu}~v$', '$z_2$'},'Interpreter','latex');
    grid on;
    % u tilde
    subplot(3, 2, 6);
    plot(t, nu_bar(3, l));
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
    plot(t, tau_out(1, l));
    xlabel('Time [s]');
    ylabel('X');
    title('\tau_x, X');
    grid on;
    % u tilde
    subplot(3, 1, 2);
    plot(t, tau_out(2, l));
    xlabel('Time [s]');
    ylabel('Y');
    title('\tau_y, Y');
    grid on;
    % u tilde
    subplot(3, 1, 3);
    plot(t, tau_out(3, l));
    xlabel('Time [s]');
    ylabel('R');
    title('\tau_\psi, R');
    grid on;

    %% xy plot
    f5 = figure;
    plot(eta_hat(2, l), eta_hat(1, l));
    hold on;
    plot(eta_d(2, l), eta_d(1, l));
    j = 0;
    k = 1;
    for i = l
        if t(i) >= j
            ha(k) = annotation('textarrow', 'String',strcat('t = ', num2str(t(i))));  % store the arrow information in ha(i)
            ha(k).Parent = gca;           % associate the arrow the the current axes
            ha(k).X = [eta_hat(2, i), eta_hat(2, i)+sin(eta_hat(3, i)*pi/180)];          % the location in data units
            ha(k).Y = [eta_hat(1, i), eta_hat(1, i)+cos(eta_hat(3, i)*pi/180)];   
            k = k+1;
            j = j+40;
        end
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