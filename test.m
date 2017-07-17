clc;clear;close all;
%%% Setting Parameters%%%
dim=500 %%%dimention of matrix

 
 sparse=[1 0.5 0.1 0.01] %%%Sparse density of Matrix
 for n=1:4
%%% Creating random target matrix
 A= diag(randi(10,dim,1))
 R = sprandsym(dim,sparse(n))
 A=A+R
 
B=randi(1,dim,1)


%%% Solving by CG
[x{n},norm_r]=CG_LE(A,B,0.1^5)
subplot(2,2,n)
plot(norm_r,'LineWidth',1)


%%% Solving with Matlab
X_direct{n}=inv(A)*B
for k=1:length(x{n})
    norm_def(n,k)=norm(x{n}{k}-X_direct{n})
end
hold on;
plot(norm_def(n,:),'LineWidth',1)
xlabel Steps
ylabel |r|or|x-X|
legend('|r|','|x-X|')
set(gca, 'YScale', 'log')

 end