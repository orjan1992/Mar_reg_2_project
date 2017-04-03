function [ fig_out ] = multiplot( plot_var, fig_in, K_p, last)
%MULTIPLOT Summary of this function goes here
%   Detailed explanation goes here
persistent leg i;
if isempty(leg)
    leg = {1, 1};
end
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

switch plot_var
    case {'x_tilde'}
        %% Eta
        % x
        if isempty(i)
            i = 1;
        end
        if isempty(fig_in)
            fig_in(1) = figure;
        else
            figure(fig_in(1));
        end
        if last
            legend(leg,'Interpreter','latex');
        else
            % x tilde
            hold on;
            plot(t, eta_tilde(1, l));
            xlabel('Time [s]');
            ylabel('Distance [m]');
            title({'$\tilde{x}$ with different values for $K_p(1, 1)$'}, 'Interpreter','latex');
%             legend({'$\tilde{\eta}$ x', '$RZ_1$ x'},'Interpreter','latex');
            leg(1, i) = {num2str(K_p)};
            i = i+1;
            grid on;
        end
end
fig_out = fig_in;
end

