clear all;
close all;
clc;
data=xlsread('E:\dataa.xlsx',1);
n=input('tedad feature ha:');
y=data(:,end);
pw0=numel(find(y==0))/numel(y)
pw1=numel(find(y==1))/numel(y)
pw0givenx=1
pw1givenx=1
for i=1:n

  A=data(:,i);
  y=data(:,end);

  mu0A=mean(A(y==0));
  sigma0A=std(A(y==0));
  mu1A=mean(A(y==1));
  sigma1A=std(A(y==1));

  xtest=81;
  pw0givenx=pw0givenx*normpdf(xtest,mu0A,sigma0A)
  pw1givenx=pw1givenx*normpdf(xtest,mu1A,sigma1A)

end

pw0givenx=pw0givenx*pw0
pw1givenx=pw1givenx*pw1

if pw1givenx > pw0givenx
    disp('naive bayes prediction is passed .')
  else
     disp('naive bayes prediction is failed .')
end   