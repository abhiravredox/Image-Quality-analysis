clear all;clc;close all;
load myDataSet.mat;

%Calculating mu_b and mu_f.

p=size(B,1);   %number of blurred and focused patches in dataset
mu_B=zeros(8,8);
mu_F=zeros(8,8);
for i=1:p
    mu_B=mu_B+B{i,1};
    mu_F=mu_F+F{i,1};
end
mu_B=round(mu_B/p);
mu_F=round(mu_F/p);

