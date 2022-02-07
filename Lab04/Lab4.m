clear all
clc

J=0.01;
b=0.1;
Kt=0.01;
L=0.05;
R=0.75;
Ke=0.01;

a=L*J/Kt;
b=L*b/Kt+R*J/Kt;
c=R*b/Kt+Ke;

%   Find the transfer function of the DC-Motor system
s = tf('s');
P = 1/(a*s^2 + b*s + c);

%   Prove that the open-loop system is stable
pzmap(P)    %Negative Poles

%   Find the step-response of the open-loop system Design
figure(2)
step(P)

%Proportional Control
Kp = 1800;
C = pid(Kp);
T = feedback(C*P,1);
t = 0:0.01:2;
figure(3)
step(T,t)

%Proportional Derivative
Kd=2;
C = pid(Kp,0,Kd);
T = feedback(C*P,1);
figure(4)
step(T,t)

%Proportional Integral Derivative
Ki=500;
C = pid(Kp,Ki,Kd);
T = feedback(C*P,1);
figure(5)
step(T,t)