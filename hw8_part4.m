Delta_l = linspace(-100e3,100e3,1000); % [nm]
lambda = linspace(700,900,1000); % [nm]

[L, Y] = meshgrid(Delta_l, lambda);

I_lambda = exp(-(Y-800).^2/8000);

I = I_lambda.*cos(2*pi*L./Y);

figure()
plot(lambda, I_lambda)

figure()
h = pcolor(L, Y, I);
set(h, 'EdgeColor', 'none');
view(2);
xlabel("Path Length Difference, \Delta L [nm]")
ylabel("Wavelength, \lambda [nm]")
colorbar()