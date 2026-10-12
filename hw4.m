%[text] # Homework 4
%[text] BME 5910 - Biomedical Optics
%[text] Garrett Kunkler
%[text] 9/28/2026
%[text] ## Problem 1
% Givens
mu_x = 0.3;
mu_y = 0.4;
mu_z = 0.866;
theta = 30;
psi = 60;

% Solution
mu_x_prime = sind(theta)*cosd(psi) %[output:39ecdbd0]
mu_y_prime = sind(theta)*sind(psi) %[output:3591e660]
mu_z_prime = cosd(theta) %[output:8e0f1509]
s_prime = [mu_x_prime; mu_y_prime; mu_z_prime] %[output:72f60871]

theta_0 = acosd(mu_z) %[output:690e9d02]
phi_0 = acosd(0.3/sind(theta_0)) %[output:5c749172]

R_y = [cosd(theta_0)  0 sind(theta_0); %[output:group:226282a3] %[output:33f870b9]
       0              1 0; %[output:33f870b9]
       -sind(theta_0) 0 cosd(theta_0)] %[output:group:226282a3] %[output:33f870b9]

R_z = [cosd(phi_0) -sind(phi_0) 0; %[output:group:0ffca503] %[output:21820331]
       sind(phi_0) cosd(phi_0)  0; %[output:21820331]
       0           0            1] %[output:group:0ffca503] %[output:21820331]

T_inv = R_z*R_y %[output:195ad964]

s_new = T_inv*s_prime %[output:538938d2]

mu_x_new = s_new(1) %[output:07ee7152]
mu_y_new =  s_new(2) %[output:8638fac0]
mu_z_new =  s_new(3) %[output:969ea646]

s_new_mag_squared = mu_x_new^2 + mu_y_new^2 + mu_z_new^2 %[output:38501540]
%%
%[text] ## Problem 2
% Givens
n_1 = 1.37;
mu_a_1 = 0.02;
mu_s_1 = 10;
g_1 = 0.9;

z_b = 1;

n_2 = 1.45 %[output:67ac36b4]
mu_a_2 = 0.04;
mu_s_2 = 15;
g_2 = 0.85 %[output:26dea06b]

k_start = [0.2; 0.1; 0.92];
s_start = [0.3; 0.4; 0.866];

xi = 0.3;
xi_R = 0.02;

% Solution
mu_t_1 = mu_a_1 + mu_s_1 %[output:02750740]
mu_t_2 = mu_a_2 + mu_s_2 %[output:4b666fa8]
s = -log(xi)/mu_t_1 %[output:461fc060]
s_b = (z_b - k_start(3))/s_start(3) %[output:298250db]

k_b = k_start + s_b * s_start %[output:057c041b]

theta_i = acosd(s_start(3)) %[output:08132e1c]
phi_i = acosd(s_start(1)/sind(theta_i)) %[output:18cbfa24]

theta_t = asind(n_1/n_2*sind(theta_i)) %[output:16ef8e17]

R_s = ((n_1*cosd(theta_i) - n_2*cosd(theta_t))/(n_1*cosd(theta_i) + n_2*cosd(theta_t)))^2 %[output:6f2e036b]
R_p = ((n_1*cosd(theta_t) - n_2*cosd(theta_i))/(n_1*cosd(theta_t) + n_2*cosd(theta_i)))^2 %[output:4f5f7ab5]
R = (R_s + R_p)/2 %[output:44a6a3f1]

s_new = [sind(theta_t)*cosd(phi_i); %[output:group:4ef20be2] %[output:45df6010]
         sind(theta_t)*sind(phi_i); %[output:45df6010]
         cosd(theta_t)] %[output:group:4ef20be2] %[output:45df6010]

s_sb = mu_t_1/mu_t_2*(s-s_b) %[output:174667b7]

