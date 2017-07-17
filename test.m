clc;clear;close all;
%%% Setting Parameters%%%
dim=500 %%%dimention of matrix

 
 sparse=[1 0.1 0.05 0.01] %%%Sparse density of Matrix
 for n=1:4
%%% Creating random target matrix
 A{n}= diag(randi(10,dim,1))
 R = sprandsym(dim,sparse(n))
 A{n}=A{n}+R
 
B=randi(1,dim,1)


%%% Solving by CG
[x{n},norm_r]=CG_LE(A{n},B,0.1^5)
subplot(2,2,n)
plot(norm_r,'LineWidth',1)


%%% Solving with Matlab
X_direct{n}=inv(A{n})*B
for k=1:length(x{n})
    norm_def(n,k)=norm(x{n}{k}-X_direct{n})
end
hold on;
plot(norm_def(n,:),'LineWidth',1)
xlabel Steps
ylabel |r|or|x-X|
legend('|r|','|x-X|')
set(gca, 'YScale', 'log')
text(10,10^-5,'MD=')
 end
 figure;
 for n=1:4
     subplot(2,2,n)
     spy(A{n})
 end
 