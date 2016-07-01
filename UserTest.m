window = figure('Name', 'User Test', 'NumberTitle', 'off', 'Position', [600, 180, 800, 400]);
w_width = window.Position(3);
w_height = window.Position(4);
cmp = 'none';
wb1_Btn = uicontrol('position', [(w_width*0.25-40), 20, 80, 30]);
set(wb1_Btn, 'String', 'WB1');
set(wb1_Btn, 'Callback', 'WB1');
same_Btn = uicontrol('position', [(w_width*0.5-40), 20, 80, 30]);
set(same_Btn, 'String', 'Same');
set(same_Btn, 'Callback', 'Same');
wb2_Btn = uicontrol('position', [(w_width*0.75-40), 20, 80, 30]);
set(wb2_Btn, 'String', 'WB2');
set(wb2_Btn, 'Callback', 'WB2');

colorPic = double(imread('lenna.bmp'));
figure('Name', 'Color', 'NumberTitle', 'off', 'Position', [0, 120, 550, 550])
imshow(colorPic/max(max(max(colorPic))));
greyList = color2grey(colorPic);
sizeList = size(greyList);

figure(1)
subplot(1, 2, 1)
imshow(greyList(:, :, 1));
subplot(1, 2, 2)
imshow(greyList(:, :, 2));

orderList = [1];
picNum = 2;
ptr = 1;