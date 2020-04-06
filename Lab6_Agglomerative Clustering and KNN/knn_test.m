clc;
clear;
k=3;
input_sample = [7 7 0;
                7 4 0;
                3 4 1;
                1 4 1];
[row,col]=size(input_sample);
sample=input_sample;
 query=[3 7];
 d=[];

 for i= 1:4
      d(i)=(sample(i,1)-query(1,1))^2 + (sample(i,2)-query(1,2))^2;
 end
 
sample=[sample d'];
sample =sortrows(sample,col+1);

for i=k+1:row
    sample(i,:)=[];
end

k_nearest_neighbors=sample;
disp('k nearest neighbors of given query:');
disp(k_nearest_neighbors);

%0=bad  1=good

A = sample(:,col);
x = unique(A);
N = numel(x);
count = zeros(N,1);
for k = 1:N
  count(k) = sum(A==x(k));
end
disp('class---->votes');
vote_count = [ x(:) count ];
disp(vote_count);

max_val = max(vote_count(:,2));
[r_pos,c_pos] = find(vote_count == max_val);


query_class = vote_count(r_pos,c_pos-1);
if(query_class==0)
    disp('Class of the query: BAD');
else
    disp('Class of the query: GOOD');
end
