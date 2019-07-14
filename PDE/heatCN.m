%Name: Christy Chow
%Student Number: 14494165
%Purpose: 
%   -to use the Crank-Nicolson finite difference method to solve heat equations
%   -this is a stable method compared to FTCS

function U = heatCN(alpha,L,G0,GL,F,h,k,tf)

N = round(L/h)-1;
M = round(tf/k);
p = (alpha*k)/(2*h^2);
tspan = 0:k:tf;
xspan = 0:h:L;

U = zeros(N+2,M+1);

U(1,1:end) = G0(tspan);
U(N+2,1:end) = GL(tspan);
U(1:end,1) = F(xspan);

A = (eye(N,N).*(1+2*p)) + diag(ones(N-1,1).*(-p),-1) + diag(ones(N-1,1).*(-p),1);
B = (eye(N,N).*(1-2*p)) + diag(ones(N-1,1).*(p),-1) + diag(ones(N-1,1).*(p),1);
g = zeros(N,1);

for j = 2:M+1
    t0 = (j-1)*k;
    t1 = j*k;
    g(1) = p*G0(t0) + G0(t1);
    g(end) = p*GL(t0) + GL(t1);
    C = B*U(2:end-1,j-1)+g;
    U(2:end-1,j) = linsolve(A,C);
end

end