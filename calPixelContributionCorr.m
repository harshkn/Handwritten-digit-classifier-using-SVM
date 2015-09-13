function pixcontribcorr =  calPixelContributionCorr(indTrainDigit)
    noImages = size(indTrainDigit, 1);
    t = reshape(indTrainDigit, [noImages, numel(indTrainDigit(1,:,:))]);
    pixValDigit = squeeze(sum(t,1));
    pixValImage(1,:,:) = reshape(pixValDigit, [28, 28]);
    temppixvaldigit = indTrainDigit ./ sum(pixValImage(:)) ;
    pixcontrib = squeeze(sum(temppixvaldigit,1));
    
    for im = 1:noImages
        pixcontribcorr(im) = corr2(pixcontrib, squeeze(indTrainDigit(im,:,:)));
    end
     
%     repmat(pixValImage(1,:,:), size(indTrainDigit, 1)