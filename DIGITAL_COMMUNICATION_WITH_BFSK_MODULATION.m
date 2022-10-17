%%%%Acoustic Sensing Communication%%%%%%%

clc; close all; clear all;


disp('XXXXXXXXXXXXXXXXXXXXXXXX Input function XXXXXXXXXXXXXXXXXXXXXXXXXXX');
%XXXXXXXXXXXXXXXXXXXXXXXXX INPUT FUNCTION XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
fprintf('\n');
A=input(' Amplitude of Transmitting signal : ');

fprintf('\n\n');






disp('XXXXXXXXXXXXXXXXXXXX Transmitting Function XXXXXXXXXXXXXXXXXXXXXXXXX');
% XXXXXXXXXXXXXXXXXXXXXXX transmitting signal generation XXXXXXXXXXXXXXXXXX
f=100; %in Hz
T=1/f;
t=0:T/100:2*T; %collection data set
y=A*sin(2*pi*f*t);
figure(1);
plot(t,y,'linewidth',3);
ylabel(' Amplitude(volt) ')
xlabel('time(Sec)');
title(' Transmitting Signal ');

%%steps of digital communication start
%XXXXXXXXXXXXXXXXXXXXXXXXXXXXX sampling XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Ts=T/20;
Fs=1/Ts;
n=1:1:2*T/Ts;
y1=A*sin(2*pi*f*n*Ts);
figure(2);
stem(n,y1);
ylabel(' Amplitude(volt) ')
xlabel('descrete time');
title(' Discrete Time signal Signal after sampling ');


%XXXXXXXXXXXXXXXXXXXXXXXXXXXX Aditional of DC Level XXXXXXXXXXXXXXXXXXXXXXX
y2=A+y1;
figure(3);
stem(n,y2);
ylabel(' Amplitude(volt) ')
xlabel('descrete time');
title('DC Level + Discrete Time signal Signal ');


%XXXXXXXXXXXXXXXXXXXXXXXXXXXX Quantization of Signal XXXXXXXXXXXXXXXXXXXXXXXXX
y3=round(y2);
figure(4);
stem(n,y3);
ylabel(' Amplitude(volt) ')
xlabel('descrete time');
title('Quantized signal  ');


%XXXXXXXXXXXXXXXXXXXX Binary information Generation XXXXXXXXXXXXXXXXXXXXXXX
y4=dec2bin(y3);
Bi=y4;


%XXXXXXXXXXXXXX Binary Informatiom convert in to serial form XXXXXXXXXXXXXX
[row col]=size(Bi);
k1=1;
for i=1:row
    for j=1:col
        s(1,k1)= Bi(i,j);
        
        k1=k1+1;
    end   
end
m7=[];
m7=[m7 s];


%XX String binary information convert in to number Binary information XXXX
for p=1:length(m7)
    Nu(p)=str2num(m7(p));
end 
x=Nu;
disp(' Binary information at Transmitter :');
disp(x);


%XXXXXXXXXXXXXXXXXXXXXXXX bit rate calculation XXXXXXXXXXXXXXXXXXXXXXXXXXX
br=col*Fs;
bp=1/br; % bit period calculation



%XXXXXX Line coding to achive digital signal from binary information XXXXXX
bit=[];
for n=1:length(x);
    if Nu(n)==1;
       se=ones(1,100);
    else x(n)==0;
        se=zeros(1,100);
    end
     bit=[bit se];

end
tt=0:bp/100:2500*(bp/100);
figure(5)
plot(tt(1:2500),bit(1:2500),'LineWidth',2.5);grid on;
ylabel('amplitude(A)');
xlabel(' time(t)');
axis([0 .003 -.5 1.5]);
title('digital signal achived from binary information in transmitter ');



%XXXXXXXXXXXXXXXXXXXXX Carrier frequency Calculation XXXXXXXXXXXXXXXXXXXXXX
f1=br*2;
f2=br*8;


