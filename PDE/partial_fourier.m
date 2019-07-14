function [X,Y] = partial_fourier(a0,a,b,L,x)

for i = 1:length(x)
    
    %this loops through all the a and b terms
    for n = 1:length(a)
        bigterm(n) = a(n)*cos((n*pi)/L*x(i));
        smallterm(n) = b(n)*sin((n*pi)/L*x(i));
    end
    
    %this adds up fourier terms for all a and b at that particular x
    bigterms = sum(bigterm);
    smallterms = sum(smallterm);
    
    y(i) = a0/2 + bigterms + smallterms;
end

X = x;
Y = y;


end
