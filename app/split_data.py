from skimage import io

img = io.imread('PreNonrigid.jpg')
io.imsave('fixed_img.tif', img[..., 0])
io.imsave('moving_img.tif', img[..., 2])