%XXXXXXXXXXXXXXX B-FSK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX%
A1=5;
t=bp/99:bp/99:bp;
ss=length(t);
m=[];
for (i=1:1:length(x))
    if (x(i)==1)
        y=A1*cos(2*pi*f1*t);
    else
        y=A1*cos(2*pi*f2*t);
    end
    m=[m y];
end
t=bp/99:bp/99:bp*length(x);
figure(6);
plot(t(1:99*10),m(1:99*10));
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('BFSK modulated Wave form');

fprintf('\n\n');




disp('XXXXXXXXXXXXXXXXXXXX Receiving fuction XXXXXXXXXXXXXXXXXXXXXXXXXXXX');
%XXXXXXXXXXXXXXXXXXXX BFSK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
mn=[];
for(n=ss:ss:length(m))
  t=bp/99:bp/99:bp;
  y1=cos(2*pi*f1*t);
  y2=cos(2*pi*f2*t);
  mm=y1.*m((n-(ss-1)):n);
  mmm=y2.*m((n-(ss-1)):n);
  tt=bp/99:bp/99:bp;
  z1=trapz(tt,mm);
  z2=trapz(tt,mmm);
  if(z1>0)
    a=1;
  else
    a=0;
  end
  mn=[mn a];
end
disp(' Binary information at Reciver :');
disp(mn);



%XXXXXX Representation of binary information as digital signal XXXXXXXXX
x=mn;
bit=[];
for n=1:length(x);
    if Nu(n)==1;
       se=ones(1,100);
    else x(n)==0;
        se=zeros(1,100);
    end
     bit=[bit se];

end
tt=0:bp/100:2500*(bp/100);
figure(7)
plot(tt(1:2500),bit(1:2500),'LineWidth',2.5);grid on;
ylabel('amplitude(A)');
xlabel(' time(t)');
axis([0 .003 -.5 1.5]);
title('Representation of binary information as digital signal after demod');

%XXXXXXXXXXXX Decoding to achived discrete signal at Reciver XXXXXXXXXXXXXX
pp=1;
for(i=1:1:(length(mn)/col))
    for(j=1:1:col)
        xx(i,j)=mn(pp);
        pp=pp+1;
    end
end

Ns2=num2str(xx);
bd=bin2dec(Ns2);
 m14=[];
m14=[m14 bd];
disp('obtainable decimal value of each sample from FSK demodulation');
fprintf('%6.0f\n',m14);
figure(8)
stem(m14),grid on;
ylabel('amplitude(A)');
xlabel('discrete time(n)');
title('Generation of discrete time  signal from binary information ');


%XXX Remove of Dc lavel from discrete time signal at Reciver XXXXXXXXXXXXX 

sig=m14-A;
figure(9)
stem(sig),grid on;
ylabel('amplitude(A)');
xlabel('discrete time(n)');
title(' discrete time  signal without DC lavel after demodulation ');

%%steps of digital communication end

% XXXXXXXXXXXXXXXXXXXXXXXX orginal signal at Reciver XXXXXXXXXXXXXXXXXXXXX
figure(10)
f=100; %in Hz
T=1/f;
t=0:T/100:2*T; %collection data set
y=A*sin(2*pi*f*t);

z=plot(t,y,'linewidth',2);
legend('input');
z.MarkerSize= 3;

hold on



nn=T/Ts;
m17=[];
 for n=1:1:nn*2;
 t=00:(T*2)/999:T*2;
  ll=(pi/Ts)*(t-(n*Ts));
  k=sig(n).*sin(ll)./ll;
 m17=[m17 k];
 %plot(t,k,'r'),hold on
 end

 
 
m18=[];
m19=[];
 for i=1:1:length(t)
    for k=i:length(t):length(m17)
        p=m17(k);
        m18=[m18 p];
    end
    gg=sum(m18);
    m19=[ m19 gg];
    p=0;
    m18=0;
 end
plot(t,m19,'linewidth',2);

ylabel('Amplitude(A)');
xlabel(' time(t)');

title('Reconstructed signal');


fprintf('\n\n');
disp('XXXXXXXXXXXXXXXXXXXXXXXXX end of program XXXXXXXXXXXXXXXXXXXXXXXXX');

