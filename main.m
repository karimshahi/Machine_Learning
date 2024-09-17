clc;
clear;

imgName='liftingbody.png';

[img1,img2]=SubSampleing(imgName,2);
[~,img3]=SubSampleing(imgName,3);
[~,img4]=SubSampleing(imgName,5);
[~,img5]=SubSampleing(imgName,8);
[~,img6]=SubSampleing(imgName,13);

figure(1);

subplot(2,3,1);imshow(img1);colormap gray;
title('Original','fontsize',14)

subplot(2,3,2);imshow(img2);colormap gray;
title('Factor=2','fontsize',14)

subplot(2,3,3);imshow(img3);colormap gray;
title('Factor=4','fontsize',14)

subplot(2,3,4);imshow(img4);colormap gray;
title('Factor=6','fontsize',14)

subplot(2,3,5);imshow(img5);colormap gray;
title('Factor=8','fontsize',14)
   
subplot(2,3,6);imshow(img6);colormap gray;
title('Factor=10','fontsize',14)

