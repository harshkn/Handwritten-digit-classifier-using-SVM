function quadpixperfeat = calQuaPixelPercent(indTrainDigit)
    noImages = size(indTrainDigit, 1);
    for im = 1:noImages
        quadpixperfeat(1,im) = bwarea(squeeze(indTrainDigit(im,1:14,1:14)));
        quadpixperfeat(2,im) = bwarea(squeeze(indTrainDigit(im,15:28,1:14)));
        quadpixperfeat(3,im) = bwarea(squeeze(indTrainDigit(im,1:14,15:28)));
        quadpixperfeat(4,im) = bwarea(squeeze(indTrainDigit(im,15:28,15:28)));
    end
end