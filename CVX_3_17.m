function [] = CVX_3_17()
% Convex Optimization EE364a - Additional Exercise 3.17:
% Minimum fuel optimal control
% Written by Dang Manh Truong (dangmanhtruong@gmail.com)
% Here the problem is reformulated as an LP
A = [-1 0.4 0.8; 1 0 0; 0 1 0];
b = [1; 0; 0.3];
xDes = [7; 2; -6];
N = 30;

H = [];
tmp = b;
n = N - 1;
for i = 0 : n
    H = [tmp H]; % Not a very efficient way to build a matrix
    tmp = A*tmp;
end

cvx_begin
    variable u(N)
    variable y(N)
    variable t(N)
    minimize sum(t)
    subject to
        H*u == xDes
        -y <= u <= y
        t >= y
        t >= 2*y - 1     
cvx_end

%plot(0: n, u)
stairs(0:N-1,u,'linewidth',2)
axis tight
xlabel('t')
ylabel('u(t)')

end

