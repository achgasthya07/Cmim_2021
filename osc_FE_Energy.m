%osc_FE_energy - Exercise 4.10
omega = 2;
P = 2*pi/omega;
dt = P/30;
T = 6*P;
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t+1);
u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time the Forward Euler scheme
for n = 1:N_t
    u(n+1)=u(n)+dt*v(n);
    v(n+1)=v(n)-dt*omega^2*u(n);
end
[U, K] = osc_energy(u, v, omega); %Calling the osc_energy function
plot(t, U+K, 'r-'); %Plotting the sum of Kinetic and Potential energy wrt time t
xlabel('Time - t');
ylabel('Sum of potential and kinematic energy - U+K');