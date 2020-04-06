clc
clear
%class 1
x1=[1 2 4 5];
y1=[1 1 3 4];
hold on;
p1=plot(x1,'ro');
p2=plot(y1,'gs');
legend([p1,p2],{'class 1', 'class 2'});
count=1;
c1=[1 1];
c2=[2 1];
index=1;
while(true)
d1=[];
d2=[];

for i=1:4
    d1(i) = sqrt( ((x1(i) - c1(1))^2) + ((y1(i) - c1(2))^2) );
    d2(i) = sqrt( ((x1(i) - c2(1))^2) + ((y1(i) - c2(2))^2) );
end

g1=[];
g2=[];

for i=1:4
    if d1(i)<d2(i)
        g1(i) = 1;
        g2(i) = 0;
    end
    if d1(i)>d2(i)
        g1(i) = 0;
        g2(i) = 1;
    end
end

d=[d1;d2]
g=[g1;g2]

G{1,index}=g;
index=index+1;
sum1_x1=0;
sum1_y1=0;

sum2_x1=0;
sum2_y1=0;
div1=0;
div2=0;
for i=1:4
    if g1(i)==1
        div1=div1+1;
        sum1_x1=sum1_x1+x1(i);
        sum1_y1=sum1_y1+y1(i);
        
    end
    if g2(i)==1
        div2=div2+1;
        sum2_x1=sum2_x1+x1(i);
        sum2_y1=sum2_y1+y1(i);
    end
end

c1=[sum1_x1/div1 sum1_y1/div1];
c2=[sum2_x1/div2 sum2_y1/div2];

c1
c2
[c,num_of_mat]=size(G);
for i=1:num_of_mat-1
    if isequal(G{1,i},G{1,i+1})
        flag=1;
    end
end
if(flag==1)
    break;
end
end