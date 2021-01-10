
%Project Submission by: MANISH SONI
function Output_img=apply_harmonic_filter(noise_target, msg1, msg2)

halfwid = 1;

inverse_input_image=1./noise_target;
[nrow,ncol] = size(inverse_input_image);
output_img = zeros(nrow,ncol);
for r=(halfwid+1):(nrow-halfwid)
for c=(halfwid+1):(ncol-halfwid)
out_harmonic_filter = inverse_input_image((r-halfwid):(r+halfwid),(c-halfwid):(c+halfwid));
output_img(r,c) = ((2*halfwid+1)^2)*(1/sum(sum(out_harmonic_filter)));
end;

end;


Output_img=output_img;
figure
subplot(1,2,1)
imagesc(inverse_input_image)
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
