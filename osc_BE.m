%Exercise 4.14
omega=2;
P=2*pi/omega;
dt=P/20;
%dt=P/2000; %dt can be changed to test 20 and 2000 time steps per period
T=6*P;
N_t = floor(round(T/dt)); %floor rounds each value of T to nearest value of specified time
t = linspace(0, N_t*dt, N_t+1);
u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);
% Initial condition
x_0=2;
u(1)=x_0;
v(1)=0;
% Step equations forward in time
for n=2:N_t+1
    u(n)=(1.0/(1+(dt*omega)^2))*(dt*v(n-1)+ u(n-1));
    v(n)=(1.0/(1+(dt*omega)^2))*(-dt*omega^2*u(n-1)+v(n-1));
end
plot(t, u, 'k-', t, x_0*cos(omega*t), 'm-.');
legend('numerical', 'exact', 'location', 'southeast');
xlabel('t');
ylabel('Amplitude');