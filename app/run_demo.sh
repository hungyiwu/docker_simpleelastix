#!/bin/bash
# install additional packages for running demo code
apt update && apt upgrade -y
apt install -y python3-pip curl
pip3 install scikit-image
# download demo image from SimpleElastix official documentation
cd /app
curl -O https://simpleelastix.readthedocs.io/_images/PreNonrigid.jpg
# run demo code
python3 split_data.py
python3 register_img.py
python3 postprocessing.py
