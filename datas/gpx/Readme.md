# Install python virtualenv
VIRTUALENV=.virtualenv

python3 -m venv $VIRTUALENV
source $VIRTUALENV/bin/activate
pip install --upgrade pip
pip install -r ./requirements.txt
scrapy runspider get_gpx_list.py -o test.csv
deactivate