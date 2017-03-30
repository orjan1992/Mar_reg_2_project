clear, close all
eta_0 = [0 0 0];
nu_0 =[0 0 0];
tau = [1.03 0 0];
Par.SensNoiseEnabled = 0;
Par.Freeze.Enable = 0;
Par.Freeze.length = 1
Par.Freeze.threshold = 2.6;

Par.Step_size = 0.01;
Par.Sample_time = 0.1;
Par.Thrust_lim = [1.03 2.5 0.98]';
error = 0;
k = -0.3:0.05:0.1;
u_hat_m = zeros(10/Par.Step_size + 1, length(k));
for i = 1:length(k)
    K_psi = k(i);
    sim main.slx
    error(i) = sum(simout.Data);
    u_hat_m(:, i) = u_hat.Data;
    u_til(:, i) = u_tilde.Data;
end

[Y,I] = min(error)

sim main.slx

f1 = figure
f2 = figure
hold on
l = cell(length(k), 1);
for i = 1:length(k)
    figure(f1);
    hold on
    plot(u_hat.Time, u_hat_m(:, i));
    figure(f2);
    plot(u_tilde.Time, u_til(:, i));
    l{i} = num2str(k(i));
end
figure(f2)
legend(l);
figure(f1);
plot(nu, '--');
l{length(l)+1} = 'nu';
legend(l);
hold off
fprintf(strcat('K_psi = ', num2str(k(I)), '\n'));