x = 1:11;
r = [4.04 5.98 7.97 10.12 11.95 14.08 15.97 20.06 24.08 27.93 29.95]; 
err = [0.04 0.02 0.03 0.12 0.05 0.08 0.03 0.06 0.08 0.07 0.05];
errorbar(x,r,err)
xlabel('No of data points');
ylabel('Measured distance');