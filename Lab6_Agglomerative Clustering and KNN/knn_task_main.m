clc;
clear;

load irisdataset.txt
X = irisdataset;
k=4;

for i=1:50
    class(i,1)=1;
end
for i=51:100
    class(i,1)=2;
end

for i=100:150
    class(i,1)=3;
end

X=[X class];

[m,n] = size(X);
P = 0.90 ;
idx = randperm(m)  ;
Training = X(idx(1:round(P*m)),:); 
Testing_with_class = X(idx(round(P*m)+1:end),:);



%Training = X((1:135),:) ; 
%Testing_with_class = X((136:150),:);

Testing_main=Testing_with_class;
Testing_main(:,5)=[];

[r_test,c_test]=size(Testing_main);
[r_train,c_train]=size(Training);

%knn_function is called here
y=knn_function(Training,Testing_main,k);
Testing_result = [Testing_main y'];

correct=0;
wrong=0;
for i=1:r_test
    if(Testing_result(i,5)==Testing_with_class(i,5))
        correct=correct+1;
    else
        wrong = wrong+1;
    end
end
disp('Training data:');
disp(r_train);
disp('Testing data:');
disp(r_test);
%disp('wrong:')
%disp(wrong);

%--------------------------------------confusion matrix--------------------
class_1_test_data=0;
predict1_class_1=0;
predict1_class_2=0;
predict1_class_3=0;

class_2_test_data=0;
predict2_class_1=0;
predict2_class_2=0;
predict2_class_3=0;

class_3_test_data=0;
predict3_class_1=0;
predict3_class_2=0;
predict3_class_3=0;

for i=1:r_test
    if(Testing_with_class(i,5)==1)
        class_1_test_data=class_1_test_data+1;
    end
    if(Testing_result(i,5)==1 && Testing_with_class(i,5)==1)
        predict1_class_1=predict1_class_1+1;
    end
    if(Testing_result(i,5)==2 && Testing_with_class(i,5)==1)
        predict1_class_2=predict1_class_2+1;
    end
    
    if(Testing_result(i,5)==3 && Testing_with_class(i,5)==1)
        predict1_class_3=predict1_class_3+1;
    end
    
    if(Testing_with_class(i,5)==2)
        class_2_test_data=class_2_test_data+1;
    end
    if(Testing_result(i,5)==2 && Testing_with_class(i,5)==2)
        predict2_class_2=predict2_class_2+1;
    end
    if(Testing_result(i,5)==1 && Testing_with_class(i,5)==2)
        predict2_class_1=predict2_class_1+1;
    end
    
    if(Testing_result(i,5)==3 && Testing_with_class(i,5)==2)
        predict2_class_3=predict2_class_3+1;
    end
    
    if(Testing_with_class(i,5)==3)
        class_3_test_data=class_3_test_data+1;
    end
    if(Testing_result(i,5)==3 && Testing_with_class(i,5)==3)
        predict3_class_3=predict3_class_3+1;
    end
    if(Testing_result(i,5)==1 && Testing_with_class(i,5)==3)
        predict3_class_1=predict3_class_1+1;
    end
    
    if(Testing_result(i,5)==2 && Testing_with_class(i,5)==3)
        predict3_class_2=predict3_class_2+1;
    end
end
disp('    c 1   c 2   c 3');
conf=[predict1_class_1 predict1_class_2 predict1_class_3 class_1_test_data;
      predict2_class_1 predict2_class_2 predict2_class_3 class_2_test_data;
      predict3_class_1 predict3_class_2 predict3_class_3 class_3_test_data;];
disp(conf);
%------------------------------------------------------------------------------------
disp('correct:')
disp(correct);
disp('accuracy:');
accuracy = (correct/r_test)*100;
disp(accuracy);
tp=0;
fp=0;
fn=0;
for i=1:r_test
    if((Testing_result(i,5) == 1) && (Testing_with_class(i,5) == 1))
        tp=tp+1;
    end
    if((Testing_result(i,5) == 1) && ((Testing_with_class(i,5) == 2) || (Testing_with_class(i,5) == 3)))
        fp=fp+1;
    end
    if(((Testing_with_class(i,5) == 2) || ((Testing_with_class(i,5) == 3)) && (Testing_result(i,5) == 1)))
        fn=fn+1;
    end
end

precision = tp / (tp + fp);
recall = tp / (tp + fn);
F1 = (2 * precision * recall) / (precision + recall);
class_1=[precision recall F1];
disp('Precision    Recall    F1-score');
disp(class_1);