clear all;
close all;
clc;


x=linspace(1,5);    %Reads for 100 cycles
y = {};    %All serial data is thrown in y.
     for i=1:length(x); 
            s = serial('COM3');
            fopen(s); 
        data = fscanf(s);
        fprintf("%s\n",data) 
        y = char(data);   % The incoming data is converted to characters
        y = regexp(y, '\s*', 'split');    % The data is split up into spaces and in columns
        
        %Tabulates data into cells
        h(i,1) = y(1,1);
        t(i,1) = y(1,2);
        reading1(i,1)= y(1,3);    % reads in column 1
        reading2(i,1)= y(1,4);    % reads in column 2
        reading3(i,1)= y(1,5);    % reads in column 3  
        reading4(i,1)= y(1,6);    % reads in column 4
        reading5(i,1)= y(1,7);    % reads in column 5
        
      %Humidity/temperature character to double data
      hum(i,1) = str2double(h(i,1));
      temp(i,1) = str2double(t(i,1));
      
      %Duration from string to double data
      duration1(i,1)=str2double(reading1(i,1));
      duration2(i,1)=str2double(reading2(i,1));
      duration3(i,1)=str2double(reading3(i,1));
      duration4(i,1)=str2double(reading4(i,1));
      duration5(i,1)=str2double(reading5(i,1));      
         

      
      %Distance with humidity/temperature
      distance1(i,1)=duration1(i,1)*((331.4+(0.606*temp(i,1))+(0.0124*hum(i,1)))/20000);
      distance2(i,1)=duration2(i,1)*((331.4+(0.606*temp(i,1))+(0.0124*hum(i,1)))/20000);
      distance3(i,1)=duration3(i,1)*((331.4+(0.606*temp(i,1))+(0.0124*hum(i,1)))/20000);
      distance4(i,1)=duration4(i,1)*((331.4+(0.606*temp(i,1))+(0.0124*hum(i,1)))/20000);
      distance5(i,1)=duration5(i,1)*((331.4+(0.606*temp(i,1))+(0.0124*hum(i,1)))/20000);
      
      %Air Density
      p(i,1)=(3.53172/(1+(0.016*(hum(i,1)))))*((100+hum(i,1))/((temp(i,1)+273.15)));
      
      %Live plot of distances
      figure(1);
      plot(distance1(:),'.k-'); drawnow  
      hold on
      plot(distance2(:),'.b-'); drawnow
      hold on
      plot(distance3(:),'.r-'); drawnow 
      hold on
      plot(distance4(:),'.m-'); drawnow
      hold on
      plot(distance5(:),'.g-'); drawnow 
  
      %Superposition of wave 1 and 2 (in progress)
      
      wavelength = 0.0085; %In meters
      k = (2*pi/wavelength); %Constant k
      w = k*((331.4+(0.606*temp(i,1))+(0.0124*hum(i,1)))/20000); %k*c
      
                %Some integration
                %...
            %vphase = w(k0)/k0
            %vgroup = dw/dk

      
      figure(2);
      plot(%...%); drawnow  
      hold on
      plot(%...%); drawnow
      hold on
      
      
            clear s;
            fclose(instrfindall);
            delete(instrfindall); 
            
     end
     