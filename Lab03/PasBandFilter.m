clear all
clc

%sample at f_s=1000Hz for 0.3 sec
fs=1000;
t=0:1/fs:0.3;

%Filter design
Wp = 40/(fs/2); Ws = 200/(fs/2);
[n,Wn] = buttord(Wp,Ws,3,40)

[b,a] = butter(n,Wn);

%Plotting freq Resp
freqz(b,a)

%Creating a sample sine wave
phase_sin=0;
amp_sin=1; %Amp of the created signal
f_sin=40; %Freq of the created signal
omega_sin=2*pi*f_sin;

signal_sin=amp_sin*sin(omega_sin*t+phase_sin);

%Creating a noise wave with the same amp
phase_noise = 0;
amp_noise = 1;
f_noise = 200; % 400Hz noise signal
omega_noise = 2*pi*f_noise;
signal_noise = amp_noise*sin(omega_noise*t + phase_noise);

% Combine sin signal with noise
signal_combined = signal_sin + signal_noise;

figure(2)
plot (t, signal_sin );
hold on
plot (t, signal_combined );

%Check if the filter works well
Y=filter(b,a,signal_combined);
figure(3)
plot (t, Y );

%Export the signal with the noise to a file
csvwrite("x_signal.csv", signal_combined.');

%Import the output of the C-filter and plot it
Y_signal = csvread("y_signal.csv").';

figure(4)
plot (t, Y );
hold on
plot(t,Y_signal);
