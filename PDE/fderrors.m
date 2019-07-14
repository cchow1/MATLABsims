function fderrors (k, odefun)

%this initializes everything 
for i = 1:length(k)
    ks = k(i);
    h(i) = 10^(-ks);    

%first calculate forward, backward and central first derivative
ffprime(i) = (odefun(2+h(i)) - odefun(2))/h(i);
fbprime(i) = (odefun(2) - odefun(2-h(i)))/h(i);
fcprime(i) = (odefun(2+h(i)) - odefun(2-h(i)))/(2*h(i));

%this is the actual solution of first derivative
fprime = cos(sqrt(2))/(2*sqrt(2));

%this is the error in first derivative for each method
errorf(i) = abs(fprime-ffprime(i));
errorb(i) = abs(fprime-fbprime(i));
errorc(i) = abs(fprime-fcprime(i));

%this is central difference for second derivative
fcprime2(i) = (odefun(2+h(i)) - 2*odefun(2) + odefun(2-h(i)))/h(i)^2;

%this is actual solution of second derivative
f2prime = -(sqrt(2)*sin(sqrt(2)) + cos(sqrt(2)))/(4*2^(3/2));

%this is error in second derivative
error2c(i) = abs(f2prime - fcprime2(i));

end

%plot of everything
subplot(3,1,1) 
plot(log10(h),log10(errorf))
hold on
ylim ([-12,0])
title('Forward Difference Error')
ylabel ('log10 Error')

subplot(3,1,2)
plot(log10(h), log10(errorb))
hold on
ylim ([-12,0])
title('Backward Difference Error')
ylabel ('log10 Error')

subplot(3,1,3)
plot(log10(h), log10(errorc))
hold on
ylim ([-12,0])
title('Central Difference Error')
xlabel ('log h values')
ylabel ('log10 Error')

savefig('fderrors1.fig');

figure(2)
plot(log10(h), log10(error2c))
title ('Central Difference Error - f"(x)') 
xlabel ('log h values')
ylabel ('log10 Error')
savefig('fderrors2.fig');
