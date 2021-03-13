function [a] = fun(x,x1)
xBetween = Approx(x,x1);
% Calculate the y value for the in between point
yBetween = drag(xBetween);
% If the Y value is very close to zero, return
error = 0.0000001; % this is small we want the y difference to be
% ^^^^ You may change it to what ever number to get as precise as 
% you want.
if abs(yBetween) < error
    % Display Values
     disp(sprintf('X Value: %d  Y Value: %d',xBetween,yBetween));
     return;
end
% If not, then try again recursively.
if yBetween > 0
    fun(xBetween, x1);
else
    fun(x,xBetween);
end

end


function [c] = Approx(x,x1)
% Define constants g,m,t,Vt - velocity
g = 9.81;
m = 65;
t = 4.5;
Vt = 35;
% Get our y values for the function
y = drag(x);
y1 = drag(x1);
% Calculate our slope
m = ((y1-y)/(x1-x));
% Calculate Y intercept
b = y-m*x;
% Calculate X intercept
xInt = -b/m;
% Return X int
c = xInt;
end

function [d] = drag(x)
% xBetween = xInt
g = 9.81;
m = 65;
t = 4.5;
Vt = 35;
% Calculate the drag function given an drag constant
d = sqrt(g*m/x)*tanh(sqrt(g*x/m)*t)-Vt;
end

