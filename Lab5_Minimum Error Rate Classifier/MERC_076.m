clc;
clear;

x1 = -7:.2:7;
x2 = -7:.2:7;
[X1,X2] = meshgrid(x1,x2); 

mu1 = [0 0];
Sigma1 = [.25 .3; .3 1];
F1 = mvnpdf([X1(:) X2(:)],mu1,Sigma1); 
F1 = reshape(F1,length(x2),length(x1));
meshc(X1,X2,F1);
axis([-7 7 -7 7 -1.0 .6])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
hold on;

mu2 = [2 2];
Sigma2 = [.5 .0; 0 .5];
F2 = mvnpdf([X1(:) X2(:)],mu2,Sigma2);
F2 = reshape(F2,length(x2),length(x1));
meshc(X1,X2,F2);
axis([-7 7 -7 7 -1.0 .6])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');

caxis([min(F2(:))-.5*range(F2(:)),max(F2(:))]);


%task 1 and 2
x = [1 1; 1 -1; 4 5; -2 2.5; 0 2; 2 -3];

for n=1:6
g1 = -log(2*pi)-0.5*log(det(Sigma1))-0.5*(x(n,:)'-mu1')'*inv(Sigma1)*(x(n,:)'-mu1')+log(0.5);
g2 = -log(2*pi)-0.5*log(det(Sigma2))-0.5*(x(n,:)'-mu2')'*inv(Sigma2)*(x(n,:)'-mu2')+log(0.5);

if g1>g2
    plot3(x(n,1),x(n,2),-1.0,'rd');
else
    plot3(x(n,1),x(n,2),-1.0,'gs');
end
end

syms x1 x2;
g1 = -log(2*pi) - 0.5*log(det(Sigma1)) - 0.5*([x1;x2]-mu1')'*(Sigma1^-1)*([x1;x2]-mu1') + log(0.5);
g2 = -log(2*pi) - 0.5*log(det(Sigma2)) - 0.5*([x1;x2]-mu2')'*(Sigma2^-1)*([x1;x2]-mu2') + log(0.5);
g = g1 - g2;
L3=ezplot(g, [ [-10,10], [-10,10] ]);     
