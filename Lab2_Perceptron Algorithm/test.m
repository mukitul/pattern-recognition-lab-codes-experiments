syms x1 x2;
s=sym(10*x1*x1-6*x2*x2+24*x1*x2-24*x1-68*x2+65);
s2=solve(s,x2);
xvals1=-10:0.01:10;
xvals2(1,:)= subs(s2(1),x1,xvals1);
hold on;
plot(xvals1,xvals2(1,:),'k');
grid;

%Class S1
plot(1,1,'ro');
plot(1, -1,'ro');
plot(4,5,'ro');
%Class S2
plot(2,2,'gs');
plot(0,2,'gs');
plot(2,3,'gs');
hold off;