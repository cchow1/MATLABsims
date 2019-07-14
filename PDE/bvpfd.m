function [A,b] = bvpfd (p,q,r,xspan, BC, N)

%inialize some values
t0 = xspan(1); 
tf = xspan(2); 
h = (tf-t0)/(N+1);
alpha = BC(1); beta = BC(2);

%initialize some column arrays (for matrix multiplication later) 
diags = linspace(0,0,N)';
topdiags = linspace (0,0,N)';
bottomdiags = linspace (0,0,N)';

%basically create the array for each part of the overall matrix with p and q vals
for i = 1:N
    diags(i) = 2+ (q(i)*h^2);
    topdiags(i) = (p(i)*h/2) -1 ;  
    bottomdiags(i) = (-p(i+1)*h)/2-1;
    
end

%same as above for the b matrix
for j = 1:N-2
    bmid = linspace (0,0,N-2)';
    bmid(j) = -h^2 * r(j+1);
end

%put everything together in the A matrix and b array 
A = eye(N) .* diags + topdiags.*diag(ones(1,N-1),1) + bottomdiags.*diag(ones(1,N-1),-1);
b = [((p(1)*h)/2 + 1 )*alpha-(h^2*r(1)); bmid ; ((p(end-1)*h)/2 + 1)*beta-(h^2*r(end-1))];


end
