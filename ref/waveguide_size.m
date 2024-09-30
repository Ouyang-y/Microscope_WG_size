clear;
clc;
img=imread('250mw-3次-0004-2.tif');
M1=im2double(img);
[X, Y]=size(M1);



for i=1:1:X
    for j=1:1:Y
       if M1(i,j)<=0.62
           M1(i,j)=0.62;
       end
    end        
end





figure
imagesc(M1)
axis equal


%% 曲线平滑


line=X/2;

k=1;
  length=1;
while k<Y
    while (k + length) <= Y && M1(line,k+length)>0.62
    length=length+1;

    end
    if (length<=30)
        for w=k:1:k+length
            M1(line,w)=0.62;
        end
    end 
    k=k+length;
    length=1;


end

x=1:1:Y;
y=M1(line,:);
figure
axis equal
plot(x,y)


left=1;
right=1;
for i=1:1:Y-1

if     M1(line,i)==0.62 && M1(line,i+1)>0.62
Pixel(left,1)=i;
left=left+1;
elseif M1(line,i)>0.62 && M1(line,i+1)==0.62
Pixel(right,2)=i;
right=right+1;
end

end

[X,Y]=size(Pixel);

for i=1:1:X

    width(i)=50/695*(Pixel(i,2)-Pixel(i,1));

end


% 
% 
% 
% 
% 
%  y=M1(X/2,:);
% figure
% plot(Y,y)
% 
% % surf(X,Y,M1);
% hold on
% figure
% imagesc(M1)