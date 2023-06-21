
% Draw Circle 


function [yc]=crc(alpha, beta, radius, x)
    yc=beta-sqrt(radius^2-(x-alpha).^2);
    end
