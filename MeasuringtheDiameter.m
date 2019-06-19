%% Importing the Image

clear;
clc;

obj= imread('Test2.jpg');
imshow(obj)

%% Segmenting Image

%Dividing the Image Test2.jpg into its different RGB intensities
red = obj(:,:,1);
green = obj(:,:,2);
blue = obj(:,:,3);

figure(1)
subplot(2,2,1); imshow(obj); title('Original Image');
subplot(2,2,2); imshow(red); title('Red Plane');
subplot(2,2,3); imshow(green); title('Green Plane');
subplot(2,2,4); imshow(blue); title('Blue Plane');

%Threshold blue plane
figure(2)
level = 0.37;
bw2 = imbinarize(blue,level);
subplot(2,2,1); imshow(bw2);title('Blue plane threholded');

%% Removing noise

%Fill all holes
fill = imfill(bw2,'holes');
subplot(2,2,2); imshow(fill); title('Holes filled');
 
%Remove blobs on the border of the image
clear = imclearborder(fill);
subplot(2,2,3); imshow(clear); title('Remove Blob on border');

%Remove blobs that are smaller than 7 pixels across
se = strel('disk', 7);
open = imopen(fill,se);
subplot(2,2,4); imshow(open); title('Remove small blobs');

%% Measure Diameter of the Object

diameter = regionprops(open,'MajorAxisLength')

%Show result
figure(3)
imshow(obj)
d = imdistline; %Physically measuring the object






