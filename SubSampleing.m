function [InImage,OutImage] = SubSampleing(imgName, factor)
    % Reading input image : input_image  
    imgFile= fullfile(matlabroot, '\toolbox\images\imdata',imgName);
    img=imread(imgFile);
    if(ndims(img)==3)
        InImage = rgb2gray(imread(imgFile));
    else
        InImage=img;
    end
    [NR,NC]=size(InImage);

    numrow=1;
    for i=1:factor:NR
        numcol=1;
        for j=1:factor:NC
            res(numrow,numcol)=InImage(i,j);
            numcol=numcol+1;
        end
        numrow=numrow+1;
    end
    %PREALLOCATE THE OUTPUT MATRIX
    OutImage=res;

    %CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
    OutImage=uint8(OutImage);
end
