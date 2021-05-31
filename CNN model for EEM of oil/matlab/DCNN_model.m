% Implements the framework presented in
% "Oil types identification based on excitation-emission matrix of laser induced fluorescence and deep convolutional neural network" 
% By Ying Li, Yunpeng Jia, Xiaohua Cai, Ming Xie*, Zhanjun Ma.

%% Data preprocessing on the database
%% Please consult the corresponding author (mingxie@dlmu.edu.cn) for the full collection of data.
% The demo data includes the spectrum of four types of oil obtained under three types of thickness and two types of wind condition.


clc; clear; close all;

database=[]; % Initialize database
label=[]; % Initialize data label

% Generate DCNN layers
layers = [imageInputLayer([351 28 1]);
          convolution2dLayer(3,20);
          reluLayer();
          maxPooling2dLayer(2,'Stride',2);
          convolution2dLayer(3,20);
          reluLayer();
          maxPooling2dLayer(2,'Stride',2);
          fullyConnectedLayer(512);
          softmaxLayer();
          classificationLayer()];

% Setup hyperparameters
maxEpochs = 1000; %maximum number of epochs
miniBatchSize = 27; % batch size
 
% Setup training option
options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',1, ...
    'Verbose',false, ...
    'Plots','training-progress');

% train network
net=trainNetwork(train_data,train_label,layers, options);

% model prediction
ypred = classify(net,testdata, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest');

% generate confusion matrix
ypred_num=double(ypred);
Confmat_svm = confusionmat(test_label,ypred_num);

%results visualization
figure,
heatmap(Confmat_svm);
title('Confusion Matrix: Deep Neural Network')
