function [] = CVX_3_18()
% Convex Optimization EE364a - Additional Exercise 3.18:
% Heuristic suboptimal solution for Boolean LP
% Written by Dang Manh Truong (dangmanhtruong@gmail.com)

    rand('state',0);
    n=100;
    m=300;
    A=rand(m,n);
    b=A*ones(n,1)/2;
    c=-rand(n,1);

    cvx_begin % Relaxed Boolean LP 
        variable x(n)
        minimize ((c')*x)
        subject to 
            A*x <= b;
            0 <= x <= 1;
    cvx_end
    L = cvx_optval; % Lower bound of Boolean LP
    
    iterNum = 100; % 100 values of t - 100 iterations
    ObjVal = zeros(iterNum,1);  % Objective value of every iteration   
    
    ti = linspace(0,1,iterNum);
    xBool = zeros(n,1);
    MaxViol = zeros(n,1); % Maximum violation constraint
    for i = 1 : iterNum
        for j = 1 : n
            if x(j) >= ti(i)
                xBool(j) = 1;
            else 
                xBool(j) = 0;
            end
        end      
        ObjVal(i) = (c')*xBool;
        MaxViol(i) = max(A*xBool - b);        
    end
    
    % Plot the results
    plot(ti,ObjVal,'color','r'); hold on;
    plot(ti,MaxViol,'color','b');
%     for i = 1:iterNum
%         if MaxViol(i) < 0
%             i
%         end
%     end
    ti(61) % This is the best t, after observation from the graph
    ObjVal(61) % Corresponding objective value 

end

