clc;
clear all;

load irisdataset.txt
X = irisdataset;



[idx,C] = kmeans(X,3);



figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
hold on
plot(X(idx==3,1),X(idx==3,2),'g.','MarkerSize',12)
plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off


%confusion matrix

tx = tall(X);
ty = tall(X);
numObs = gather(length(ty));   % gather collects tall array into memory
s = RandStream('mlfg6331_64'); % For reproducibility
numTrain = floor(numObs/2);
[txTrain,trIdx] = datasample(s,tx,numTrain,'Replace',false);
tyTrain = ty(trIdx); 
mdl = fitctree(txTrain,tyTrain); 
txTest = tx(~trIdx,:);
label = predict(mdl,txTest);
tyTest = ty(~trIdx);
[C,order] = confusionmat(tyTest,label);