
%This function returns y coordinate of any point on the slope


function [y]=soilprofile(xs, ys, x)

x1=xs(1); x2=xs(2); x3=xs(3); x4=xs(4);
y1=ys(1); y2=ys(2); y3=ys(3); y4=ys(4);


if x<=x2
    y=((y2-y1)/(x2-x1))*(x-x1)+y1;
elseif x>x2 & x<=x3
    y=((y3-y2)/(x3-x2))*(x-x2)+y2;
else
    y=((y4-y3)/(x4-x3))*(x-x3)+y3;
end
end

