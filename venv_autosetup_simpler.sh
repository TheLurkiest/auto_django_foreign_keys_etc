# to shorten it just execute this shell script to set up the virtual environment automatically:
sudo apt-get install python3-venv
python3 -m venv environV88
source environV88/bin/activate
pip3 install django
pip install djangorestframework

echo -------------------------------------------------------------------------------

echo ok, the virtual environment you just auto set up is now ready to go:



echo to get started using it, you must activate the virtual environment using the following terminal command: source environV88/bin/activate

echo ...after that just execute the main shell script using the following terminal command: ./main_auto_api_maker2.sh

echo --then hit enter at the first prompt

echo --and just follow the instructions that are displayed on the terminal to complete the process!

echo --this should take less than 30 seconds.

echo "fixing numpy setup: this may take a little bit of time to finish:"
./numpy-fix1.sh
# i automated that numpy fix for now, if we dont need it we can comment it out

echo "...and; IF numpy doesnt install properly during the requirements.txt installation stage-- try running this AGAIN to fix it:"
echo "./numpy-fix1.sh"



simply enter this command into terminal (from location of shell script file) to get things started:

./main_auto_api_maker2.sh
