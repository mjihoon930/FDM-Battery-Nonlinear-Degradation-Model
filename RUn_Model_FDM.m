clear all
close all
clc

t = [0 5 259200];
u = [0 0 0];

%Parameter
%Negative
n.R_n = 3.5*10^(-4); 
n.D_n = 5.29*10^(-11);
n.L_n = 3.4*10^-3;
n.A_n = 1818; 
n.e_n = 0.55;
n.a_n = 3*n.e_n/n.R_n; 
n.c_max_n = 31.07*10^(-3);
n.theta_0n = 0;
n.theta_100n = 0.8;
n.R_film_n = 0.001;
n.alpha_n = 0.5;

%Positive
p.R_p = 3.65*10^(-6); 
p.D_p = 1.18*10^(-14);
p.L_p = 7.0*10^-3;
p.A_p = 1771; 
p.e_p = 0.41;
p.a_p = 3*p.e_p/p.R_p; 
p.c_max_p = 22.806*10^(-3);
p.theta_0p = 0.76;
p.theta_100p = 0.03;
p.R_film_p = 0;

c.F = 96487; 
c.T_ref = 298.15;
c.T_inf = 298.15;
c.R_c = 0;
c.R_u = 8.314;
c.c_e = 1.2*10^(-3);
c.k_ref_p = 1.0614*10^(-4);
c.k_ref_n = 0.079;
c.E_a_p = 25*10^(3);
c.E_a_n = 40*10^(3);
c.c_bar = n.c_max_n*0.5;
c.u_bar = 0;

d.K_p = 0.0575;
d.R_sei = 0.001;
d.M_p = 0.162;
d.rho_p = 1690*10^(-6);
d.i_o_s = 3.9*10^-12;
d.U_ref_s = 0.4;

n_Li = p.e_p*p.A_p*p.L_p*p.theta_0p*p.c_max_p + n.e_n*n.A_n*n.L_n*n.theta_0n*n.c_max_n;
Q_nom =c.F*p.e_p*p.A_p*p.L_p*(p.theta_0p-p.theta_100p)*p.c_max_p;

x1_initial = 0.5*Q_nom;

%initial state
C_avg_p = (-1/(c.F*p.e_p*p.A_p*p.L_p))*x1_initial + p.theta_0p*p.c_max_p;
C_avg_n = 0.5*n.c_max_n;%(1/(n.e_n*n.A_n*n.L_n))*(n_Li-(p.e_p*p.A_p*p.L_p*C_avg_p));

initial_5_p = repmat(C_avg_p, 1, 4);
initial_5_n = repmat(C_avg_n, 1, 4);

initial_10_p = repmat(C_avg_p, 1, 9);
initial_10_n = repmat(C_avg_n, 1, 9);

initial_25_p = repmat(C_avg_p, 1, 24);
initial_25_n = repmat(C_avg_n, 1, 24);

initial_50_p = repmat(C_avg_p, 1, 49);
initial_50_n = repmat(C_avg_n, 1, 49);

initial_100_p = repmat(C_avg_p, 1, 99);
initial_100_n = repmat(C_avg_n, 1, 99);

t_final = 259200;


sim('FDM_Degradation_nmmap.slx',t_final)

save NM_map.mat 

