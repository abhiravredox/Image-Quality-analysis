clear
clc
close all
tic
% im = i
%mread('/home/sajal/Honours_project_1/sff_train/train_set/1.jpg');
im = imread('abc.jpg');
figure,imshow(im),title('original')
im = rgb2gray(im);

im1 = im2bw(im);

label = bwlabel(im1);
pagelabel = mode(label(:));
rowlabel = mode(label,2);
r = find(rowlabel==pagelabel);
imf = im(r(1):r(end),:);
scale = size(imf,1)/1024;
imf = imresize(imf,[1024,size(imf,2)/scale]);
% imshow(imf)
% 
 im = double(im);
 %figure,imshow(im,[])
sigma = 1;
neighborsize = ceil(2.5*sigma);
THRESH = 10;

% %%%%%%%%%%%%%%%%-------gra1-------------%%%%%%%%%%%%%%%%%%
% h = fspecial('gaussian',neighborsize,sigma);
% [dx dy] = gradient(h);
% 
% gra1x = imfilter(im,dx);
% gra1y = imfilter(im,dy);
% gra1sum = gra1x.^2+gra1y.^2;
% impartsgra1 = im2col(gra1sum,[neighborsize neighborsize],'sliding');
% gra1score = sum(impartsgra1);
% gra1 = mean(gra1score);
% gra1im = reshape(gra1score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(gra1im,[]),title('gra1')
% %%%%%%%%%%%%%%-------gra1end------------%%%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%%%%%------gra2----------------%%%%%%%%%%%%%%%%%
% [imgradientx imgradienty] = gradient(double(im));
% imgradientxsquare = imgradientx.^2;
% imgradientysquare = imgradienty.^2;
% gra2sum = imgradientxsquare+imgradientysquare;
% impartsgra2 = im2col(gra2sum,[neighborsize neighborsize],'sliding');
% gra2score = sum(impartsgra2);
% gra2 = mean(gra2score);
% gra2im = reshape(gra2score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(gra2im,[]),title('gra2')
% %%%%%%%%%%%%------gra2end--------------%%%%%%%%%%%%%%%%%
% 
%%%%%%%%%%%%------gra3------------%%%%%%%%%%%%%%%%%%%%%
% imgradientx = gradient(double(im));
% impartsgra3 = im2col(imgradientx,[neighborsize neighborsize],'sliding');
% imneglect = find(impartsgra3 < THRESH);
% impartsgra3(imneglect) = 0;
% gra3newsum = sum(impartsgra3);
% gra3im = reshape(gra3newsum,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(gra3im)
% imbuff = find(abs(imgradientx) > THRESH);
% gra3sum = sum(abs(imgradientx(imbuff)));
% gra3 = gra3sum/numel(imbuff);
%%%%%%%%%%%------gra3end--------%%%%%%%%%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%-----gra4--------------%%%%%%%%%%%%%
% imgradientxsquare = imgradientx.^2;
% relhorizontalsquare = find(abs(imgradientxsquare) > THRESH);
% gra4score = sum(abs(imgradientxsquare(relhorizontalsquare)));
% gra4 = gra4score/numel(relhorizontalsquare);
% %%%%%%%%%-------gra4end----------%%%%%%%%%%%%%
% 
% %%%%%%%%%%------gra5-------------%%%%%%%%%%%%
% %%%%%%%%%%------gra5end----------%%%%%%%%%%%%
% 
% %%%%%%%%------GRAE------------%%%%%%%%%%%%%%%%
% relfullimage = find(abs(imgradientxsquare)+abs(imgradientysquare) > THRESH);
% graescore = numel(relfullimage);
% grae = graescore/numel(im);
% %%%%%%%------GRAEend-----------%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%---gra6-------------%%%%%%%%%%%%%%%%
% hx = [1 2 1;0 0 0;-1 -2 -1];
% hy = [-1 0 1;-2 0 2;-1 0 1];
% gra6x = imfilter(im,hx);
% gra6y = imfilter(im,hy);
% gra6sum = gra6x.^2+gra6y.^2;
% impartsgra6 = im2col(gra6sum,[neighborsize neighborsize],'sliding');
% gra6score = sum(impartsgra6);
% gra6 = mean(gra6score);
% gra6im = reshape(gra6score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(gra6im,[]),title('gra6')
% %%%%%%%%%%%%------gra6end-------%%%%%%%%%%%%%
% 
% %%%%%%%%%%%%------gra7-----------%%%%%%%%%%%%
% hx = [1 2 1;0 0 0;-1 -2 -1];
% hy = [-1 0 1;-2 0 2;-1 0 1];
% gra7x = imfilter(im,hx);
% gra7y = imfilter(im,hy);
% gra7sum = sqrt(gra7x.^2+gra7y.^2);
% impartsgra7 = im2col(gra7sum,[neighborsize neighborsize],'sliding');
% meanval = mean(impartsgra7);
% meanval = repmat(meanval,size(impartsgra7,1),1);
% impartsgra7 = (impartsgra7 - meanval).^2;
% gra7score = sum(impartsgra7);
% gra7 = mean(gra7score);
% gra7im = reshape(gra7score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(gra7im,[]),title('gra7')
% %%%%%%%%%------gra7end---------%%%%%%%%%%%%
% 
% %%%%%%%------lap1--------------%%%%%%%%%%%%
% h = fspecial('laplacian');
% imf = imfilter(im,h);
% impartslap1 = im2col(imf,[neighborsize neighborsize],'sliding');
% impartslap1 = impartslap1.^2;
% lap1score = sum(impartslap1);
% lap1 = mean(lap1score);
% lap1im = reshape(lap1score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(lap1im,[]),title('lap1')
% %%%%%%%%-------lap1end----------%%%%%%%%%%%
% 
% %%%%%%%%%-------lap2------------%%%%%%%%%%%
% lx = [-1 2 -1];
% ly = lx';
% impartslap2 = abs(imfilter(im,lx)) + abs(imfilter(im,ly));
% impartslap2 = im2col(impartslap2,[neighborsize neighborsize],'sliding');
% lap2score = sum(impartslap2);
% lap2 = mean(lap2score);
% lap2im = reshape(lap2score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(lap2im,[]),title('lap2')
% %%%%%%%%--------lap2end---------%%%%%%%%%%%
% 
% %%%%%%%%-------lap3--------------%%%%%%%%%%
% lx = [-1 2 -1];
% ly = lx';
% lx1 = (1/sqrt(2))*[0 0 1;0 -2 0;1 0 0];
% lx2 = (1/sqrt(2))*[1 0 0;0 -2 0;0 0 1];
% impartslap3 = abs(imfilter(im,lx)) + abs(imfilter(im,ly))+abs(imfilter(im,lx1))+abs(imfilter(im,lx2));
% impartslap3 = im2col(impartslap3,[neighborsize neighborsize],'sliding');
% lap3score = sum(impartslap3);
% lap3 = mean(lap3score);
% lap3im = reshape(lap3score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(lap3im,[]),title('lap3')
% %%%%%%%%%%--------lap3end--------%%%%%%%%%
% 
% %%%%%%%%%---------lap4------------%%%%%%%%
% h = fspecial('laplacian');
% imf = imfilter(im,h);
% impartslap4 = im2col(imf,[neighborsize neighborsize],'sliding');
% meanval = mean(double(impartslap4));
% meanval = repmat(meanval,size(impartslap4,1),1);
% impartslap4 = (double(impartslap4) - meanval).^2;
% lap4score = sum(impartslap4);
% lap4 = mean(lap4score);
% lap4im = reshape(lap4score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(lap4im,[]),title('lap4')
% %%%%%%%%%-------lap4end----------%%%%%%%%%
% 
% %%%%%%%%%-------lap5-------------%%%%%%%%%
% %%%%%%%%%-------lap5end----------%%%%%%%%%
% 
% %%%%%%%%-------sta3-------------%%%%%%%%%%
% imbuff = double(im2col(im,[neighborsize neighborsize],'sliding'));
% mu = mean(imbuff);
% mu = repmat(mu,[size(imbuff,1),1]);
% phi = (imbuff-mu).^2;
% sta3score = sum(phi);
% sta3 = mean(sta3score);
% sta3im = reshape(sta3score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(sta3im,[]),title('sta3')
% %%%%%%%%--------sta3_end--------%%%%%%%%%%
% 
% %%%%%%%---------sta4-----------%%%%%%%%%%%
% imbuff = double(im2col(im,[neighborsize neighborsize],'sliding'));
% mu = mean(imbuff);
% mu = repmat(mu,[size(imbuff,1),1]);
% phi = (imbuff-mu).^2;
% var = sum(phi);
% var = reshape(var,[size(im,1)-neighborsize+1 size(im,2)-neighborsize+1]);
% imbuff = double(im2col(var,[neighborsize neighborsize],'sliding'));
% mu = mean(imbuff);
% mu = repmat(mu,[size(imbuff,1),1]);
% phi = (imbuff-mu).^2;
% sta4score = sum(phi);
% sta4 = mean(sta4score);
% sta4im = reshape(sta4score,size(im,1)-neighborsize-1,size(im,2)-neighborsize-1);
% figure,imshow(sta4im,[]),title('sta4')
% %%%%%%%%%%%%-------sta4_end-------%%%%%%%%%
% 
% %%%%%%%-----------sta5------------%%%%%%%%%
% % imbuff = double(im2col(im,[neighborsize neighborsize],'sliding'));
% % mu = mean(imbuff);
% % z = find(mu ~= 0);
% % mu = repmat(mu,[size(imbuff,1),1]);
% % phi = ((imbuff-mu).^2)./mu;
% % phi1 = phi(:,z);
% % sta5score = sum(phi1);
% % sta5 = mean(sta5score);
% %%%%%%%%---------sta_5_end--------%%%%%%%%
% 
% %%%%%%%--------sta6---------------%%%%%%%%
% h = ones(neighborsize)./(neighborsize^2);
% imfilt = imfilter(im,h);
% imbuff = (im-imfilt).^2;
% imbuff = im2col(imbuff,[neighborsize neighborsize],'sliding');
% sta6score = sum(imbuff);
% sta6 = mean(sta6score)
% sta6im = reshape(sta6score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(sta6im,[]),title('sta6')
%%%%%%%%%----sta_6_end-----------%%%%%%%%%


% %%%%%%%%%-------sta8--------------%%%%%%%%
% sta8image = zeros(size(im));
% impartssta8 = im2col(im,[neighborsize neighborsize],'sliding');
% sta8score = max(impartssta8)-min(impartssta8);
% sta8 = mean(sta8score);
% sta8im = reshape(sta8score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% sta8im1 = imresize(sta8im,size(imf));
% figure,imshow(sta8im,[]),title('sta8')
% %%%%%%%%%-------sta_8_end----------%%%%%%%

% %%%%%%%%---------mis2----------%%%%%%%%%%
% h = [0 0 1 0 -1];
% mis2image = imfilter(im,h);
% imbuff = im2col(mis2image,[neighborsize neighborsize],'sliding');
% imbuff = (abs(imbuff)).^2;
% mis2score = sum(imbuff);
% mis2 = mean(mis2score);
% mis2im = reshape(mis2score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(mis2im,[]),title('mis2')
% %%%%%%%%%----mis_2_end--------%%%%%%%%%%%%
% 
% %%%%%%%%-------mis8-----------%%%%%%%%%%%
% [imgradientx imgradienty] = gradient(double(im));
% im_mis8_x = im2col(imgradientx,[neighborsize neighborsize],'sliding');
% im_mis8_y = im2col(imgradienty,[neighborsize neighborsize],'sliding');
% mis8score = sqrt(sum(im_mis8_x.^2)+sum(im_mis8_y.^2));
% mis8 = mean(mis8score);
% mis8im = reshape(mis8score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(mis8im,[]),title('mis8')
% %%%%%%%%------mis_8_end----------%%%%%%%%%
% 
% %%%%%%%%--------mis5-------------%%%%%%%%%
% imbuff = im2col(im,[neighborsize neighborsize],'sliding');
% buff_mean = mean(imbuff);
% intensity_val = imbuff((ceil((neighborsize^2)/2)),:);
% mis5score = intensity_val./buff_mean;
% crude_val = find(mis5score < 1);
% mis5score(crude_val) = (mis5score(crude_val).^(-1));
% mis5 = mean(mis5score);
% mis5im = reshape(mis5score,size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
% figure,imshow(mis5im,[]),title('mis5')
% %%%%%%%-----mis_5_end-----%%%%%%%%%%%%%%%
% 
% %%%%%%%%%--------mis9----------%%%%%%%%%%
imdiff = (-1).*diff(im);
padar = zeros(1,size(im,2));
imdiff = [imdiff;padar];
imbuff = double(im).*imdiff;
imbuff = im2col(imbuff,[neighborsize neighborsize],'sliding');
mis9score = sum(imbuff);
mis9 = mean(mis9score);
mis9im = reshape(abs(mis9score),size(im,1)-neighborsize+1,size(im,2)-neighborsize+1);
figure,imshow(mis9im,[]),title('mis9')
% %%%%%%%------mis_9_end-------%%%%%%%%%%%
% 
% %%%%%%%%%------mis4----------%%%%%%%%%%
% 
% 
% 
%  results = [gra1;gra2;gra3;gra4;gra6;gra7;lap1;lap2;lap3;lap4;sta3;sta4;sta6;sta8;mis2;mis8;mis5;mis9];
% % normresult = abs((results-mean(results))/std(results))