clc
clear
%class 1
x1=[2 3 3 -1 4 -2];
y1=[2 1 3 -3 2 -2];
w1=[x1;y1];
%class 2
x2=[0 -2 -1 -4 -4 2];
y2=[0 2 -1 2 3 6];
w2=[x2;y2];
hold on;
p1=plot(x1,y1,'r+');
p2=plot(x2,y2,'g*');
y1=w1';
y2=w2';

mean_y1=mean(y1);
mean_y2=mean(y2);

disp('class 1');
disp(y1);
disp('class 2');
disp(y2);

disp('class 1 mean');
disp(mean_y1);
disp('class 2 mean');
disp(mean_y2);
hold on;
p3=plot(mean_y1(1),mean_y1(2),'o','MarkerEdgeColor','r');
hold on;
p4=plot(mean_y2(1),mean_y2(2),'o','MarkerEdgeColor','g');

%test points
tx=[-1 3 -2 8];
ty=[1 2 1 2];

t=[tx;ty];
x=t';
disp('testing points');
disp(x);

for i=1:4
    g1=(x(i,:)'*mean_y1) - (0.5*(mean_y1'*mean_y1));
    g2=(x(i,:)'*mean_y2) - (0.5*(mean_y2'*mean_y2));
    
end

for i=1:4
    if g1(i)>g2(i)
        hold on;
        p5=plot(x(i,1),x(i,2),'b+');
    else if g1(i)<g2(i)
           hold on;
           p6=plot(x(i,1),x(i,2),'k*'); 
        end
    end
end

w=(mean_y1-mean_y2);
w0= -0.5*det(((mean_y1'*mean_y1)-(mean_y2'*mean_y2)));

max_x=max(max(x1,x2));
min_x=min(min(x1,x2));

all_x=min_x:2:max_x;

c=(mean_y1(1,2)-mean_y2(1,2))/2;

for i=1:length(all_x)
    dby(i,:)=((w(1,1)*all_x(:,i)+(w0*(c/2)))/(w(1,2)));
end

db=[all_x' dby];
db
hold on;
p7=plot(db(:,1),db(:,2),'k-.');
legend([p1 p2 p3 p4 p5 p6 p7],{'class 1', 'class 2','class 1 mean','class 2 mean','Test class 1','Test class 2','decision boundary'});
hold off;