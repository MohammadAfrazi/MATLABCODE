function [fs] = ordinarymethod(c, phi, dl, w, alpha)
%ordinary method of slices
%ME540-Fall200
%User enters angles in degrees
%November 1

phi=phi*pi/180;
% alpha=alpha*pi/180;

fs=(c*sum(dl)+tan(phi)*sum(w.*cos(alpha)))/sum(w.*sin(alpha));

end