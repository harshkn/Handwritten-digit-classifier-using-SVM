function avgcorrfeat =  calAvgDigitCorr(indTrainDigit)
    noImages = size(indTrainDigit, 1);
    t = reshape(indTrainDigit, [noImages, numel(indTrainDigit(1,:,:))]);
    meandigit = squeeze(mean(t, 1));
    meanImage = reshape(meandigit, [28, 28]);
    
     for im = 1:noImages
        avgcorrfeat(im) = corr2(squeeze(meanImage(:,:)), squeeze(indTrainDigit(im,:,:)));
     end
end