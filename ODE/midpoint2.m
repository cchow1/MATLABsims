%% Global Truncation Errors with Midpoint Rule
%Name: Christy Chow
%Student Number: 14494165
%MECH 358 Assignment 1, Question 3

close all; 
c1 = 2;
tspan = [0,10];

%these are the two functions used
first = @(t,y) -y^2 * t;
odefun = @(t,y) y/(1+t^2);

%these are all the h intervals to check
h = [1, 0.5, 0.2, 0.1, 0.01, 0.001, 0.0001];

%initializing everything
error = zeros(1,length(h));
seconderror = zeros(1,length(h));
y0 = 1;

%use midpoint rule to evaluate and plot both functions
for i = 1:length(h)
    [T,B] = odeMidpoint (first, tspan, y0, h(i)); 
    error(i) = abs((2/(c1+10^2)) - B(end)); %this checks the error
    
    
    [T,Y] = odeMidpoint (odefun, tspan, y0, h(i));
    seconderror(i) = abs((exp(atan(10))) - Y(end)); %this checks the error
    
    figure (1)
    plot (T,B)
    
    figure (2) 
    plot (T,Y)
    hold on;
end

%this plots the loglog errors and labels everything
figure(3)
loglog(h,error,'b.'); grid on;
title ('Error Plot for dydt = y^2t');
xlabel ('h values')
ylabel ('magnitude of error')
savefig('midpoint1.fig')
legend
%this finds the order
p = polyfit (log(h), log(error), 1);
slope = p(1);


figure (4)
loglog (h,seconderror, 'r.'); grid on; 
title ('Error Plot for dydt = y/(1+t^2)');
xlabel ('h values')
ylabel ('magnitude of error')
legend
savefig ('midpoint2.fig') 
%this finds the order
p2 = polyfit (log(h), log(seconderror), 1);
anotherone = p2(1);
 
order = [slope, anotherone]
