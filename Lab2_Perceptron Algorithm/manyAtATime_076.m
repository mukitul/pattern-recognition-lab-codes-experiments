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
disp('y');
disp(y);

alpha=(1+ mod(76,10))/10;
disp('initial weight:');
a = ones(6,1);
disp(a');
epoch = 1;

misclassified=[];
while (epoch<=2)
    index=1;
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
            misclassified(:,index)=y(:,i);
            index = index + 1;
        end
    end
    disp('misclassified');
    disp(misclassified');
    disp('sum of column of misclassified');
    disp(sum(misclassified'));
    
    a = a' +( (alpha) .* sum(misclassified'));
    
    disp('new weight:');
    disp(a);
    a=a';
    if posVal == 6
        disp('done');
        disp('Total number of epoch:');
        disp(epoch);
        break;
    end
    epoch = epoch + 1;
end