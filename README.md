# auto_django_foreign_keys_etc
HOW_TO_GET_STARTED
-----------------

Basic instructions on how to create a Django Rest API through the use of a shell script (and python code created *by* the shell script)-- allowing the user to instantly jump from their original designs to functional code, with little/no typing required to get from one stage to the next: just copy/paste your tables/diagrams directly into a spreadsheet file and you can have an entire API set up in less than 5 minutes.


Every file in the repository except for the shell script (called "main_auto_api_maker2.sh") is superfluous-- it is used for demonstration purposes, to display the preferred format that this shell script wants your information to be in, and how it looks in various steps in the process of creating the API-- for the user's benefit (as a reference).


There are 3 sections within this file showing how to best use this shell script:
Part 1: Sample Data API Auto-Generation: how to create an API using the sample data from .csv files
Part 2: User Data API Auto-Generation: how to created an API using your *own* data (from your own API class tables/diagram etc.)
Part 3: Advanced Automation of Non-Essential API Alterations: how to make use of newer, somewhat experimental functions allowing a greater degree of control over secondary automated functions (your code/api will function perfectly fine without this-- but after you have created your initial API you will be able to use shell scripts and python code created by the original script in order to make further automated alterations as needed)


==============================================================================
NOTE: the terminal will provide guidance at each step as soon as main shell script is executed-- this text document you are reading is here to reinforce/clarify those instructions.
==============================================================================

------------------------------------------------------------------------------
Part 1: Sample Data API Auto-Generation:
-----------------------------------------

basic instructions on how to use this shell script (based on example with sample data):

a) either create/setup a virtual environment manually, or use the following terminal command to execute a shell script that will do so for you automatically:
./venv_autosetup_simpler.sh
...then just follow the instructions displayed on the screen to activate this virtual environment if you have not already done so, and once done, simply enter this command into terminal (from location of shell script file) to get things started:
./main_auto_api_maker2.sh

b)
--If you wish to speed things up just hit enter at 1st prompt to set input data to the default files (xa.csv and xb.csv)-- or enter ADVANCED to enter the file names directly.  For now, just use the default xa.csv, and xb.csv-- once you understand this and know you can make it work, you can create your own unique files to enter info in Part 2.

c)
--so, if you entered "ADVANCED" at the first prompt-- for now just enter the default if you haven't created your own .csv file yet-- firstly:
xa.csv
--and then at the next prompt within the advanced sub-menu enter this:
xb.csv

d)
--then, just follow instructions displayed on terminal which tell you to enter these 2 commands into terminal:
cd api_auto_xxx
./finish_my_api

e)
--further terminal commands will then display to the terminal, informing you of how you can proceed to make sure the process worked correctly, but at this point the API should be totally finished!


------------------------------------------------------------------------------
Part 2: User Data API Auto-Generation:
-----------------------------------------

The Bare Essentials:

All you need to know is this: I designed this code to function adequately no matter what your skill level--

If you used google drive's "draw.io diagrams" feature to create your API class diagram, you can just save that as a pdf to your computer, open that pdf, and directly copy and paste every box directly into the first five rows of a new spreadsheet file you create (probably using either excel or libreoffice in Linux).

It is both useful and advisable to specify which types you want the fields to be assigned as-- for the time being I limited the options to 'Date', 'Boolean', 'Char',
'Integer' and 'Float' but there's no reason why you couldn't expand this further to include more types than those-- and I may do that in the future.  But those are the limitations for the time being.  The way that this is done is simple: just copy and paste your original spreadsheet you just created (containing models and fields) into a second file (or just create a 2nd save file of the original spreadsheet) such that you have two identical spreadsheet files; then, simply enter the type you want for each given field directly into the cell with that field in it currently (thereby overriding it, as can be seen in the differences between the two example .ods spreadsheet files seen in repository-- xa_original and xb_original).  If you want to create a foreign key, just put the name of the model into the cell instead (again, as can be seen in the example spreadsheet .ods files in the repository, xa/xb).

If you make a mistake in what you put into these cells, the code will still try to accommodate you as best it can.  Just try to stick to alpha-numerical characters for simplicity's sake when assigning names to fields and models.  

Also, for the time being you can only create up to 5 models at once, automatically (but up to 99 different fields for each model could theoretically be assigned)-- there's no reason this limit on models couldn't be increased-- and I may end up doing that later on.  Also of note-- this limit of 5 models for the time being means that-- as can be seen in the example .ods spreadsheets-- for every column between the 1st and 5th columns, any column which does not contain a model has NOMODEL entered into it-- and NA in the cells below for symmetry's sake-- these, of course do not appear in the final product.  However, for the time being, if you wish to have FEWER than 5 models in your starting API, just enter NOMODEL into any top row cells between 1 and 5 which are still empty after you've placed all your models within it.

Once you've copied and pasted these values into your spreadsheet, just: Save As ---> some_name1.csv ---> use text csv format ---> Then under field options, character set: Unicode (UTF-8) Field delimeter: [just put a single space in this box] String delimeter: [just delete everything from this box]-- then just click ok.

Then, if you want to use your own .csv file to create your own API, just follow the same steps as above starting with executing your shell script (using ./main_auto_api_maker2)-- only in this case you'd substitute some_name1.csv and some_name2.csv or whatever you decided to name your .csv files instead of xa.csv and xb.csv.  

After that original shell script has been executed (as well as the shell script created by it, as explained above) you can start up your Django Rest API by entering the following two terminal commands:
1)
python manage.py createsuperuser
...at which point you will be prompted to create a login id and password to get past the login page.
2)
python manage.py runserver
...which gets your API up and running-- you'll need to execute this again any time you want to get log into your API.  Just copy and paste the url displayed in the terminal, with /admin/ added to the end of it-- and you can go directly to the login page of your new API where you can gain further access by entering the username and password you selected when you you used 'createsuperuser.'




------------------------------------------------------------------------------
