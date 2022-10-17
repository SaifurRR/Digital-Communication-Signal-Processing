
clc
clear all
close all
%% waiting %%
 h = waitbar(0,'Please wait...');
steps = 1000;
for step = 1:steps
        waitbar(step / steps)
end
close(h) 
%% data user 1 %% 
%%%%%%%%%%%%%%%%%%%% DATA FORM USER 1 & 2 %%%%%%%%%%%%%%%%%%%%%%%

data_user1=[1 1 0 0 0 1 1 1]; % data in 1
data_user2=[1 1 0 0 0 0 0 1]; % data in 2
ldata1=length(data_user1);
ldata2=length(data_user2);

%   figure for DATA for user 1

figure()                        
subplot(2,2,1);
stem(data_user1,'Color','r','LineWidth',2.5);
axis([0 ldata1+1 -1.5 1.5]);
title('orignal data form user no. 1 in 1 and 0 s');
grid on;

disp(' %%%% DATA USER NO.1 %%%');
disp(' ');
disp(data_user1);
disp(' %%%% DATA USER NO.2 %%%');
disp(' ');
disp(data_user2);

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');

%   nrz conversion

for i=1:ldata1
    if data_user1(i)==0        
        data_user1(i)=-1;
    end
end

disp(' %%%% DATA USER NO.1 IN NRZ %%%');
disp(' ');
disp(data_user1);

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');

