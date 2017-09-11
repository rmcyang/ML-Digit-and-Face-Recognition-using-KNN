function preds=knnclassifier(xTr,yTr,xTe,k)
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with m column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
%[d,n]=size(xTe);
%[d,ntr]=size(xTr);
%if k>ntr,k=ntr;end;

%currently assigning random predictions
%un=unique(yTr);
%preds=un(ceil(rand(1,n)*length(un)));

%% fill in code here
[indices,~]=findknn(xTr,xTe,k);
if k==1
    preds = yTr(indices);
elseif k==2
    preds = yTr(indices(1,:));
else
    %C = yTr(indices);
    %[A, B] = mode(C);
    %for i = 1:length(B)
    %    if B(i) == 1
    %        A(i) = C(1,i);
    %    end
    %end
    %preds = A;
    [A,~,C] = mode(yTr(indices));
    cell = cellfun(@length, C);  
    if (~all(cell == ones(1,length(A))))   
        ties = (cell ~= ones(1, length(A)));
        tiesIndices = find(ties == 1);
        A_breakTies = mode(yTr(indices(1:k-1,:)));
        A(tiesIndices) = A_breakTies(tiesIndices);
    end
    preds = A;
end

end
