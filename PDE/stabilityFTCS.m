%% Stability FTCS

% Purpose is to determine the stability region of FTCS 
% Approximate it where Tavg >= 1 (or is not a number) 

close all;

alpha = 0.1; L = 1; tf = 2; 
F = @(x) 1;
G0 = @(t) 0;
GL = @(t) 0;

h = linspace(0.01,0.1,50); 
k = linspace(0.001,0.05,50);
T = zeros(length(h), length(k));

for j = 1:length(h)
    
    for i = 1:length(k)
        
        U = heatFTCS(alpha, L, G0, GL, F, h(j), k(i), tf);
        
        %grabs final temperatures and averages them
        Ts = abs(U(:,end));
        Ta = mean(Ts);
        
        %checks whether it blew up or not, assign it to 1 (blew up) or 0 (is ok)
        if Ta >=1 || isnan(Ta)
            
            T(i,j) = 1;
            
        else
            T(i,j) = 0;
            
        end
        
    end
    
end

[H,K] = meshgrid(h,k);
pcolor (H,K,T)
colormap(jet(2)); colorbar('ticks',[0,1]);
title('FTCS Stability Region');
xlabel('h'); ylabel('k');