clear all;
clc;
x1=[1 2 4 5];
y1=[1 1 3 4];
c1=[1 1];
c2=[2 1];

c1new=zeros(1,2);
c2new=zeros(1,2);
epo=1;
while(true)
%printf('epoch is %d',epo);
disp('**************');
epo=epo+1;
d=zeros(2,4);
g=zeros(2,4);
for i=1:4
    disc1=0;
    disc2=0;
    %dis=sqrt(pow(x1(1,i),2)+pow(y1(1,i),2));
    disc1=sqrt((x1(1,i)-c1(1,1))^2+(y1(1,i)-c1(1,2))^2);
    d(1,i)=disc1;
    %disc2=sqrt(pow(x1(1,i)-c2(1,1),2)+pow(y1(1,i)-c2(1,2),2));
    disc2=sqrt((x1(1,i)-c2(1,1))^2+(y1(1,i)-c2(1,2))^2);
    d(2,i)=disc2;
    %disp(disc1);
    %disp(disc2);
    %disp('*******');
    if(disc1>disc2)
       g(1,i)=1;
    else
        g(2,i)=1;
    end
        
end
disp(d);
disp(g);

count=0;
sumx=0;
sumy=0;
for i=1:4
    if(g(1,i)==1)
       sumx=sumx+x1(1,i);
       sumy=sumy+y1(1,i);
       count=count+1;
    end    
end
sumx=sumx/count;
sumy=sumy/count;
%c1(1,1)=sumx;
%c1(1,2)=sumy;
%disp(c1);
c1new(1,1)=sumx;
c1new(1,2)=sumy;
disp(c1new);

count=0;
sumx=0;
sumy=0;
for i=1:4
    if(g(2,i)==1)
       sumx=sumx+x1(1,i);
       sumy=sumy+y1(1,i);
       count=count+1;
    end    
end
sumx=sumx/count;
sumy=sumy/count;
%c2(1,1)=sumx;
%c2(1,2)=sumy;
%disp(c2);
c2new(1,1)=sumx;
c2new(1,2)=sumy;
disp(c2new);

if(c1==c1new && c2==c2new)
    break;
end

end



