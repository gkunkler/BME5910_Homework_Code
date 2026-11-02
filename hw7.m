%[text] # Part 3
%[text] Author: Garrett Kunkler
%[text] Created: 11/2/2026
%[text] Edited: 11/2/2026
%%
%[text] ### Set Up
% Given Parameters
f = 500e6; % [Hz] Frequency
omega = 2*pi*f; % [rad/s] Angular frequency
c = 3e10/1.37; % [cm/s] Speed of light in medium
h = 0.2; % [cm] Grid size (dx = dy = dz = h)
N = 20; % Number of voxels in each direction (NxN grid)
gap = 3; % Gap between src/det and boundary grid
mua0 = 0.1; % [1/cm] mu_a of the background
mus0 = 10; % [1/cm] mu_s' of the background
mut0 = mua0 + mus0; % [1/cm] mu_t' of the background
D = 1/3/mu_t % [cm] Diffusion coefficient
obj_x = 12; obj_y = 6; % [cm] Object location in the grid
obj_size = 2; % [cm] Object size
dmua = 0.01; % [1/cm] mu_a perturbation from object

k_0 = sqrt((-c*mua0 + 1j*omega)/c/D)
B = 1; % Normalized source

% Create sensitivity matrix
% r_s: Source location
% r_prime: Absorber location
% r_d: detector location


function g = green_function(r_d, r_prime)
    % Takes the location of the detector and the absorber
    % and computes the values of the Green's function
    r_mag = compute_distance(r_d, r_prime);
    g = exp(1j*k_0*r_mag)/4/pi/r_mag;
end

function U0 = get_u0(r, r_s)
    % Takes the location of the source and the absorber
    % and computes the value of U_0
    r_mag = compute_distance(r, r_s);
    U0 = B/c/D*exp(1j*k_0*r_mag)/4/pi/r_mag;
end

function dist = compute_distance(r1, r2)
    % Takes two 3-vectors and computes their distance
    dist = sqrt((r1-r2).^2)
end

function W_ij_mn = get_W_component(i, j, m, n)

    -get_u0()

end
%%
%[text] ### Algebraic Reconstruction Technique

%%
%[text] ### Simultaneous Iterative Reconstruction Technique


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
