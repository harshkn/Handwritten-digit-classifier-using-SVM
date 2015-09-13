clear variables
load('traindata.mat');
load('testdata.mat');

fprintf('Computing training and test data features ');
for digit = 1:10
    indTrainDigit = squeeze(allDigitTrainData(digit,:,:,:));
    indTestDigit = squeeze(allDigitTestData(digit,:,:,:));
    %% 1- correlation with average digit
    fprintf('Computing correlation with average digit for digit %d... ', digit);
    trainfeatures(digit).avgCorrFeat =  calAvgDigitCorr(indTrainDigit);
    testfeatures(digit).avgCorrFeat =  calAvgDigitCorr(indTestDigit);
    fprintf(' DONE \n');
    
    %% 2- correlation with pixel contribution
    fprintf('Computing correlation with pixel contribution for digit %d... ', digit);
    trainfeatures(digit).pixContribCorr = calPixelContributionCorr(indTrainDigit);
    testfeatures(digit).pixContribCorr = calPixelContributionCorr(indTestDigit);
    fprintf(' DONE \n');
    
    %% 3- computing the area occupied by each digit/ number of white pixels (almost)
    fprintf('Computing area occupied by digit %d... ', digit);
    trainfeatures(digit).objectArea = calObjectArea(indTrainDigit);
    testfeatures(digit).objectArea = calObjectArea(indTestDigit);
    fprintf(' DONE \n');

    %% 4- computing the pixel percent of 4 quadrants
    fprintf('Computing pixel percentage in 4 quadrants for digit %d... ', digit);
    trainfeatures(digit).quadPixPercent = calQuaPixelPercent(indTrainDigit);
    testfeatures(digit).quadPixPercent = calQuaPixelPercent(indTestDigit);
    fprintf(' DONE \n');
    
    %% 5- computing number of holes in the images
    fprintf('Computing number of holes in the image for digit %d... ', digit);
    trainfeatures(digit).noOfHoles = calNoOfHoles(indTrainDigit);
    testfeatures(digit).noOfHoles = calNoOfHoles(indTestDigit);
    fprintf(' DONE \n');
    
    %% 6- compute area of the holes 
    fprintf('Computing area of the holes in the image .for digit %d... ', digit);
    trainfeatures(digit).areaOfHoles = calAreaOfHoles(trainfeatures(digit).noOfHoles);
    testfeatures(digit).areaOfHoles = calAreaOfHoles(testfeatures(digit).noOfHoles);
    fprintf(' DONE \n');
    
    %% 7- compute euclidian distance
    fprintf('Computing euclidian distance between boundaries of image for digit %d... ', digit);
    trainfeatures(digit).eucDistance = calMaxEucDistance(indTrainDigit,trainfeatures(digit).noOfHoles);
    testfeatures(digit).eucDistance = calMaxEucDistance(indTestDigit,testfeatures(digit).noOfHoles);
    fprintf(' DONE \n');
%     
%     
    
%     plot(digit, mean(trainfeatures(digit).objectArea), '*')
%     hold on
%     waitforbuttonpress 
end

fprintf('Saving training an testing feature set ... ');
save( 'trainfeatures.mat', 'trainfeatures');
save( 'testfeatures.mat', 'testfeatures');
fprintf(' DONE \n');
