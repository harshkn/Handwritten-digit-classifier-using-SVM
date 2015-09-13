function maxeucdistance = calMaxEucDistance(indTrainDigit,noOfHoles)
noImages = size(indTrainDigit, 1);
for im = 1:length(noOfHoles)
    imh = noOfHoles{im};
    for holes = 1: length(imh)
        tempbw = imh{holes};
        dist = sqrt((tempbw(:,1) - tempbw(:,2)) .^2) ;
        maxdist(holes) = max(dist);
    end
    maxeucdistance(im) = max(maxdist);
end