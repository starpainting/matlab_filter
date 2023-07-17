function [ filter_matrix ] = S_G_filter_matrix(x,k)
%S-G 平滑一般方法-n点k-1次平滑 
%Input: -n，滤波带宽，即原始数据点个数，一般要求为奇数
%       -k，拟合多项式最高次幂+1
%Output:-S-G滤波系数矩阵
n=size(x,1);
m=(n-1)/2;
X=zeros(n,k);
for i=0:(n-1)
    for j=0:(k-1)
        X(i+1,j+1)=(i-m).^j;
    end
end
filter_matrix=X/(X.'*X)*X.';     % 用A\b代替inv(A)*b,用b/A代替b*inv(A)
end
