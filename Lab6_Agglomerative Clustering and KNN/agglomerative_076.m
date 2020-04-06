clc;
clear;

sample_main = [0.00 0.71 5.66 3.61 4.24 3.20;
               0.71 0.00 4.95 2.92 3.54 2.50;
               5.66 4.95 0.00 2.24 1.41 2.50;
               3.61 2.92 2.24 0.00 1.00 0.50;
               4.24 3.54 1.41 1.00 0.00 1.12;
               3.20 2.50 2.50 0.50 1.12 0.00];

rowNames(1,1:6)  = {'a','b','c','d','e','f'};
colNames(1,1:6)  = {'a','b','c','d','e','f'};
sample=sample_main;
temp=0;
for i=1:5
dist1=[];
dist2=[];
min_val = min(sample(sample>0));
[r_pos,c_pos] = find(sample == min_val);

rowNames{1,c_pos(1)}= strcat(colNames{1,c_pos(1)},{''},rowNames{1,r_pos(1)});
rowNames(1,c_pos(1))= rowNames{1,c_pos(1)};

colNames{1,c_pos(1)}= strcat(colNames{1,c_pos(1)},{''},rowNames{1,r_pos(1)});
colNames(1,c_pos(1))= colNames{1,c_pos(1)};


[r,c]=size(sample);
if(i==1)
    for j=1:c-1

        dist1(j)= min((sample(c_pos(1),j)),(sample(r_pos(1),j)));
    end

    for j=1:c-1
        dist2(j)= min((sample(j,c_pos(1))),(sample(j,r_pos(1))));
    end
    
    for j=1:c-1
        sample(c_pos(1),j)=dist1(j);
    end
    for j=1:c-1
        sample(j,c_pos(1))=dist2(j);
    end
else
    if(c==2)
        temp=min(sample(sample ~=0));
    end
        
    for j=1:c
        dist1(j)= min((sample(c_pos(1),j)),(sample(r_pos(1),j)));
    end    
    for j=1:c
        dist2(j)= min((sample(j,c_pos(1))),(sample(j,r_pos(1))));
    end
    
    for j=1:c
        sample(c_pos(1),j)=dist1(j);
    end
    for j=1:c
        sample(j,c_pos(1))=dist2(j);
    end

end

sample(r_pos(1),:)=[];
sample(:,r_pos(1))=[];

rowNames(r_pos(1))=[];
colNames(r_pos(1))=[];

if(i==5)
    sample(1,1)=temp;
end
sTable = array2table(sample,'RowNames',rowNames,'VariableNames',colNames);
display(sTable);
end
Z = linkage(sample_main);
figure()
dendrogram(Z);