frontList = orderList(1:ptr);
backList = orderList((ptr+1):(picNum-1));
% orderList = [frontList picNum backList];

if (ptr ~= (picNum-1)) && ~strcmp(cmp, 'left')
    ptr = ptr+1;
    cmp = 'right';
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
        ptr = ptr+1;
        subplot(1, 2, 2)
        imshow(greyList(:, :, picNum));
    else
        orderList = [frontList picNum backList];
        msgbox('Thanks for your help!')
    end
end