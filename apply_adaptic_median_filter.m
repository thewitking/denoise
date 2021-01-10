function output_img=apply_adaptic_median_filter(noise_target, msg1, msg2)

%Adaptive median filter
%Project Submission by: MANISH SONI
halfwid = 1;
[row_num,col_num] = size(noise_target);
output_img = zeros(row_num,col_num);
start_ind_x=4; % considering the size of 7 so to accomodate the size 
start_ind_y=4;

for i=start_ind_x:row_num-3 
for j=start_ind_y:(col_num-3)
   
local_region = noise_target((i-halfwid):(i+halfwid),(j-halfwid):(j+halfwid));
Imin= min(local_region,[],'all');
Imax=max(local_region,[],'all');
Imed=median(local_region,'all');
Ixy=local_region(halfwid+1,halfwid+1);


if ((Imin<Imed)&&(Imed<Imax))
    if ((Imin<Ixy)&&(Ixy<Imed))
        output_img(i,j)=Ixy;
    else
         output_img(i,j)=Imed;     
    end
else 
   halfwid=min(halfwid+1,3);
     if halfwid <= 3
     output_img(i,j)=Imed;   
     end 
     
end;

end;
end;


output_img=output_img;
figure
subplot(1,2,1)
imagesc(noise_target)
axis 'image'
axis 'off'
colormap(gray(256))
title(msg1)
subplot(1,2,2)
imagesc(output_img)
axis 'image'
axis 'off'
colormap(gray(256))
title(msg2)

end