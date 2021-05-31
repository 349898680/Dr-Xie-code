% Implements the framework presented in
% "Oil types identification based on excitation-emission matrix of laser induced fluorescence and deep convolutional neural network" 
% By Ying Li, Yunpeng Jia, Xiaohua Cai, Ming Xie*, Zhanjun Ma.

%% Data preprocessing on the database
%% Please consult the corresponding author (mingxie@dlmu.edu.cn) for the full collection of data.
% The demo data includes the spectrum of four types of oil obtained under three types of thickness and two types of wind condition.


clc; clear; close all;

database=[]; % Initialize database
label=[]; % Initialize data label

% Generate data label
for i=1:5
  newlabel=zeros(1000,5);
  newlabel(:,i)=ones(1000,1);
  label=cat(1,label,newlabel);
end

% Shuffle data
r=randperm(size(database,3));
shuffled_data=database(:,:,r);
shuffled_label=label(r,:);
shuffled_label=categorical(shuffled_label);