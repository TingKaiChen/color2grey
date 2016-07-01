function A = PrintFig(greyPic, windowName, filter)
    visible = 'on'; % on or off

    figure('Visible', visible)
    set(gcf, 'NumberTitle', 'off')
    set(gcf, 'name', windowName)
    subplot(1, 3, 2)
    imshow(greyPic/max(max(max(greyPic))))
    subplot(1, 3, 3)
    imshow(edge(greyPic, filter))
    
    color = double(imread('lenna.bmp'));
    subplot(1, 3, 1)
    imshow(color/max(max(max(color))));
end