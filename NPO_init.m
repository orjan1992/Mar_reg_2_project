%% Init file for NPO
M = [16.79 0 0;0 15.79 0.554625;0 0.554625 2.76];
NPO.invM = inv(M);
NPO.Tinv = inv(diag([10 10 10]));
NPO.A_w = ones(6, 6);
NPO.C_w = ones(3, 6);
NPO.eta_0 = [0 0 0];
NPO.nu_0 = [0 0 0];
NPO.K_1 = [diag([0 0 0]); diag([0 0 0])];
scale = 0.00000001;
NPO.K_2 = scale*diag([1.1 1.1 1.1]);

NPO.K_4 = scale*diag([0.1 0.1 0.1]);
NPO.K_3 = 0.1*NPO.K_4;