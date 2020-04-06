clc;
clear;
init_cluster=4;
sample_main = [0 1 4 5;
    1 0 2 6;
    4 2 0 3;
    5 6 3 0];

rowNames(1,1:4)  = {'a','b','c','d'};
colNames(1,1:4)  = {'a','b','c','d'};
sample=sample_main;
temp=0;
for i=1:init_cluster-1
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
    
    if(i==init_cluster-1)
        sample(1,1)=temp;
    end
    sTable = array2table(sample,'RowNames',rowNames,'VariableNames',colNames);
    display(sTable);
end
Z = linkage(sample_main)

figure()
dendrogram(Z);