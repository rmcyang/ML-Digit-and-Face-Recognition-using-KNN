function preds=competition(xTr,yTr,xTe);
% function preds=competition(xTr,yTr,xTe);
%
% A classifier that outputs predictions for the data set xTe based on
% what it has learned from xTr,yTr
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with m column-vectors of dimensionality d
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

% The random classifier is awesome!!! Could you possibly do better?
%un=unique(yTr);
%[d,n]=size(xTe);
%preds=randi(length(un),1,n);

%fill in the code here
[~,n] = size(xTr);
numberOfTrainSet = round(0.8 * n);
k = 1;
acc = 0;
yValidation = yTr(1,numberOfTrainSet+1:end);
xValidation = xTr(:,numberOfTrainSet+1:end);
for i = 1:10
    predsValidation = knnclassifier(xTr(:,1:numberOfTrainSet), yTr(1,1:numberOfTrainSet), xValidation, k);
    acc_i = analyze('acc', yValidation, predsValidation);
    if acc_i > acc
        acc = acc_i;
        k = i;
    end
end
preds = knnclassifier(xTr,yTr,xTe,k);


end
