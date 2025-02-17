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
------------------------------
import cv2
import numpy as np

def SubSampling(imgName, factor):
    """
    Reads an image and subsamples it by a given factor.

    Parameters:
        imgName (str): Name of the image file to be read.
        factor (int): The downsampling factor for both dimensions.

    Returns:
        InImage (numpy.ndarray): Original grayscale image.
        OutImage (numpy.ndarray): Subsampled image.
    """
    
    # Validate inputs
    if not isinstance(imgName, str) or not isinstance(factor, int) or factor <= 0:
        raise ValueError('Invalid input arguments.')

    # Construct full file path for the image
    imgFile = f'{imgName}'

    # Read the input image
    img = cv2.imread(imgFile)

    if img is None:
        raise FileNotFoundError(f'Image file {imgName} not found.')

    # Convert to grayscale if it is an RGB image
    if len(img.shape) == 3 and img.shape[2] == 3:
        InImage = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    else:
        InImage = img

    # Get dimensions of the original image
    NR, NC = InImage.shape

    # Calculate dimensions for the subsampled image
    NR_out = int(np.ceil(NR / factor))
    NC_out = int(np.ceil(NC / factor))

    # Preallocate the output matrix
    OutImage = np.zeros((NR_out, NC_out), dtype=np.uint8)

    # Perform subsampling
    for i in range(0, NR, factor):
        for j in range(0, NC, factor):
            rowIdx = int(np.ceil(i / factor))
            colIdx = int(np.ceil(j / factor))
            OutImage[rowIdx-1, colIdx-1] = InImage[i, j]

    return InImage, OutImage

# Example usage:
# InImage, OutImage = SubSampling('image.jpg', 2)
# cv2.imshow('InImage', InImage)
# cv2.imshow('OutImage', OutImage)
# cv2.waitKey(0)
# cv2.destroyAllWindows()
