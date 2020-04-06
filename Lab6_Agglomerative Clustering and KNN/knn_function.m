function y=knn_function(input_sample,query,k)

[row,col]=size(input_sample);
[rq,cq]=size(query);
sample=input_sample;
class_prediction=[];
d=[];
j=1;
while(j<rq+1)
    for i= 1:row
        d(i,j)=((sample(i,1)-query(j,1))^2 + (sample(i,2)-query(j,2))^2 + (sample(i,3)-query(j,3))^2 + (sample(i,4)-query(j,4))^2);   
    end
    j=j+1;
end


for i= 1:rq
    sample=[sample d(:,i)];
    sample =sortrows(sample,col+1);

    for j=1:k
        k_nearest_neighbors(j,:)=sample(j,:);
    end

    %disp('k nearest neighbors of given query:');
    %disp(k_nearest_neighbors);

    A = k_nearest_neighbors(:,col);
    x = unique(A);
    N = numel(x);
    count = zeros(N,1);
    for k = 1:N
      count(k) = sum(A==x(k));
    end
    %disp('class----->no. of time');
    vote_count = [ x(:) count ];
    %disp(vote_count);

    vote_count =sortrows(vote_count,2);
    [v_r,v_c]=size(vote_count);
    
    class_prediction(:,i) = vote_count(v_r,1);
    sample(:,col+1)=[];
end
%disp(class_prediction);
y=class_prediction;

end

