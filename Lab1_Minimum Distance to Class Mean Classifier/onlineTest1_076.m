clc
clear
%1
x1=[2 3 3 -1 4 -2];
y1=[2 1 3 -3 2 -2];

w1 = [];
w2 = [];

x2=[1 -2 -1 -4 -4 2];
y2=[1 2 -1 2 3 6];
hold on;
plot(x1,y1,'r+',x2,y2,'g*');

%2
r1=[];
theta1=[];
r2=[];
theta2=[];
for i=1:6
    r1(i)=sqrt(x1(i)^2+y1(i)^2);
    theta1(i)=atan(y1(i)/x1(i));
    
    r2(i)=sqrt(x2(i)^2+y2(i)^2);
    theta2(i)=atan(y2(i)/x2(i));
end
disp(r1);
disp(theta1);
disp(r2);
disp(theta2);

%3
mean_r1=mean(r1);
mean_theta1=mean(theta1);
mean_r2=mean(r2);
mean_theta2=mean(theta2);

disp(mean_r1);
disp(mean_theta1);
disp(mean_r2);
disp(mean_theta2);

%test points
tx=[-1 3 -2 8];
ty=[1 2 1 2];

txr=[];
txtheta=[];

for i=1:4
    txr(i)=sqrt(tx(i)^2+ty(i)^2);%r3
    txtheta(i)=atan(ty(i)/tx(i));%theta4
end

disp(txr);
disp(txtheta);

for i=1:4
    d1 = sqrt((mean_r1^2 + txr(i)^2)- ((2*mean_r1*txr(i))* cos(mean_theta1 - txtheta)));
    
    d2 = sqrt((mean_r2^2 + txr(i)^2)- ((2*mean_r2*txr(i))* cos(mean_theta2 - txtheta)));
    
end

for i=1:4
    
    if d1(i)<d2(i)
        
        hold on;
        plot(txr(i),txtheta(i),'b+');
    end
    
    if d1(i)>d2(i)
        hold on;
        plot(txr(i),txtheta(i),'k*');
    end
end
