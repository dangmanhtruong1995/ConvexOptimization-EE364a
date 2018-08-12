function [] = CVX_3_9()
% Convex Optimization EE364a - Additional Exercise 3.19:
% Complex least-norm problem
% Written by Dang Manh Truong (dangmanhtruong@gmail.com)
% I actually had to look at the solution for this exercise 

% Generates the input data   
    
    j = sqrt(-1);
    m = 30; n = 100;
    Are = rand(m,n); Aim = randn(m,n);
    A = Are + j*Aim;
    bre = rand(m,1); bim = rand(m,1);
    b = bre + j*bim;
    % Solves the 2nd-norm problem 
    ACplex = [Are -Aim; Aim Are];
    bCplex = [bre; bim];
    cvx_begin
        variable z(2*n)
        minimize norm(z,2)
        subject to
            ACplex * z == bCplex;
    cvx_end    
    
    zRe = z(1:n);
    zIm = z(n+1: 2*n);
    scatter(zRe,zIm,'MarkerEdgeColor','blue');
    hold on
    
    % Solves the infinity-norm problem
    cvx_begin
        variable x(n) complex
        minimize norm(x,inf)
        subject to
            A*x == b;
    cvx_end
    xRe = real(x); xIm = imag(x);
    scatter(xRe,xIm,'Filled');
    
end

