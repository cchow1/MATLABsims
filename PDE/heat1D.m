function U = heat1D(k,b,L,x,t)

%k = thermal conductivity of material
%b = vector of length N --> fourier coefficients bn
%L = length of rod
%x = array of x values (position)
%t = array of t values (time)

%U(i,j) = U(time, position)


for i = 1:length(x)
    
    for j = 1:length(t)
        
        %this for loop goes through all the b values 
        for n = 1:length(b)
            rawb(n) = b(n) * sin((n*pi)/L*x(i))*exp(((-n^2*pi^2)/L^2)*(k*t(j)));
        end
        
    %this sums the fourier series for all b at that particular t and x
    U(j,i) = sum(rawb);
    
    end
    
    
end



end
