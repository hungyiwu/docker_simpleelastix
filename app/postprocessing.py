import numpy as np
from skimage import io

path = 'moving_img_reg.tif'
img = io.imread(path)
img = np.clip(img, a_min=0, a_max=255)
img = img.astype('uint8')
io.imsave('moving_img_reg_pp.tif', img)
