%% clean start!
close all;
clear variables;
clc;

%% Preprocessing data
data = xlsread('dataset.xlsx');
n = length(data(1,:));
w = data(:,end);
pw0 = numel(find(w==0))/numel(w);
pw1 = numel(find(w==1))/numel(w);
w0_normal_pdf = 1;
w1_normal_pdf = 1;

%% Calculate and Process data
for i=1:n-1

    C = data(:,i);
    w = data(:,end);

    w0_average = mean(C(w==0));
    w0_sigma = std(C(w==0));
    w1_average = mean(C(w==1));
    w1_sigma = std(C(w==1));

    % test value must be compatible with feature number.
    % e.g: first column is Student IQ so we pass 150 and
    % second column is Student mark so we pass 18
    test = [150, 18];
    w0_normal_pdf = w0_normal_pdf*normpdf(test(i), w0_average, w0_sigma);
    w1_normal_pdf = w1_normal_pdf*normpdf(test(i), w1_average, w1_sigma);

end

w0_normal_pdf = w0_normal_pdf*pw0;
w1_normal_pdf = w1_normal_pdf*pw1;

%% Display result
if w1_normal_pdf > w0_normal_pdf
	disp('Naive Bayes Prediction Passed')
else
    disp('Naive Bayes Prediction Failed')
end   