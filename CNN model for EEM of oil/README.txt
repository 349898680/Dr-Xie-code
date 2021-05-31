# Identifying oil spill types based on deep convolutional neural network and excitation-emission matrix
 
This demo includes EEM data and codes in both python and Matlab language for the paper "Oil types identification based on excitation-emission matrix of laser induced fluorescence and deep convolutional neural network"
by Ying Li, Yunpeng Jia, Xiaohua Cai, Ming Xie*, Zhanjun Ma.

*Corresponding author: mingxie@dlmu.edu.cn.

Warning: the codes were tested using Tensorflow 2.0, Python 3.7, and MATLAB R2019a,respectively. They might be incompatible with other versions.  

The data is included in the "dataset.mat" file, of which the first two dimension indicates the EEM, and the third dimension indicates number of data.
The demo data includes the spectrum of five types of oil (1000 samples each) obtained under three types of thickness (1 ml, 2 ml, 4 ml).

Note: This oil type identification algorithm is presented in two types of language：Python 3.7 with Tensorflow 2.0, and Matlab.

To use the Matlab codes:
    - Run the data preprocessing algorithm first and generate training and testing data,
 To use the Python codes:
    - Run the Matlab data preprocessing algorithm first and generate training and testing data.
    - Use Jupyter Notebook to run the identification model.