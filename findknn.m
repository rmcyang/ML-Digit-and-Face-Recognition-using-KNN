function [indices,dists]=findknn(xTr,xTe,k)
% function [indices,dists]=findknn(xTr,xTe,k);
%
% Finds the k nearest neighbors of xTe in xTr.
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with m column-vectors of dimensionality d
% k = number of nearest neighbors to be found
% 
% Output:
% indices = kxm matrix, where indices(i,j) is the i^th nearest neighbor of xTe(:,j)
% dists = Euclidean distances to the respective nearest neighbors
%

% output random results, please erase this code
%[d,ntr]=size(xTr);
%[d,nte]=size(xTe);
%indices=ceil(rand(k,nte)*ntr);
%dists=rand(k,nte);
%if k>ntr,k=ntr;end;

%% fill in code here
D_disorder = l2distance(xTe, xTr); %m*n
[D_order, I] = sort(D_disorder,2);
D_order_k = D_order(:,1:k);  %m*k
I_k = I(:,1:k);
dists = D_order_k'; %k*m
indices = I_k';
%[m,~] = size(D_disorder);
%indices = zeros(m,k);
%for i = 1:m
%    for j = 1:k
        %[~, col] = find(D_disorder == D_order_k(i,j));
        %[~, col] = find(ismember(D_disorder, D_order_k(i,j)));
        %if(col == [225;225])
        %    col = 225;
        %end
%        indices(i,j) = col;
%    end
%end
%indices = indices';    
end	
	
