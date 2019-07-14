function [T,Y] = odeIEuler(odefun,t,y0)

%initialize things
N = length(t);
Y = zeros(N,1);
Y(1) = y0;

%loop through all of the t values
for n=1:N-1
    %calculate new step size every time 
    h = t(n+1)-t(n);
    %this is the function that they gave in assignment
    heck = @(y) y-Y(n) - odefun(t(n+1),Y(n))*h;
    %use fzero to solve, the guess is the previous value
    Y(n+1) = fzero(heck,Y(n)); 
end

T=t; 

end