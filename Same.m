frontList = orderList(1:ptr);
backList = orderList((ptr+1):(picNum-1));

figure(1)
subplot(1, 2, 1)
imshow(greyList(:, :, picNum));
if picNum ~= sizeList(3);
    orderList = [frontList picNum backList];
    picNum = picNum+1;
    cmp = 'none';
    ptr = ptr+1;
    subplot(1, 2, 2)
    imshow(greyList(:, :, picNum));
else
    orderList = [frontList picNum backList];
    msgbox('Thanks for your help!')
end
