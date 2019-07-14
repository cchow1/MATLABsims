%Name: Christy Chow
%Student Number: 14494165
%MECH 358 Assignment 1, Question 2

function [T,X,Y] = projectile (C, n, m, v0)

h = 0.005;
g = 9.81; %m/s^2

%X is the vector with x-position and x-velocity
%Y is the vector with y-position and y-velocity
T = [];
X = [] ;
Y = [] ;
Xjerk = [];
Yjerk = [];

%the first values in X, Y, Xjerk, Yjerk and T
T(1) = 0;
X(1,1) = v0(1);
X(1,2) = v0(2);
Y(1,1) = v0(3);
Y(1,2) = v0(4);
Xjerk(1) = -C/m * X(1,2) * (X(1,2).^2 + Y(1,2).^2) .^((n-1)/2);
Yjerk(1) = -C/m * Y(1,2) * (X(1,2).^2 + Y(1,2).^2) .^((n-1)/2) - g;

%the second value, calculated using Euler
T(2) = h; 
X(2,1) = X(1,1) + X(1,2)*h;
X(2,2) = X(1,2) + Xjerk(1)*h; 
Y(2,1) = Y(1,1) + Y(1,2)*h;
Y(2,2) = Y(1,2) + Yjerk(1)*h; 
Xjerk(2) = -C/m * X(2,2) * (X(2,2)^2 + Y(2,2)^2)^((n-1)/2);
Yjerk(2) = -C/m * Y(2,2) * (X(2,2)^2 + Y(2,2)^2)^((n-1)/2) - g;
i = 2;

%while loop to ensure that the ball doesn't fall UNDER ground
while Y(i,1) > 0
    X(i+1,1) = X(i,1) + X(i,2)*h
    Y(i+1,1) = Y(i,1) + Y(i,2)*h
    X(i+1,2) = X(i,2) + Xjerk(i)*h;
    Y(i+1,2) = Y(i,2) + Yjerk(i)*h;
    Xjerk(i+1) = -C/m * X(i,2) * (X(i,2)^2 + Y(i,2)^2)^((n-1)/2);
    Yjerk(i+1) = -C/m * Y(i,2) * (X(i,2)^2 + Y(i,2)^2)^((n-1)/2) - g;
    i=i+1;
end 
    
end

    


