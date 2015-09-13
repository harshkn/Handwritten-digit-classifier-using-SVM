clear variables
load( 'trainfeatures.mat');
load( 'testfeatures.mat' );
trainfeat = [];
class = [];
testfeat = [];
Ntrain = 700;
Ntest = 1000 - Ntrain;
fprintf('Preparing data for training the SVM ... ');
for labels = 1:10
    temptr =  horzcat(trainfeatures(labels).avgCorrFeat',  ...
                        trainfeatures(labels).pixContribCorr',   ...
                        trainfeatures(labels).objectArea',  ...
                        trainfeatures(labels).quadPixPercent'); % , ...
%                         trainfeatures(labels).eucDistance' ); 
    trainfeat = [trainfeat ; temptr];
                     
    tempte = horzcat(testfeatures(labels).avgCorrFeat',  ...
                        testfeatures(labels).pixContribCorr',   ...
                        testfeatures(labels).objectArea', ...
                        testfeatures(labels).quadPixPercent'); %,  ...
%                         testfeatures(labels).eucDistance' );                
    testfeat = [testfeat ;  tempte];
    class = [class ; labels * ones(Ntrain,1) ];
%     
end


fprintf(' DONE \n');
fprintf('Training and classifying using SVM \n');
cmat = zeros(10,10);
for dig1 = 1:10
    for  dig2 = 1:10
        if(dig1 ~= dig2)
%             dig1 = 7;
%             dig2 = 4;
% fprintf('Training with digits %d and %d ...', dig1,dig2);
            dig1train = trainfeat((dig1 -1) * Ntrain + 1: dig1*Ntrain,:);
            dig2train = trainfeat((dig2-1) * Ntrain + 1: dig2*Ntrain,:);

            dig1test = testfeat((dig1 -1) * Ntest + 1: dig1*Ntest,:);
            dig2test = testfeat((dig2-1) * Ntest + 1: dig2*Ntest,:);

            trainlabel = [ dig1 * ones(Ntrain,1) ; dig2 * ones(Ntrain,1) ];
            testlabel = [ dig1 * ones(Ntest,1) ; dig2 * ones(Ntest,1) ];
            temptrainfeats = [dig1train ; dig2train];
            temptestfeats = [dig1test ; dig2test];

            mod = svmtrain(temptrainfeats, trainlabel);
%             fprintf(' DONE \n');
%             fprintf('Classifying ... ');
            res = svmclassify(mod,temptestfeats);
%             fprintf(' DONE \n');
            C = confusionmat(res,testlabel);
            cmat(dig1,dig1) =  cmat(dig1,dig1) + C(1,1);
            cmat(dig2,dig2) =  cmat(dig2,dig2) + C(2,2);
            cmat(dig1,dig2) =  cmat(dig1,dig2) + C(1,2);
            cmat(dig2,dig1) =  cmat(dig2,dig1) + C(2,1);
            
        end
    end
end
fprintf(' DONE \n');
fprintf(' Saving the confusion matrix ... ');
save('cmat7feat.mat', 'cmat');
fprintf(' DONE \n');

