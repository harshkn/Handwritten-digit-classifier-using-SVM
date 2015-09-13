clear variables 
pth = pwd;
suffix = '1234567890';

fprintf('Saving individual data sets ....');
for numeral = 1:10
    fn = strcat(pth , '/data/data' ,suffix(numeral));
    fid = fopen(fn,'r'); 
    num = [];
    for i = 1:1000
        num(i,:,:) = fread(fid,[28 28]);
    end
    save( strcat('num' , suffix(numeral), '.mat'), 'num');
end
clear num

fprintf(' DONE \n');
fprintf('Creating test and training datasets .... ');


allDigitTrainData = [];
allDigitTestData = [];
trainIndex = 700;
testIndex = 1000;

for i = 1:10
    fn = strcat('num', suffix(i), '.mat');
    load(fn);
    allDigitTrainData(i,:,:,:) = num(1:trainIndex, :,:);
    allDigitTestData(i,:,:,:) = num(trainIndex +1 :testIndex, :,:);
    clear num
end

save( 'traindata.mat', 'allDigitTrainData');
save( 'testdata.mat', 'allDigitTestData');

fprintf(' DONE \n');







