%Name: Christy Chow 
%Student Number: 14494165
%Purpose: 
%   -to use Gauss-Seidel method to solve the LaPlace equation
%   -iterative, with a stopping condition that occurs when the difference between old and new is small

function [U, nsteps] = laplaceGS(a,b,F0,Fa,G0,Gb,h,epsilon)

N = round(a/h)-1;
M = round(b/h)-1;

xspan = 0:h:a;
yspan = 0:h:b;

%x goes downwards
%y goes sideways

U = zeros(N+2,M+2);
Unew = zeros (N+2, M+2);
U(1, 1:end) = F0(yspan); %u(0,y) = first row, all columns
U(N+2, 1:end) = Fa(yspan); %u(a,y) = last row, all columns
U(1:end, 1) = G0(xspan); %u(x,0) = all rows, first column
U(1:end, M+2) = Gb(xspan); %u(x,b) = all rows, last column 

U(1,1) = (F0(0) + G0(0))/2; %top left corner
U(N+2,1) = (Fa(0) + G0(0))/2; %bottom left corner
U(1,M+2) = (F0(b) + Gb(0))/2; %top right corner
U(N+2,M+2) = (Fa(b) + Gb(a))/2; %bottom right corner


Unew(1, 1:end) = F0(yspan); %u(0,y) = first row, all columns
Unew(N+2, 1:end) = Fa(yspan); %u(a,y) = last row, all columns
Unew(1:end, 1) = G0(xspan); %u(x,0) = all rows, first column
Unew(1:end, M+2) = Gb(xspan); %u(x,b) = all rows, last column 

Unew(1,1) = (F0(0) + G0(0))/2; %top left corner
Unew(N+2,1) = (Fa(0) + G0(0))/2; %bottom left corner
Unew(1,M+2) = (F0(b) + Gb(0))/2; %top right corner
Unew(N+2,M+2) = (Fa(b) + Gb(a))/2; %bottom right corner

nsteps = 0;
check = 1;

while check > epsilon
    
for j = 2:M+1 %js are columns
    
    for i = 2:N+1 %all rows in each column
        Unew(i,j) = 1/4*(U(i+1,j) + Unew(i-1,j) + U(i,j+1) + Unew(i, j-1));
    end
    
end

nsteps = nsteps + 1; %count how many full matrix iterations
check = max (abs(Unew(:)-U(:))); %this is the difference in each matrix 
U = Unew; %onto the next! 

end

end
