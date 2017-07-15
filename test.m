clc;clear;close all;
%%% Setting Parameters%%%
dim=100 %%%dimention of matrix
%%% Creating random target matrix
A=randi(10,dim)
%%%Hermitian Matrix
A=(A+transpose(A))/2

B=randi(10,dim,1)
%%% Solving by CG
[x,norm_r]=CG_LE(A,B,0.000001)
plot(norm_r,'LineWidth',1)


%%% Solving with Matlab
X_direct=inv(A)*B
for k=1:length(x)
    norm_def(k)=norm(x{k}-X_direct)
end
hold on;
plot(norm_def,'LineWidth',1)
xlabel Steps
ylabel |r|or|x-X|
legend('|r|','|x-X|')
set(gca, 'YScale', 'log')