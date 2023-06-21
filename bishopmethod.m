function [fs] = bishopmethod(c, phi, b, w, alpha,uerror)
%bishop method of slices

phi=phi*pi/180;

fs=1;  %assumption and is not important
err=1;

k=0;

while err>uerror & k<100000   %user error
    k=k+1;
    fso=fs; %factor of safety old
    m=cos(alpha)+sin(alpha)*tan(phi)/fs;

    fs=(c*sum(b./m)+tan(phi)*sum(w./m))/(sum(w.*sin(alpha)));
    err=abs(fs-fso);
end

end