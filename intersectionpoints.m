%Find the intersections

function[xintl, xintr] = intersectionpoints(xs,ys,a,b,r)
x1 = xs(1);
x2 = xs(2);
x3 = xs(3);
x4 = xs(4);

y1 = ys(1);
y2 = ys(2);
y3 = ys(3);
y4 = ys(4);

plot(xs,ys,'-rs')

% Line 1: y = m1 x +n1
m1 = (y2 - y1)/(x2 - x1);
n1 = y1 - m1*x1;

% Line 2: y = m2 x +n2
m2 = (y3 - y2)/(x3 - x2);
n2 = y2 - m2*x2;

% Line 3: y = m2 x +n2
m3 = (y4 - y3)/(x4 - x3);
n3 = y3 - m3*x3;

% intersection between the trial surface and the slope - L1
[xl1r1, xl1r2] = linecircint(m1,n1,a,b,r);


% intersection between the trial surface and the slope - L2
[xl2r1, xl2r2] = linecircint(m2,n2,a,b,r);


% intersection between the trial surface and the slope - L3
[xl3r1, xl3r2] = linecircint(m3,n3,a,b,r);

% s1: circle crosses line 1
if xl1r1 >= x1 & xl1r2 <= x2 & ~isreal(xl2r1) & ~isreal(xl2r2) &...
        ~isreal(xl3r1) & ~isreal(xl3r2)
    xintl = xl1r1;
    xintr = xl1r2;
%     yintl = m1*(xl1r1)+n1;
%     yintr = m1*(xl1r2)+n1;

 % S1: circle crosses line 1 but big
elseif xl1r1 >= x1 & xl1r2 <= x2 & isreal(xl2r1) & isreal(xl2r2) &...
        ~isreal(xl3r1) & ~isreal(xl3r2)
    xintl = xl1r1;
    xintr = xl1r2;
%     yintl = m1*(xl1r1)+n1;
%     yintr = m1*(xl1r2)+n1;
    
 % S1: circle crosses line 1 but bigger
elseif xl1r1 >= x1 & xl1r2 <= x2 & isreal(xl2r1) & isreal(xl2r2) &...
        isreal(xl3r1) & isreal(xl3r2)
    xintl = xl1r1;
    xintr = xl1r2;
%     yintl = m1*(xl1r1)+n1;
%     yintr = m1*(xl1r2)+n1;

    % S2: circle crosses line 2
elseif xl2r1 >= x2 & xl2r2 <= x3 & ~isreal(xl1r1) & ~isreal(xl1r2)...
        & ~isreal(xl3r1) & ~isreal(xl3r2)
    xintl = xl2r1;
    xintr = xl2r2;
%     yintl = m2*(xl2r1)+n2;
%     yintr = m2*(xl2r2)+n2;
    
    %S2: circle crosses line 2 - 3
elseif xl2r1 >= x2 & xl2r2 <= x3 & ~isreal(xl1r1) & ~isreal(xl1r2)...
        & isreal(xl3r1) & isreal(xl3r2)
    xintl = xl2r1;
    xintr = xl2r2;
%     yintl = m2*(xl2r1)+n2;
%     yintr = m2*(xl2r2)+n2;

    %S2: circle crosses line 2 - 1 - 3
elseif xl2r1 >= x2 & xl2r2 <= x3 & isreal(xl1r1) & isreal(xl1r2)...
        & isreal(xl3r1) & isreal(xl3r2)
    xintl = xl2r1;
    xintr = xl2r2;
%     yintl = m2*(xl2r1)+n2;
%     yintr = m2*(xl2r2)+n2;

    % s3: circle crosses line 3
elseif xl3r1 >= x3 & xl3r2 <= x4 & ~isreal(xl1r1) & ~isreal(xl1r2)...
        & ~isreal(xl2r1) & ~isreal(xl2r2)
    xintl = xl3r1;
    xintr = xl3r2;
%     yintl = m3*(xl3r1)+n3;
%     yintr = m3*(xl3r2)+n3;

    % s3: circle crosses line 3 - 2
elseif xl3r1 >= x3 & xl3r2 <= x4 & ~isreal(xl1r1) & ~isreal(xl1r2)...
        & isreal(xl2r1) & isreal(xl2r2)
    xintl = xl3r1;
    xintr = xl3r2;
%     yintl = m3*(xl3r1)+n3;
%     yintr = m3*(xl3r2)+n3;


    % s3: circle crosses line 3 - 2 - 1
elseif xl3r1 >= x3 & xl3r2 <= x4 & isreal(xl1r1) & isreal(xl1r2)...
        & isreal(xl2r1) & isreal(xl2r2)
    xintl = xl3r1;
    xintr = xl3r2;
%     yintl = m3*(xl3r1)+n3;
%     yintr = m3*(xl3r2)+n3;


    %S4: circle crosses line 1 and 2
elseif xl1r1 >= x1 & xl1r2 > x2 & ~isreal(xl3r1) & ~isreal(xl3r2)...
        & xl2r2 > x2 & isreal(xl1r2) & isreal(xl2r1)
    xintl = xl1r1;
    xintr = xl2r2;
%     yintl = m1*(xl1r1)+n1;
%    yintr = m2*(xl2r2)+n2;


    %S4: circle crosses line 1 and 2 - 3
elseif xl1r1 >= x1 & xl1r2 > x2 & isreal(xl3r1) & isreal(xl3r2)...
        & xl2r2 > x2 & isreal(xl1r2) & isreal(xl2r1)
    xintl = xl1r1;
    xintr = xl2r2;
%     yintl = m1*(xl1r1)+n1;
%     yintr = m2*(xl2r2)+n2;


    % S5: circle crosses line 2 and 3
elseif ~isreal(xl1r1) & ~isreal(xl1r2) & xl2r1 >= x2 & xl2r2 > x3 &...
       xl3r2 > x3 & isreal(xl2r2) & isreal(xl3r1)
    xintl = xl2r1;
    xintr = xl3r2;
%     yintl = m2*(xl2r1)+n2;
%     yintr = m3*(xl3r2)+n3;


    % S5: circle crosses line 2 and 3 - 1
    
   elseif isreal(xl1r1) & isreal(xl1r2) & xl2r1 >= x2 & xl2r2 > x3 &...
       xl3r2 > x3 & isreal(xl2r2) & isreal(xl3r1)
    xintl = xl2r1;
    xintr = xl3r2;
%     yintl = m2*(xl2r1)+n2;
%     yintr = m3*(xl3r2)+n3;


    %S6: circle crooses line 1 and 3
elseif xl1r1 >= x1 & xl3r2 >= x3 & isreal(xl1r2)& isreal(xl2r1) & ...
        isreal(xl2r2) & isreal(xl3r1)
    xintl = xl1r1;
    xintr = xl3r2;
%     yintl = m1*(xl1r1)+n1;
%     yintr = m3*(xl3r2)+n3;


    % S7: When the circle and the slope face are disjoint 
else ~isreal(xl1r1) & ~isreal(xl1r2) & ~isreal(xl2r1) & ...
       ~isreal(xl2r2) & ~isreal(xl3r1) & ~isreal(xl3r2)
    xintl = NaN;
    xintr = NaN;
   
end

% 
% hold on
% grid on 
% viscircles([a,b],r,'EdgeColor','b')
% 
% mapshow(xintl,yintl,'DisplayType','point','Marker','*')
% mapshow(xintr,yintr,'DisplayType','point','Marker','*')
% 
% axis equal
end
    
    
    
    
    
    
    
    
    