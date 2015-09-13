function areaofholes = calAreaOfHoles(noofholes)
for im = 1:length(noofholes)
    imh = noofholes{im};
    for holes = 1: length(imh)
        tempbw = imh{holes};
        tempar{holes} = polyarea(tempbw(:,1), tempbw(:,2)) ;
    end
    areaofholes{im} = tempar;
end
