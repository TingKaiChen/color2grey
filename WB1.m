frontList = orderList(1:(ptr-1));
backList = orderList(ptr:(picNum-1));


if (ptr ~= 1) && (~strcmp(cmp, 'right'))
    ptr = ptr-1;
    cmp = 'left';
    figure(1)
    subplot(1, 2, 1)
    imshow(greyList(:, :, orderList(ptr)));
    subplot(1, 2, 2)
    imshow(greyList(:, :, picNum));
else
    figure(1)
    subplot(1, 2, 1)
    imshow(greyList(:, :, picNum));
    if picNum ~= sizeList(3)
        cmp = 'none';
        orderList = [frontList picNum backList];
        picNum = picNum+1;
        subplot(1, 2, 2)
        imshow(greyList(:, :, picNum));
    else
        orderList = [frontList picNum backList];
        msgbox('Thanks for your help!')
    end
end