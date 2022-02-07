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

U=[1 0.828 0.779 0.756 0.743 0.734 0.728 0.724 0.720];
sum=0;
for j=1:i
    if i~=j
        sum=sum+(c(j)+2*S)/p(j);    
    else
        sum=sum+(c(j)+2*S+delta+B(i))/p(j);
    end
end

sum
U_n=U(i)

if sum<=U(i)
    fprintf('Schedulable!')
else
    fprintf('Try Exact Shcedulability Test!')
end

