clc
clear all

M= [0 0;
    0 0;
    2 10;
    20 0;
    0 10];
P=[50 100 100 150 150];
%________________________________________________________________
[Tasks,Semaphores]=size(M);

%Calculate the ceilings of the semaphores
Ceil=[];
for i=1:Semaphores
    for j=1:Tasks
        if M(j,i)~=0
            Ceil(i)=j;
            break
        end
    end
end

%B n_blocking_task
Bt=[];
for i=1:Tasks
    Bt(i)=0;
    if i+1>Tasks
        break
    end

    for j=i+1:Tasks
        l=[0];
        for k=1:Semaphores
            if Ceil(k)<=i
                l(k)=M(j,k);
            end
        end
        Bt(i)=Bt(i)+max(l);
        l=[0];
    end
end

%B m_blocking_section
Bs=[];
for i=1:Tasks
    Bs(i)=0;
    if i+1>Tasks
        break
    end
    
    for k=1:Semaphores  %For every k semaphore
        if Ceil(k)<=i   %Can K block Task i?
            l=[0];
            for j=i+1:Tasks
                l(j)=M(j,k);    %If yes add all lower tasks to list
            end
            Bs(i)=Bs(i)+max(l); %Add the max D of each semaphore that can block Task i
            l=[0];
        end     
    end
end

%Final B
B=[];
for i=1:Tasks
    B(i)=min(Bs(i),Bt(i));
end
Bs;
Bt;

%_________________________________________________________________________________________
%Using PCP
B_pcp=[0];
for i=1:Tasks
    B_pcp(i)=0;
    if i+1>Tasks
        break
    end

    l=[0];
    for j=i+1:Tasks
        ll=[0];
        for k=1:Semaphores
            if Ceil(k)<=i
                ll(k)=M(j,k);
            end
        end
        l(j)=max(ll);
    end
    B_pcp(i)=max(l);
end

l=[];
n=0;
for i=Tasks-1:-1:1   %If 2 tasks have the same period they share the B
    if P(i)==P(i+1)
        B(i)=B(i+1);
        B_pcp(i)=B_pcp(i+1);
    end
end

B
B_pcp