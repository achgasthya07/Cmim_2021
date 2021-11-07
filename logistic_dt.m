%Exercise 4.4 
%Using the logistic.m function from the manual
f = @(u, t) 0.1*(1 - u/500)*u;
U_0 = 100;
dt = 20; 
T = 100;
[u, t] = ode_FE(f, U_0, dt, T);
k = 1;
repeat = true; %Create a boolean condition to create a while loop for k
while repeat == true
    dt_k = (2^(-k))*dt;
    [u_new, t_new] = ode_FE(f, U_0, dt_k, T);
    plot(t, u, 'k--', u_new, t_new, 'b-')
    xlabel('t'); ylabel('N(t)');
    fprintf('The timestep is: %0.5f \n', dt_k);
    if (strcmp(input('Do you want to continue with finer dt (y/n)?', 's'),'y'))
        u = u_new;
        t = t_new;
    else
        break;
    end
    k = k+1;
end