%  figure for DATA for user 1 in one level ( 0 & 1's)

disp(' %%%% SPREADED DATA FOR USER NO.1 %%%');
disp(' ');
subplot(2,2,2);         
stem(data_user1,'Color','r','LineWidth',2.5);
axis([0 ldata1+1 -1.5 1.5]);
title('orignal data form user no. 1 in NRZ ');
grid on;

data_user1=[repmat(data_user1(1),1,8) repmat(data_user1(2),1,8) repmat(data_user1(3),1,8) repmat(data_user1(4),1,8) repmat(data_user1(5),1,8) repmat(data_user1(6),1,8) repmat(data_user1(7),1,8) repmat(data_user1(8),1,8)];
disp(data_user1);
ld1=length(data_user1);

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');

%  figure for DATA for user 1 in two level ( -1 & 1's)
subplot(2,2,[3 4]);         %  figure for DATA for user 1
stem(data_user1,'Color','b','LineWidth',2.5);
axis([0 ld1+1 -1.5 1.5]);
title('orignal data form user no. 1 in NRZ for sprading');
grid on;
%% data usre 2 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure()                        %  figure for DATA for user 2   %
subplot(2,2,1);                                                 %
stem(data_user2,'Color','r','LineWidth',2.5);                   %
axis([0 ldata2+1 -1.5 1.5]);                                    %
title('orignal data form user no. 2 in 1 and 0 s');             %
grid on;                                                        %
%
for i=1:ldata2
    if data_user2(i)==0                                         %
        data_user2(i)=-1;        % nrz conversion;              %
    end
end
%
subplot(2,2,2);         %  figure for DATA for user 2           %
stem(data_user2,'Color','r','LineWidth',3);                     %
axis([0 ldata2+1 -1.5 1.5]);                                    %
title('orignal data form user no. 2 in NRZ');                   %
grid on;                                                        %

disp(' %%%% DATA USER NO.2 IN NRZ %%%');
disp(' ');
disp(data_user2);

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');

disp(' %%%% SPREADED DATA FOR USER NO.2 %%%');
disp(' ');
data_user2=[repmat(data_user2(1),1,8) repmat(data_user2(2),1,8) repmat(data_user2(3),1,8) repmat(data_user2(4),1,8) repmat(data_user2(5),1,8) repmat(data_user2(6),1,8) repmat(data_user2(7),1,8) repmat(data_user2(8),1,8)];
disp(data_user2);
ld2=length(data_user2);       

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');
                                                                %
subplot(2,2,[3 4]);         %  figure for DATA for user 1       %
stem(data_user2,'Color','b','LineWidth',2.5);                   %
axis([0 ld2+1 -1.5 1.5]);                                       %
title('orignal data form user no. 2 in NRZ for sprading');      %
grid on;                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% PN for user 1 %%
%%%%%%%%%%%%%%%%%% PN seq for user no. 1 %%%%%%%%%%%%%%%%%%%%

%%%%%%  KEY for user 1 %%%%%%

disp('%%%%%%  PN SEQ for user NO. 1 %%%%%%');
disp(' ');

G=64;  % Code length
%Generation of first pn-sequence using generator polynomial
sd1 =[0 0 0 0 1];             % Initial state of Shift register
PN1=[];                       % First m-sequence
for j=1:G
    PN1=[PN1 sd1(5)];
    if sd1(1)==sd1(4)
        temp1=0;
    else temp1=1;
    end
    sd1(1)=sd1(2);
    sd1(2)=sd1(3);
    sd1(3)=sd1(4);
    sd1(4)=sd1(5);
    sd1(5)=temp1;
end
figure()
subplot(2,1,1);
stem(PN1,'Color','r','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;
title('pn sequence generated for user 1 in 1 & 0')
disp(PN1);

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');

disp(' %%%% NRZ PN SEQ FOR USER NO.1 %%%');
disp(' ');

for i=1:length(PN1)
    if PN1(i)==0                                         %
        PN1(i)=-1;        % nrz conversion of PN seq ;               %
    end
end

disp(PN1);
lPN1=length(PN1);

subplot(2,1,2);
stem(PN1,'Color','b','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;
title('pn sequence generated for user 1 in NRZ')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');

%%%%%%  KEY for user 2 %%%%%%                                            %

disp('%%%%%%  pn seq for user 2 %%%%%%');     
disp(' ');
%% PN for user 2 %%
G2=64;  % Code length
%Generation of first pn-sequence using generator polynomial             %
sd2 =[0 0 0 1 1];             % Initial state of Shift register
PN2=[];                       % First m-sequence
for j1=1:G2
    PN2=[PN2 sd2(5)];                                                   %
    if sd2(1)==sd2(4)
        temp2=0;                                                        %
    else temp2=1;                                                       %
    end
    sd2(1)=sd2(2);
    sd2(2)=sd2(3);
    sd2(3)=sd2(4);                                                      %
    sd2(4)=sd2(5);
    sd2(5)=temp2;                                                       %
end
figure()
subplot(2,1,1);
stem(PN2,'Color','r','LineWidth',2.5);                                   %
axis([0 65 -1.5 1.5]);
grid on;                                                                %
title('pn sequence generated for user 2 in 1 & 0')
disp(PN2);                                                              %

% nrz conversion of PN seq

for i=1:length(PN2)                                                     %
    if PN2(i)==0
        PN2(i)=-1;                                                      %
    end
end

disp(' %%%% NRZ PN SEQ FOR USER NO.2 %%%');
disp(' ');

disp(PN2);                                                              %

subplot(2,1,2);                                                         %
stem(PN2,'Color','b','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;                                                                %
title('pn sequence generated for user 2 in NRZ')                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');
%% SPREADED DATA FOR USER NO.1 %%
disp(' %%%% SPREADED DATA FOR USER NO.1 %%%');
disp(' ');

sp_data1=[];
sp_data1=data_user1.*PN1;
disp(sp_data1);


figure()
subplot(3,1,1);                                                         %
stem(data_user1,'Color','r','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;                                                                %
title('data from user no. 1 in NRZ')

subplot(3,1,2);
stem(PN1,'Color','b','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;
title('pn sequence generated for user 1 in NRZ')

subplot(3,1,3);
stem(sp_data1,'Color','black','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;
title('Spreading for user 1 in NRZ');

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');
%%  SPREADED DATA FOR USER NO.2 %%
disp(' %%%% SPREADED DATA FOR USER NO.2 %%%');
disp(' ');

sp_data2=[];
sp_data2=data_user2.*PN2;
disp(sp_data2);


figure()
subplot(3,1,1);                                                         %
stem(data_user2,'Color','r','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;                                                                %
title('data from user no. 2 in NRZ')

subplot(3,1,2);
stem(PN2,'Color','b','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;
title('pn sequence generated for user 2 in NRZ')

subplot(3,1,3);
stem(sp_data2,'Color','black','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;
title('Spreading for user 2 in NRZ');

disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');

disp(' %%%% TOTAL SPREADED DATA FOR BOTH USERS %%%');
disp(' ');

sp_data=sp_data1+sp_data2;
disp(sp_data);
lsp_data=length(sp_data);


figure()
subplot(3,1,1);                                                         %
stem(sp_data1,'Color','r','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;                                                                %
title('spreaded data from user no. 1 in NRZ')

subplot(3,1,2);
stem(sp_data2,'Color','b','LineWidth',2.5);
axis([0 65 -1.5 1.5]);
grid on;
title('spreaded data from user no. 2 in NRZ')

subplot(3,1,3);
stem(sp_data,'Color','black','LineWidth',2.5);
axis([0 65 -2.5 2.5]);
grid on;
title('total Spreading');


sp_data01=[];
for i=1:lsp_data
    
    if sp_data(i)==1
        sp_data01=[sp_data 1];
    else
        sp_data01=[sp_data -1];
    end
    
end

disp(sp_data01);
lsp_data01=length(sp_data01);

%% BPSK MODULATION FOR spreaded data %%

%%%% BPSK MODULATION FOR spreaded data

tb=1;
eb=1;
fc=10000;
bpskmod_sig=[];
for i0=1:lsp_data01-1
    for j1=1:tb
        bpskmod_sig=[bpskmod_sig sqrt(2*(eb/tb))*sp_data01(i0)*cos(2*pi*fc*j1)];
    end
end
lbpskmod_sig=length(bpskmod_sig);
figure();
plot(bpskmod_sig,'Color','black','LineWidth',2.5);
axis([0 65 -3.5 3.5]);
grid on;
title(' BPSK Modulated signal for spreaded data for transmitter ');

%% Transmission of BPSK MODULATed data Over awgn channel %%
%%%% Transmission of BPSK MODULATed data Over awgn channel

tx_sig=awgn(bpskmod_sig,5);

figure();
plot(tx_sig,'Color','m','LineWidth',2.5);
grid on;
title(' Transmission of BPSK MODULATed data Over awgn channel ');

%% DEMODULATION FOR user 1 %%

%%%% DEMODULATION FOR user 1
rx_user1=tx_sig.*PN1;

%BPSK DEMODULATION FOR user 1 
demodcar_user1=[];
for i=1:ld1
    for j=0.1:1:tb
     demodcar_user1=[demodcar_user1 sqrt(2*(eb/tb))*cos(2*pi*fc*j)];

 end
end
 
bpskdemod_user1=rx_user1.*demodcar_user1;

figure();
subplot(2,1,1);     
plot(bpskdemod_user1,'Color','b','LineWidth',2.5);
title(' o/p of bpsk demodulation for user 1 ');
grid on;

%  sync for matrix addition multiplication
 
lbpskdemod_user1=length(bpskdemod_user1);
sum_user1=zeros(1,lbpskdemod_user1);

rxbits_user1=[sum_user1+bpskdemod_user1];

if sum(rxbits_user1(1:8))>0
    rcvd_bit_user1(1)=1;
else
    rcvd_bit_user1(1)=0;
end
if sum(rxbits_user1(9:16))>0
    rcvd_bit_user1(2)=1;
else
    rcvd_bit_user1(2)=0;
end
if sum(rxbits_user1(17:24))>0
    rcvd_bit_user1(3)=1;
else
    rcvd_bit_user1(3)=0;
end
if sum(rxbits_user1(25:32))>0
    rcvd_bit_user1(4)=1;
else
    rcvd_bit_user1(4)=0;
end
if sum(rxbits_user1(33:40))>0
    rcvd_bit_user1(5)=1;
else
    rcvd_bit_user1(5)=0;
end
if sum(rxbits_user1(41:48))>0
    rcvd_bit_user1(6)=1;
else
    rcvd_bit_user1(6)=0;
end
if sum(rxbits_user1(49:54))>0
    rcvd_bit_user1(7)=1;
else
    rcvd_bit_user1(7)=0;
end
if sum(rxbits_user1(55:64))>0
    rcvd_bit_user1(8)=1;
else
    rcvd_bit_user1(8)=0;
end
rcvd_bit_user1=[rcvd_bit_user1(1) rcvd_bit_user1(2) rcvd_bit_user1(3) rcvd_bit_user1(4) rcvd_bit_user1(5) rcvd_bit_user1(6) rcvd_bit_user1(7) rcvd_bit_user1(8)];

subplot(2,1,2);    
stem(rcvd_bit_user1,'Color','black','LineWidth',2.5);
axis([0 9 -1.5 1.5]);
title(' recived binary data for user 1 ');
grid on;

%% DEMODULATION FOR user 2 %%
%%%% DEMODULATION FOR user 2

rx_user2=tx_sig.*PN2;

%BPSK DEMODULATION FOR user 2 
demodcar_user2=[];
for i=1:ld2
    for j=0.1:1:tb
     demodcar_user2=[demodcar_user2 sqrt(2*(eb/tb))*cos(2*pi*fc*j)];

 end
end
 
bpskdemod_user2=rx_user2.*demodcar_user2;

figure();
subplot(2,1,1);     
plot(bpskdemod_user2,'Color','b','LineWidth',2.5);
title(' o/p of bpsk demodulation for user 2');
grid on;

%  sync for matrix addition multiplication
 
lbpskdemod_user2=length(bpskdemod_user2);
sum_user2=zeros(1,lbpskdemod_user2);


rxbits_user2=[sum_user2+bpskdemod_user2];

if sum(rxbits_user2(1:8))>0
    rcvd_bit_user2(1)=1;
else
    rcvd_bit_user2(1)=0;
end
if sum(rxbits_user2(9:16))>0
    rcvd_bit_user2(2)=1;
else
    rcvd_bit_user2(2)=0;
end
if sum(rxbits_user2(17:24))>0
    rcvd_bit_user2(3)=1;
else
    rcvd_bit_user2(3)=0;
end
if sum(rxbits_user2(25:32))>0
    rcvd_bit_user2(4)=1;
else
    rcvd_bit_user2(4)=0;
end
if sum(rxbits_user2(33:40))>0
    rcvd_bit_user2(5)=1;
else
    rcvd_bit_user2(5)=0;
end
if sum(rxbits_user2(41:48))>0
    rcvd_bit_user2(6)=1;
else
    rcvd_bit_user2(6)=0;
end
if sum(rxbits_user2(49:54))>0
    rcvd_bit_user2(7)=1;
else
    rcvd_bit_user2(7)=0;
end
if sum(rxbits_user2(55:64))>0
    rcvd_bit_user2(8)=1;
else
    rcvd_bit_user2(8)=0;
end
rcvd_bit_user2=[rcvd_bit_user2(1) rcvd_bit_user2(2) rcvd_bit_user2(3) rcvd_bit_user2(4) rcvd_bit_user2(5) rcvd_bit_user2(6) rcvd_bit_user2(7) rcvd_bit_user2(8)];
subplot(2,1,2);    
stem(rcvd_bit_user2,'Color','black','LineWidth',2.5);
axis([0 9 -1.5 1.5]);
title(' recived binary data for user 2 ');
grid on;




