%slicepropertiy Function

function [weight, bn, ln, an, andeg]=slicepropertiy(xs,ys,alpha,beta,radius,...
    ns,xintl, xintr,gamma)

bn=(xintr-xintl)/ns;



for i=1:ns
xls=xintl+(i-1)*bn;
xrs=xls+bn;
weight(i)=gamma*quad(@(x) soilprofile(xs,ys,x)-crc(alpha,beta,radius,x), ...
    xls, xrs);
ylc=crc(alpha,beta,radius,xls);
yrc=crc(alpha,beta,radius,xrs);
an(i)=atan((yrc-ylc)/bn);
end
ln=bn./cos(an);
andeg=an*(180/3.1415);
end



