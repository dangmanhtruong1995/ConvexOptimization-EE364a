function [x,u,avg] = CVX_3_4()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A = [1 2 0 1; 0 0 3 1; 0 3 1 1; 2 1 2 5; 1 0 3 2];
cMax = [100; 100; 100; 100; 100];
p = [3; 2; 7; 6];
pDisc = [2; 1; 4; 2];
q = [4; 10; 5; 10];

cvx_begin
    variable x(4)
    variable u(4)
    maximise sum(u)
    subject to
        x >= 0
        A*x <= cMax
        p.*x >= u
        p.*q + pDisc.*(x - q) >= u
cvx_end

avg = u./x; 

end

