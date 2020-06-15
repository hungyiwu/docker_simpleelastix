'''
Modified from https://simpleelastix.readthedocs.io/NonRigidRegistration.html
'''
import SimpleITK as sitk

elastixImageFilter = sitk.ElastixImageFilter()
elastixImageFilter.SetFixedImage(sitk.ReadImage("fixed_img.tif"))
elastixImageFilter.SetMovingImage(sitk.ReadImage("moving_img.tif"))

parameterMapVector = sitk.VectorOfParameterMap()
parameterMapVector.append(sitk.GetDefaultParameterMap("affine"))
parameterMapVector.append(sitk.GetDefaultParameterMap("bspline"))
elastixImageFilter.SetParameterMap(parameterMapVector)

elastixImageFilter.Execute()
sitk.WriteImage(elastixImageFilter.GetResultImage(), "moving_img_reg.tif")
