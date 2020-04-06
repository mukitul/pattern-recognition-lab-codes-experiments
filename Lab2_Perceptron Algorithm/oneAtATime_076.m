clc
clear
%class 1
x1=[1 1 4];
y1=[1 -1 5];
w1=[x1;y1];
%class 2
x2=[2 0 2];
y2=[2.5 2 3];
w2=[x2;y2];
%hold on;
%p1=plot(x1,y1,'ro');
%p2=plot(x2,y2,'gs');

%legend([p1 p2],{'class 1', 'class 2'});
for i=1:3
    y_w1(i,:)=[x1(i)^2 y1(i)^2 x1(i)*y1(i) x1(i) y1(i) 1];
    y_w2(i,:)=[x2(i)^2 y2(i)^2 x2(i)*y2(i) x2(i) y2(i) 1];
end
disp('high dimensional class 1');
disp(y_w1);

disp('high dimensional class 2');
disp(y_w2);

nor_y_w2 = -y_w2;
disp('high dimensional class 2 normalized');
disp(nor_y_w2);
y=[y_w1' nor_y_w2'];
disp(y);

alpha=(1+ mod(76,10))/10;

a = ones(6,1);

epoch = 1;

while (true)
    posVal=0;
    disp('Epoch:');
    disp(epoch);
    for i=1:6
        res(i,:)= a' *y(:,i); 
    end
    disp('result of each row vector:');
    disp(res');
    for i=1:6
        if res(i,:)> 0
            posVal = posVal+1;
        else
            a = a + ((alpha) .*y(:,i));
            disp('new weight');
            disp(a');
        end
    end

    if posVal == 6
        disp('done');
        disp('Total number of epoch:');
        disp(epoch);
        break;
    end
    epoch = epoch + 1;
end
disp('final weights');
disp(a');
syms b1 b2;
s=sym(a(1,1)*b1*b1+a(2,1)*b2*b2+a(3,1)*b1*b2+a(4,1)*b1+a(5,1)*b2+a(6,1));
s2=solve(s,b2);

xvals1= -10:0.02:10;
xvals2(1,:)=subs(s2(1),b1,xvals1);

%hold on;
%plot(xvals1,xvals2(1,:),'k');
%grid;

%hold off;

