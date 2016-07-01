function greyPic = color2grey(colorPic)
    sizePic = size(colorPic);
    edgeFilter = 'Sobel';
    filterNum = 0;
    R_pic = colorPic(:, :, 1);
    G_pic = colorPic(:, :, 2);
    B_pic = colorPic(:, :, 3);
    
    %% luminance
    greyPic1 = (R_pic+G_pic+B_pic)/3;
    PrintFig(greyPic1, 'Average', edgeFilter);
    greyPic = R_pic*0.299+G_pic*0.587+B_pic*0.114;
    PrintFig(greyPic, 'luminance', edgeFilter);
    lum = greyPic/(max(max(max(greyPic))));
    filterNum = filterNum+1;

%     figure
%     A = edge(greyPic, edgeFilter)-edge(greyPic1, edgeFilter);
%     imshow(A/max(max(A)));
    
    %% desaturation
    for i = 1:sizePic(1)
        for j = 1:sizePic(2)
            greyPic(i, j) = (max(colorPic(i, j, :))+min(colorPic(i, j, :)))/2;
        end
    end
    PrintFig(greyPic, 'desaturation_simple', edgeFilter);
    desat_s = greyPic/(max(max(max(greyPic))));
    filterNum = filterNum+1;
    
    greyPic = rgb2hsv(colorPic);
    greyPic(:, :, 2) = zeros(sizePic(1), sizePic(2));
    greyPic = hsv2rgb(greyPic);
    greyPic = greyPic(:, :, 1);
    PrintFig(greyPic, 'desaturation_normal', edgeFilter);
    desat_n = greyPic/(max(max(max(greyPic))));
    filterNum = filterNum+1;
    
    greyPic = zeros(sizePic(1), sizePic(2)); % set greyPic back to 2-D matrix 
    
    %% decomposition
    % max
    for i = 1:sizePic(1)
        for j = 1:sizePic(2)
            greyPic(i, j) = max(colorPic(i, j, :));
        end
    end
    PrintFig(greyPic, 'decomposition_max', edgeFilter);
    decomp_max = greyPic/(max(max(max(greyPic))));
    filterNum = filterNum+1;
    
    % min
    for i = 1:sizePic(1)
        for j = 1:sizePic(2)
            greyPic(i, j) = min(colorPic(i, j, :));
        end
    end
    PrintFig(greyPic, 'decomposition_min', edgeFilter);
    decomp_min = greyPic/(max(max(max(greyPic))));
    filterNum = filterNum+1;
    
    %% single color channel
    % red
    greyPic = colorPic(:, :, 1);
    PrintFig(greyPic, 'red_channel', edgeFilter);
    channel_r = greyPic/(max(max(max(greyPic))));
    filterNum = filterNum+1;
    
    % green
    greyPic = colorPic(:, :, 2);
    PrintFig(greyPic, 'green_channel', edgeFilter);
    channel_g = greyPic/(max(max(max(greyPic))));
    filterNum = filterNum+1;
    
    % blue
    greyPic = colorPic(:, :, 3);
    PrintFig(greyPic, 'blue_channel', edgeFilter);
    channel_b = greyPic/(max(max(max(greyPic))));
    filterNum = filterNum+1;

    %% return all grey picture
    greyPic = zeros(sizePic(1), sizePic(2), filterNum);
    greyPic(:, :, 1) = lum;
    greyPic(:, :, 2) = desat_s;
    greyPic(:, :, 3) = desat_n;
    greyPic(:, :, 4) = decomp_max;
    greyPic(:, :, 5) = decomp_min;
    greyPic(:, :, 6) = channel_r;
    greyPic(:, :, 7) = channel_g;
    greyPic(:, :, 8) = channel_b;
    
end