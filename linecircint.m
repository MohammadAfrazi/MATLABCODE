%Line and circle intersection Function

function [x1,x2] = linecircint(m,n,a,b,r)
c1 = 1+m^2;
c2 = 2*m*(n-b)-2*a;
c3 = a^2-r^2+(n-b)^2;

x1 = (-c2 - sqrt(c2^2-4*c1*c3))/(2*c1);
x2 = (-c2 + sqrt(c2^2-4*c1*c3))/(2*c1);

end