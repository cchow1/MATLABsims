function U = heatFTCS(alpha,L,G0,GL,F,h,k,tf)

%Initialize constants and U matrix
N = round(L/h) - 1; %number of steps in the spatial dimension - 1
M = round(tf/k); % number of steps in the time dimension

r = (alpha*k)/h^2; %r constant in the FTCS finite difference method

U = zeros(N+2,M+1); %Initializing matrix U with zeros 

for i = 1:M+1 %Putting boundary conditions into the matrix U
    U(1,i) = G0((i-1)*k); %position = 0, boundary condition 
    U(end,i) = GL((i-1)*k); %position = L, boundary condition
end

for n = 2:N+1 %adding initial temperature distribution to matrix U 
    U(n,1) = F((n-1)*h); %time = 0, initial condition 
end

for w = 2:M+1 %filling in the rest of the matrix U
    
    for j = 2:N+1
    U(j,w) = r * U(j+1,w-1) + (1-2*r)*U(j,w-1) + r*U(j-1,w-1);
    
    end
    
end

end
    
    
    

        
