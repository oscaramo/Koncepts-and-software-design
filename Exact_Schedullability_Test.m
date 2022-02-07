clc
clear all

%Write the C and P of all tasks and desired Task(i) to calculate its shedulability
c=[5 10 20 40 100];
p=[50 100 100 150 350];
i=5;

%Write the switching time
S=0; 

%Blocking Terms
B=[0 20 20 10 0];

%Pre Period Deadlines
D=[6 100 100 150 350]; 
if D(i)==0
    delta=0;
else
    delta=p(i)-D(i);
end
%__________________________________________________________________________________

r=B(i);
for j=1:i
    r=r+c(j)+2*S;
end

r_next=0;
rl=[r];
n=0;

while r_next<=p(i)-delta
    r_next=0;
    for j=1:i-1
       r_next=r_next+ceil(r/p(j))*(c(j)+2*S);
    end
    r_next=(c(i)+2*S)+B(i)+r_next;

    n=n+1;
    rl(n+1)=r_next;
    
    if r_next==r
        break
    end
    r=r_next;
end

n   %Number of iterations
rl  %Results of each iteration

if r<=p(i)-delta
    fprintf('Schedulable!')
else
    fprintf('Not Schedulable...')
end



