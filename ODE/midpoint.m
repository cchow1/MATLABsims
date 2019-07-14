%Name: Christy Chow
%Student Number: 14494165
%MECH 358 Assignment 1, Question 3

function [T,Y] = odeMidpoint (odefun, tspan, y0, h)

%make the T from t0 to tf with h intervals
T = tspan(1):h:tspan(2);

%append tf in case it doesn't divide nicely
if T(end)<tspan(2)
    T(length(T) + 1) = tspan(2);
end

%initializing everything
k1 = zeros (length(T),1);
k2 = zeros(length(T),1);
Y = zeros(length(T),1);
Y(1) = y0; 

%this is the midpoint rule
for n = 1:length(T)-1
    k1(n) = odefun(T(n),Y(n));
    k2(n) = odefun(T(n)+ h/2, Y(n) + k1(n)*h/2);
    Y(n+1) = Y(n) + k2(n)*h;
end

%do the last one manually in case it doesn't divide nicely
k1(end-1) = odefun(T(end-1),Y(end-1));
k2(end-1) = odefun(T(end-1) + h/2, Y(end-1) + k1(end-1)*h/2);
Y(end) = Y(end-1) + k2(end-1)*h;

end
