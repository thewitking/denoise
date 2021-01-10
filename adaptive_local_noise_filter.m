function output_img=adaptive_local_noise_filter(noise_target,noise,msg1,msg2)

% Adaptive local noise reduction filter

Img_noise_variance=  mean2(noise.^2)-(mean2(noise)^2);

halfwid = 1;
[row_num,col_num] = size(noise_target);
Output_img = zeros(row_num,col_num);
for i=(halfwid+1):(row_num-halfwid)
for j=(halfwid+1):(col_num-halfwid)
local_noise_region = noise((i-halfwid):(i+halfwid),(j-halfwid):(j+halfwid));
local_mean=mean2(noise_target((i-halfwid):(i+halfwid),(j-halfwid):(j+halfwid)));

local_variance=mean2(local_noise_region.^2)-(mean2(local_noise_region)).^2;

ratio= min(1,Img_noise_variance/local_variance);
Output_img(i,j) = noise_target(i,j)-((ratio)*(noise_target(i,j)-local_mean));
end;

end;


output_img=Output_img;

figure
subplot(2,1,1)
imagesc(noise_target)
axis 'image'
axis 'off'
colormap(gray(256))
title(msg1)
subplot(2,1,2)
imagesc(Output_img)
axis 'image'
axis 'off'
colormap(gray(256))
title(msg2)

end