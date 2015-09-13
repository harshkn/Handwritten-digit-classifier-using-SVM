function noofholes = calNoOfHoles(indTrainDigit)
    noImages = size(indTrainDigit, 1);
    for im = 1:noImages
        BW = squeeze(indTrainDigit(im, :,:));
        [B,~] = bwboundaries(BW,'holes');
        noofholes{im} = B;
    end
end