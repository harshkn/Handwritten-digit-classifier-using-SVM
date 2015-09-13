function objectareafeat = calObjectArea(indTrainDigit)
    noImages = size(indTrainDigit, 1);
    for im = 1:noImages
        objectareafeat(im) = bwarea(squeeze(indTrainDigit(im,:,:)));
    end
end