k_end = k_b + s_sb*s_new %[output:166324b7]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:39ecdbd0]
%   data: {"dataType":"textualVariable","outputData":{"name":"mu_x_prime","value":"0.2500"}}
%---
%[output:3591e660]
%   data: {"dataType":"textualVariable","outputData":{"name":"mu_y_prime","value":"0.4330"}}
%---
%[output:8e0f1509]
%   data: {"dataType":"textualVariable","outputData":{"name":"mu_z_prime","value":"0.8660"}}
%---
%[output:72f60871]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"s_prime","rows":3,"type":"double","value":[["0.2500"],["0.4330"],["0.8660"]]}}
%---
%[output:690e9d02]
%   data: {"dataType":"textualVariable","outputData":{"name":"theta_0","value":"30.0029"}}
%---
%[output:5c749172]
%   data: {"dataType":"textualVariable","outputData":{"name":"phi_0","value":"53.1339"}}
%---
%[output:33f870b9]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"R_y","rows":3,"type":"double","value":[["0.8660","0","0.5000"],["0","1.0000","0"],["-0.5000","0","0.8660"]]}}
%---
%[output:21820331]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"R_z","rows":3,"type":"double","value":[["0.5999","-0.8000","0"],["0.8000","0.5999","0"],["0","0","1.0000"]]}}
%---
%[output:195ad964]
%   data: {"dataType":"matrix","outputData":{"columns":3,"name":"T_inv","rows":3,"type":"double","value":[["0.5196","-0.8000","0.3000"],["0.6928","0.5999","0.4001"],["-0.5000","0","0.8660"]]}}
%---
%[output:538938d2]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"s_new","rows":3,"type":"double","value":[["0.0433"],["0.7795"],["0.6250"]]}}
%---
%[output:07ee7152]
%   data: {"dataType":"textualVariable","outputData":{"name":"mu_x_new","value":"0.0433"}}
%---
%[output:8638fac0]
%   data: {"dataType":"textualVariable","outputData":{"name":"mu_y_new","value":"0.7795"}}
%---
%[output:969ea646]
%   data: {"dataType":"textualVariable","outputData":{"name":"mu_z_new","value":"0.6250"}}
%---
%[output:38501540]
%   data: {"dataType":"textualVariable","outputData":{"name":"s_new_mag_squared","value":"1.0000"}}
%---
%[output:67ac36b4]
%   data: {"dataType":"textualVariable","outputData":{"name":"n_2","value":"1.4500"}}
%---
%[output:26dea06b]
%   data: {"dataType":"textualVariable","outputData":{"name":"g_2","value":"0.8500"}}
%---
%[output:02750740]
%   data: {"dataType":"textualVariable","outputData":{"name":"mu_t_1","value":"10.0200"}}
%---
%[output:4b666fa8]
%   data: {"dataType":"textualVariable","outputData":{"name":"mu_t_2","value":"15.0400"}}
%---
%[output:461fc060]
%   data: {"dataType":"textualVariable","outputData":{"name":"s","value":"0.1202"}}
%---
%[output:298250db]
%   data: {"dataType":"textualVariable","outputData":{"name":"s_b","value":"0.0924"}}
%---
%[output:057c041b]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"k_b","rows":3,"type":"double","value":[["0.2277"],["0.1370"],["1.0000"]]}}
%---
%[output:08132e1c]
%   data: {"dataType":"textualVariable","outputData":{"name":"theta_i","value":"30.0029"}}
%---
%[output:18cbfa24]
%   data: {"dataType":"textualVariable","outputData":{"name":"phi_i","value":"53.1339"}}
%---
%[output:16ef8e17]
%   data: {"dataType":"textualVariable","outputData":{"name":"theta_t","value":"28.1938"}}
%---
%[output:6f2e036b]
%   data: {"dataType":"textualVariable","outputData":{"name":"R_s","value":"0.0014"}}
%---
%[output:4f5f7ab5]
%   data: {"dataType":"textualVariable","outputData":{"name":"R_p","value":"3.8362e-04"}}
%---
%[output:44a6a3f1]
%   data: {"dataType":"textualVariable","outputData":{"name":"R","value":"8.8176e-04"}}
%---
%[output:45df6010]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"s_new","rows":3,"type":"double","value":[["0.2834"],["0.3780"],["0.8814"]]}}
%---
%[output:174667b7]
%   data: {"dataType":"textualVariable","outputData":{"name":"s_sb","value":"0.0185"}}
%---
%[output:166324b7]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"k_end","rows":3,"type":"double","value":[["0.2330"],["0.1439"],["1.0163"]]}}
%---
