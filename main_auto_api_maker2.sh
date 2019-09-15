#!/bin/bash
# Brent Fanning
# Comp 705

# step1


rm dir_b[0-9]
rm dir_a[0-9]
rm dir[0-9]

dir_b="dir_b"

echo 'remember to activate your virtual environment before executing this or going further'

echo 'Welcome to the Django Rest API quick and dirty auto-setup skip-o-matic 5000!'
echo 'This shell script you have just executed will implement all the tedious and'
echo 'time-consuming steps needed to setup a Django Rest API with basic functionality.'
echo '------------------------------------------------------------------------'
echo ' '
csv_reply="xa.csv"
csv_reply2='xb.csv'

echo 'you must have a .csv file already created to continue-- if not, use ctrl+d/ctrl+c to exit this code and use the info below to create one before starting this process again.'
echo "to input models and fields into your API you must create a .csv file with models at the top, fields below them, seperated by a single space."
echo "if you have never done this before it is quite simple to implement-- simply create a spreadsheet using excel or libreoffice and enter text into the cells in the following manner: "
echo '1) model names go in the top row'
echo '2) the fields of each model go right below them (within the same column of the model they are within)'
echo '3) save as --> choose .csv in drop-down menu --> field delimeter: (just put a space in that box), string delimeter: (just delete everything in that box) --> hit ok -->'
echo ' '

echo '------------------------------------------------------------------------'

echo ''

echo 'if you do not know how to set up a virtual environment-- which you must do prior to starting this process-- just ctrl+f through the word document called truncated_guide_setting_up_django_api.docx searching for virtual environment until you find some information on this.  I included all the steps needed to set this up within that document.  I color-coded that section gray to make it easier to find.'
echo 'it might also be a good idea to check out HOW_TO_GET_STARTED.md if you are still getting used to this shell script'
echo 'if you have not installed django and djangorestframework you must do so --once you are within a virtual environment-- by entering the following terminal commands while in your virtual environment:'
echo 'pip install django'
echo 'pip install djangorestframework'
echo '.......you can check if these two have been correctly installed by using the following terminal command: '
echo 'pip freeze'
echo '..............if you have issues, you may need to use pip3 instead of pip and python3 instead of python to make these terminal commands here and within your shell script work.'
echo 'you must also have at least python3.6 and up to make this shell script work properly.'






echo 'hit enter now to speed things up-- making use of the default files of xa.csv and xb.csv to complete the API-- which you can simply edit if you want to make this quicker-- otherwise, enter ADVANCED now for more advanced options: '

#echo '>>>> for more advanced info/options regarding this .csv setup enter ADVANCED now-- otherwise hit any key to continue'
read csv_reply
if [ "$csv_reply" == "ADVANCED" ]
then
	echo 'ADVANCED OPTIONS MENU: '
	echo '----------------------'

	echo 'make sure you follow the current very simple limitations when creating your own input .csv data files:'
	echo '1) there must be exactly FIVE columns containing text-- columns a-e: all of these first five columns must contain either a model in the top row-- or the text NOMODEL for any columns you do not wish to use.'
	echo '2) each item (field or model) seperated by ONLY a space-- same goes for data types for any other .csv files'
	echo '3) if you have any questions I suggest you refer to the text file HOW_TO_GET_STARTED.md first-- and if this does not answer things, just ctrl+f through the word document called truncated_guide_setting_up_django_api.docx'
	echo 'Enter the name of your .csv file containing fields and model info-- by default this is xa.csv: '
	read csv_reply

	echo 'thank you for your selection.  We will now ask for the .csv file containing data type information-- by default this is normally xb.csv'
	echo 'if you wish to enter a different .csv file, just make sure it only uses the approved data types-- for the time being these are limited to: Integer, Boolean, Date, Float, and Char '

	echo 'Enter a secondary .csv file to specify the data types for each field'
	read csv_reply2
	#echo '4) to write down any additional text that will not be read into the API (like names, dates, etc.) just put NOMODEL into the top row or some column, and you will be able to freely enter whatever text you wish into the cells within that column beneath that initial top row.'
  #echo '5) you may also enter an optional 2nd .csv momentarily when prompted to specify data types for each field.'
  #echo '--just set up your .csv the same as before, but with Integer, Date, Float, and Char within each cell which contains a field of that datatype.  Entering other datatypes besides these via this automation may be problematic.'
else
	csv_reply="xa.csv"
	csv_reply2='xb.csv'
fi

mkdir api_auto_xxx
touch stage1_auto_d.py

chmod 777 stage1_auto_d.py

echo "import os

print('step 1: if virtual environment is not active, ctrl+c/d out of this python code')
print('...and then activate the virtual environment first before running this again')

print(' ')
print('------------------------------------------------------------------')
p_reply = ''
#p_reply = input('press ANY KEY to continue automatic default setup or enter SKIP if you have already finished and tested this API and wish to make further alterations by adding new fields to existing models.')


if (p_reply.upper() != 'SKIP'):

	apps_found = False

	fin1=open('config/settings.py','r')
	s_pre_marker=''
	s_post_marker=''
	for line in fin1:
		if(apps_found == False):
			s_pre_marker = str(s_pre_marker) + str(line)
		if(line.count('django.contrib.admin') >= 1):
			s_pre_marker = str(s_pre_marker) + str(line.replace(('django.contrib.admin'), ('rest_framework')))
		if(line.find('INSTALLED_APPS') == True ):
			apps_found = True
	fin1.close()

	apps_found = False

	fin2=open('config/settings.py','r')
	for line in fin2:
		if(apps_found == True):
			s_post_marker = str(s_pre_marker) + str(line)
			if(line.count('INSTALLED_APPS') >= 1 ):
				apps_found = True
	fin2.close()

	os.system('sudo rm config/settings.py')

	fout3=open('config/settings.py','w')

	fout3.write(str(s_pre_marker))
	fout3.write(str(s_post_marker))

	fout3.close()




	apps_found = False

	fin1=open('config/settings.py','r')
	s_pre_marker=''
	s_post_marker=''
	for line in fin1:
		if(apps_found == False):
			s_pre_marker = str(s_pre_marker) + str(line)
		if(line.count('django.contrib.admin') >= 1):
			s_pre_marker = str(s_pre_marker) + str(line.replace(('django.contrib.admin'), ('api')))
		if(line.find('INSTALLED_APPS') == True ):
			apps_found = True
	fin1.close()

	apps_found = False

	fin2=open('config/settings.py','r')
	for line in fin2:
		if(apps_found == True):
			s_post_marker = str(s_pre_marker) + str(line)
			if(line.count('INSTALLED_APPS') >= 1 ):
				apps_found = True
	fin2.close()

	os.system('sudo rm config/settings.py')

	fout3=open('config/settings.py','w')

	fout3.write(str(s_pre_marker))
	fout3.write(str(s_post_marker))

	fout3.close()











else:
	# ----------------------------------------------------------------------------
	# here is where we can potentially choose to add new fields to existing files:
	# ----------------

	print('If you have not yet tested out that this API currently works by going ')
	print('to the url listed when the terminal command python3 manage.py runserver')
	print('is used, and checking that the url listed within the terminal upon ')
	print('running that terminal command leads you to a working website then')
	print('answer NO to the following question.  This feature can be used in the')
	print('future to add new fields to your models once it has been fully')
	print('implemented-- but wait until you have tested the base setup first.')

	print(' ')
	print('NOTE: this feature is still under development-- not all changes are')
	print('automatically implemented.  The following modules still need auto-')
	print('alteration features added to make this option fully automatic:')
	print('models.py, serializers.py, urls.py, ')

	print('once tests.py has had its basic setup it will also need to have ')
	print('features added here to make the new changes compatible will the')
	print('new models.')

	p_reply2 = ''
	p_reply2 = input('Would you like to add a new field?')
	p_reply = input('What is the name of the model you want to add that field to?')

	model1 = p_reply

	field_list=[]

	while(p_reply2.upper() == 'YES'):
		p_reply = input('What would you like to call your field within that model?')
		if(len(p_reply) >= 1):
			field_list.append(p_reply)
		p_reply2 = input('Would you like to create any additional fields (yes/no)?')


	print('the fields for the ' + str(model1) + 'model are as follows:')

	r_field_list = range(len(field_list))
	for r_elem in r_field_list:
		print(str(field_list[r_elem]))

	print('use the following two terminal commands to implement any changes: ')
	print('python3 manage.py makemigrations')
	print('python3 manage.py migrate')
	# ----------------------------------------------------------------------------

" > stage1_auto_d.py








echo "

# @2222222222222222222222222

import os

q_marker='= models.CharField(max_length=255, null=False)'
q_count=1
b_count=1


m1_count=0
l_m1=[]
list_m1=[]
b_fin2=open('m1_file','r')
for line_b in b_fin2:
	#l_m1=b_fin2.readlines(b_count)
	if(len(str(line_b))>2):
		list_m1.append(str(line_b[:-1]))
		print('model: '+str(list_m1))


b_fin2.close()
m1_count=len(list_m1)
print('there are this many models: '+str(m1_count))

f_types_per_m1=[]


















for dir_b_file in range(1,(m1_count+1)):
	b_fin2=open(('dir_b'+str(dir_b_file)),'r')
	for line_b in b_fin2:
		#l_m1=b_fin2.readlines(b_count)
		if(len(str(line_b))>2):
			f_types_per_m1.append(str(line_b[:-1]))
			# print('model: '+str(f_types_per_m1))
b_fin2.close()


m1_count=len(list_m1)
print('this is the list: '+str(f_types_per_m1))
print('this are this many total fields in all combined lists: '+str(len(f_types_per_m1)))


fields_per_m1=[]

for dir_file in range(1,(m1_count+1)):
	b_fin2=open(('dir'+str(dir_file)),'r')
	for line_b in b_fin2:
		#l_m1=b_fin2.readlines(b_count)
		if(len(str(line_b))>2):
			fields_per_m1.append(str(line_b[:-1]))
			# print('model: '+str(fields_per_m1))
b_fin2.close()


m1_count=len(list_m1)
print('this is the list: '+str(fields_per_m1))
print('this are this many total fields in all combined lists: '+str(len(fields_per_m1)))



count_f_per_m1=[]

for dir_b_file in range(1,(m1_count+1)):
	b_fin2=open(('lc_mf'+str(dir_b_file)),'r')
	for line_b in b_fin2:
		#l_m1=b_fin2.readlines(b_count)
		if(len(str(line_b))>=1):
			count_f_per_m1.append(int(line_b[:-1]))
			# print('model: '+str(f_types_per_m1))
b_fin2.close()
print('this is how many fields I have for the respective models: '+str(count_f_per_m1))
lists_of_types=list(range(1,(m1_count+1)))
# count_all_m_spots=count_f_per_m1
types_per_seg = 0
current_fields_out=0

current_type=''






print('\n------------------------\n')
print('count_f_per_m1 is: '+str(count_f_per_m1))
print('length of count_f_per_m1 is: '+str(len(count_f_per_m1)) )
print('\n...we should instead use f_types_per_m1: '+str(f_types_per_m1))
print('\n...which has length of: '+str(len(f_types_per_m1)))

#for elem_m1 in list_m1:
#p_reply=input('breakup code debug')



for elem_t in range(0,(m1_count)):
	#b_fin2=open(('lc_mf'+str(dir_b_file)),'r')

	current_fields_out=1
	print('current_fields_out: '+str(current_fields_out))
	print('fields_per_m1: '+str(fields_per_m1))

	types_per_seg = str(fields_per_m1[current_fields_out])

	print('types_per_seg is '+str(types_per_seg))

	print(' count_f_per_m1 '+str(count_f_per_m1))


	while(current_fields_out <= int(count_f_per_m1[int(elem_t)])):
		print('from while loop: count_f_per_m1 ' + str(count_f_per_m1) )
		print('from while loop: current_fields_out ' + str(current_fields_out))
		print('from while loop: current_fields_out must be less than this: ' + str( count_f_per_m1[int( elem_t )]) )

		if(elem_t<len(list_m1)):
			print('model number '+str(elem_t)+'- model is: '+str(list_m1[elem_t]))
		#print('model number '+str(elem_t)+' contains '+str(types_per_seg)+' types.')
		#types_per_seg
		# = int(f_types_per_m1[types_segment])
		print('the current type is: '+str(f_types_per_m1[current_fields_out]))

		print('the current field is: '+str(fields_per_m1[current_fields_out]))
		#print('other thing: '+str(count_f_per_m1[current_fields_out]))

		current_fields_out=current_fields_out+1

		# what sort of info do we need to be able to return it back to where
		# it's needed?  I am just trying to get a bunch of types...

	# ============================================================
	for mod_elem in range(0,(m1_count)):
		current_fields_out=0
		print('final for loop starts here:')
		w_out=''
		w_out_arr=[]
		w_out2=''
		w_out2_arr=[]
		for type_elem in (range(0, int(count_f_per_m1[mod_elem]) )):
			# current_fields_out=current_fields_out+1

			w_out_arr.append(str(fields_per_m1[type_elem]))
			w_out=str(w_out)+str(fields_per_m1[type_elem])
			w_out2=str(w_out2)+str(f_types_per_m1[type_elem])
			w_out2_arr.append(str(f_types_per_m1[type_elem]))

			type_elem=int(type_elem)
			if (type_elem == int(count_f_per_m1[mod_elem] ) ):
				print('writing out files now!')
				b_fout_end=open(('current_fields_out'+str((count_f_per_m1[type_elem]))),'w')
				b_fout_end.write(str(w_out))
				b_fout_end.close()
				#b_fout_end=open(('current_field_types_out'+str(type_elem)),'w')
				b_fout_end=open(('current_field_types_out'+str( (count_f_per_m1[type_elem]) ) ),'w')
				b_fout_end.write(str(w_out2))
				b_fout_end.close()
			current_fields_out=current_fields_out+1

arr_combo=[]
for c_arr2, f_types_arr in enumerate(w_out2_arr):
	arr_combo.append('	'+str(w_out_arr[c_arr2])+' = models.'+str(f_types_arr)+'Field(max_length=250, null=False)')
























print('writing out field type files now!')
b_fout_end=open('field_types_edit.txt' ,'w')

for arr_elem in arr_combo:
	b_fout_end.write(str(arr_elem) + '\n')
b_fout_end.close()


change_field_type_found=False
mod_assigned = False
apps_found = False

print('The new lines intended to potentially generate classes and models')
print('and fields of specific types were placed in the current directory in a folder called field_types_edit.txt')








#======================================

arr_combo_feedback=[]
for c_arr2, f_types_arr in enumerate(w_out2_arr):
	arr_combo_feedback.append(str(w_out_arr[c_arr2])+' '+str(f_types_arr))

count_all_m_spots=count_f_per_m1
count_all_m_spots.insert(0,0)
del count_all_m_spots[-1]

b_fin2=open('csv_feedback1.csv','w')
b_sum1=0
for elem_spot in count_all_m_spots:
	b_sum1=b_sum1+int(elem_spot)
	b_fin2.write(str(fields_per_m1[b_sum1]))

# b_fin2=open('csv_feedback1.csv','w')
# for elem_spot in count_all_m_spots:
	# b_fin2.write(str(fields_per_m1[elem_spot]) + ' ')

b_sum1=0
b_sum_list=[]
for c_spot, elem_spot in enumerate(count_all_m_spots):
	count_new=0
	b_sum1=b_sum1+int(elem_spot)
	b_sum_list.append(b_sum1)
	#while(len(arr_combo_feedback[:(b_sum1 + count_new)]) < )
		#b_fin2.write(str(fields_per_m1[elem_spot]) + ' ')
		#count_new=count_new + 1

#======================================

b_sum_list_alt2=b_sum_list









print('\n------------------------\n')
print('b_sum_list is: '+str(b_sum_list))

#p_reply=input('breakup code debug')










# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('w_out2_arr is: '+str(w_out2_arr))
print('w_out_arr length is: '+str(len(w_out2_arr)))
print('\n-----------------------------------------------------------------\n')
#p_reply=input('breakup code 2')

other_pre_marker=''

s_count=0
sum1=0
#fin1=open('models.py','r')
s_pre_marker=''
s_pre_marker2=''
























# f_types_per_m1


new_full_final_types=f_types_per_m1

# len(new_full_final_types)
# 41

#new_full_final_types.insert(0, 'aaa')


for c_bs, bs_elem in enumerate(b_sum_list):
	new_full_final_types.insert( int( bs_elem ), list_m1[c_bs] )

index_count=1
b_sum_list_alt=b_sum_list
for elem_index in b_sum_list_alt2:
	if(elem_index == 0):
		#new_full_final_types.insert(0, 'aaa')
		print('null')
	else:
		new_full_final_types.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1
		#new_full_final_types.insert(elem_index+index_count, 'zzz' )
		#index_count=index_count+1

# len(new_full_final_types)
# 50

new_full_final_types.insert(len(new_full_final_types), 'zzz' )
new_full_final_types.insert(len(new_full_final_types), 'zzz' )






# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final_types is: '+str(new_full_final_types))
print('new_full_final_types length is: '+str(len(new_full_final_types)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


f_types_per_m1_2=f_types_per_m1
f_types_per_m1=[]
for f_per_m1_elem in f_types_per_m1_2:
	if(f_per_m1_elem != 'zzz'):
		f_types_per_m1.append(f_per_m1_elem)



print('\nf_types_per_m1 is:\n'+str(f_types_per_m1))
#p_reply=input('breakup code 2')


index_count=1
b_sum_list_alt=b_sum_list
for elem_index in b_sum_list_alt2:
	if(elem_index == 0):
		del new_full_final_types[0]
		new_full_final_types.insert(0, 'aaa')
		print('null')
	else:
		index_count=index_count+1
		f_types_per_m1.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1

f_types_per_m1.append('zzz' )
f_types_per_m1.append('zzz' )



print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('f_types_per_m1 is '+str(f_types_per_m1)+' and length is: '+str(len(f_types_per_m1)))
# p_reply = input('testing 123')
#p_reply = input('f_types_per_m1 is '+str(f_types_per_m1)+' and length is: '+str(len(f_types_per_m1)))


# f_types_per_m1# f_types_per_m1


new_full_final_types=f_types_per_m1






























# fields_per_m1


new_full_final_fields=fields_per_m1

# len(new_full_final_fields)
# 41

#new_full_final_fields.insert(0, 'aaa')


for c_bs, bs_elem in enumerate(b_sum_list):
	new_full_final_fields.insert( int( bs_elem ), list_m1[c_bs] )

index_count=1
b_sum_list_alt=b_sum_list
for elem_index in b_sum_list_alt2:
	if(elem_index == 0):
		#new_full_final_fields.insert(0, 'aaa')
		print('null')
	else:
		new_full_final_fields.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1
		#new_full_final_fields.insert(elem_index+index_count, 'zzz' )
		#index_count=index_count+1

# len(new_full_final_fields)
# 50

new_full_final_fields.insert(len(new_full_final_fields), 'zzz' )
new_full_final_fields.insert(len(new_full_final_fields), 'zzz' )






# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final_fields is: '+str(new_full_final_fields))
print('new_full_final_fields length is: '+str(len(new_full_final_fields)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


fields_per_m1_2=fields_per_m1
fields_per_m1=[]
for f_per_m1_elem in fields_per_m1_2:
	if(f_per_m1_elem != 'zzz'):
		fields_per_m1.append(f_per_m1_elem)



print('\nfields_per_m1 is:\n'+str(fields_per_m1))
# p_reply=input('breakup code 2')


index_count=1
b_sum_list_alt=b_sum_list
for elem_index in b_sum_list_alt2:
	if(elem_index == 0):
		del new_full_final_fields[0]
		new_full_final_fields.insert(0, 'aaa')
		print('null')
	else:
		index_count=index_count+1
		fields_per_m1.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1

fields_per_m1.append('zzz' )
fields_per_m1.append('zzz' )


print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('new_full_final_types is '+str(new_full_final_types)+' and length is: '+str(len(new_full_final_types)))
# p_reply = input('testing 123')
# p_reply = input('fields_per_m1 is '+str(new_full_final_types)+' and length is: '+str(len(new_full_final_types)))


print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('\n +++++++++++ \n')
print('fields_per_m1 is '+str(fields_per_m1)+' and length is: '+str(len(fields_per_m1)))
# p_reply = input('testing 123')
# p_reply = input('fields_per_m1 is '+str(fields_per_m1)+' and length is: '+str(len(fields_per_m1)))


# f_types_per_m1# fields_per_m1


new_full_final_fields=fields_per_m1

# len(new_full_final_fields)
# 41

index_count=1

#for elem_index in b_sum_list:
#	if(elem_index == 0):
#		new_full_final_fields.insert(0, 'aaa')
#	else:
#		new_full_final_fields.insert(elem_index+index_count, 'zzz' )
#		index_count=index_count+1
#new_full_final_fields.insert(len(new_full_final_fields), 'zzz' )






# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final_fields is: '+str(new_full_final_fields))
print('new_full_final_fields length is: '+str(len(new_full_final_fields)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


# fields_per_m1


new_full_final=f_types_per_m1

# len(new_full_final)
# 41

index_count=index_count+1
index_count=1


b_sum_list2b=b_sum_list
for elem_index in b_sum_list2b:
	if(elem_index == 0):
		new_full_final.insert(0, 'aaa')
	else:
		new_full_final.insert(elem_index+index_count, 'zzz' )
		new_full_final.insert(elem_index+index_count, 'zzz' )
		index_count=index_count+1

# len(new_full_final)
# 50

new_full_final.insert(len(new_full_final), 'zzz' )
new_full_final.insert(len(new_full_final), 'zzz' )







# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final is: '+str(new_full_final))
print('new_full_final length is: '+str(len(new_full_final)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


fin1=open('seven_namesakes/models.py','r')

line_sum=''
for line in fin1:
	line_sum=line_sum+line

fin1.close()

line_sum=line_sum.split('\n')

del line_sum[-1]

print('\n-----------------------------------------------------------------\n')
print('\n-----------------------------------------------------------------\n')
print('\n-----------------------------------------------------------------\n')

# w_out2_arr
print('\n---line_sum---line_sum---line_sum---line_sum---line_sum---line_sum---')
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('line_sum is: '+str(line_sum))
print('line_sum length is: '+str(len(line_sum)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


print('\n-----------------------------------------------------------------\n')
print('\n-----------------------------------------------------------------\n')
print('\n-----------------------------------------------------------------\n')

# w_out2_arr
print('\n---w_out2_arr---')
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('w_out2_arr is: '+str(w_out2_arr))
print('w_out2_arr length is: '+str(len(w_out2_arr)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')

# w_out2_arr
print('\n---w_out_arr---')
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('w_out_arr is: '+str(w_out_arr))
print('w_out_arr length is: '+str(len(w_out_arr)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


#for c_arr2, f_types_arr in enumerate(new_full_final):
print('\n----------------------------------\n')
print('line_sum length is: '+str(len(line_sum)))
print('new_full_final length is: '+str(len(new_full_final)))
#p_reply=input('our c_arr2 is:\n'+str(c_arr2)+'\n----------------\n...and s_pre_marker so far for final output is: \n'+str(s_pre_marker)+'\n----------------\n\n')
# new_full_final
print('main for loop for altering our field types is now active...')
s_pre_marker2=''
field_found1=False

final_line=''


tests_count_def_str='meaningless_placeholder'
tests_count_def=0
fout3=open(str(tests_count_def_str),'w')
fout3.close()



#s_pre_marker=str(s_pre_marker) + str(line2.replace( ' = models.CharField(max_length=255, null=False)', str(' = models.' + str(new_full_final[line_c]) +'Field(max_length=250, null=False)' ) ) )


fk_cap=''
fk_cap2=''
print('\nfields_per_m1 is:'+str(fields_per_m1))
print('\nnew_full_final'+str(new_full_final))
# p_reply=input('breakup for debug')

# 50 fields: fields_per_m1
# 50 types: new_full_final
s_pre_marker_tests_def=''

p_reply_meaningless=''

for line_c, line in enumerate(line_sum):
	line2=line
	print('entering line loop')
	print('s_pre_marker so far is:\n'+str(s_pre_marker))
	print('last line was: '+str(final_line)+'\n')
	print('currently-- line number '+str(line_c)+' is: '+str(line))
	# p_reply=input('debug check code break')
	if(new_full_final[line_c] == 'aaa' or new_full_final[line_c] == 'zzz'):
		line2=line
		s_pre_marker=str(s_pre_marker) + str(line2)
	elif(line2.count('(models.Model):') >= 1):
		line2=str(line)
		s_pre_marker=str(s_pre_marker) + str('class '+str(fields_per_m1[line_c])+'(models.Model):')
	elif(line2.count(' def __str__(self):') >= 1 or line2.count('.format(self.') >= 1 or line2.count('from django.db import models') >= 1):
		line2=line
		s_pre_marker=str(s_pre_marker) + str(line2)
	else:
		#p_reply=input('check for field types in ' + str(fields_per_m1[line_c]))
		if(str(new_full_final_types[line_c]) == 'Boolean' or str(new_full_final_types[line_c]) == 'Char' or str(new_full_final_types[line_c]) == 'Integer' or str(new_full_final_types[line_c]) == 'Float' or str(new_full_final_types[line_c]) == 'Date'):
			s_pre_marker=str(s_pre_marker) + str(line2.replace( ' = models.CharField(max_length=255, null=False)', str(' = models.'+str(new_full_final[line_c]) +'Field(max_length=250, null=False)' ) ))
		else:
			stage_2_s=str(fields_per_m1[line_c])
			stage_3_s=''
			for c_elem_s, elem_s in enumerate(stage_2_s):
				if(elem_s.isupper()==True):
					if(c_elem_s != 0):
						stage_3_s=stage_3_s+'_'
						stage_3_s=stage_3_s+elem_s
					else:
						stage_3_s=stage_3_s+elem_s
				else:
					stage_3_s=stage_3_s+elem_s
			stage_3_s=stage_3_s.lower()
			fk_cap=stage_3_s
			fk_cap2 = fk_cap.replace('_',' ')
			fk_cap2=fk_cap2.title()
			fk_cap2=fk_cap2.replace(' ','')
			print('list_m1 is: ' + str(list_m1))
			print('\n...and fk_cap2 is: ' + str(fk_cap2))
			# p_reply_meaningless=input('break here checking for thing')

			if(list_m1.count(fk_cap2) < 1):
				s_pre_marker =str(s_pre_marker) + '	' + str(stage_3_s) + ' = models.CharField(max_length=255, null=False)'

				s_pre_marker_tests_def=str(s_pre_marker_tests_def)+'):'
				s_pre_marker_tests_def=str(s_pre_marker_tests_def)+'\n'

				tests_count_def = tests_count_def + 1
				#tests_count_def_str = 'func_def_num' + str(tests_count_def)
				#tests_count_def_str = 'func_def_num999'

				#fout3=open('func_def_placeholder','w')
				#fout3.write(str(s_pre_marker_tests_def))
				#fout3.close()

				s_pre_marker_tests_def=''

				s_pre_marker_tests_def = 'def create' + '_' + str(stage_3_s) + '('

			elif(list_m1.count(fk_cap2) >= 1):
				#s_pre_marker_tests_def =str(s_pre_marker_tests_def) + ', ' + str(stage_3_s) + '= \"\"'


				s_pre_marker=str(s_pre_marker) + line2.replace(str(fields_per_m1[line_c]) + ' = models.CharField(max_length=255, null=False)', str(stage_3_s) + ' = models.ForeignKey(\"'+str(fk_cap2)+'\", on_delete=models.CASCADE)' )
	s_pre_marker = s_pre_marker + '\n'
	# asadfa
	final_line=line2

print('\n=============================================\n')
print('\n=============================================\n')
print('\n=============================================\n')

# p_reply=input('final line was: '+str(final_line))





# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('new_full_final is: '+str(new_full_final))
print('new_full_final length is: '+str(len(new_full_final)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')


# w_out2_arr
print('\n-----------------------------------------------------------------\n')
print('here is how we parse our for loop')
print('fields_per_m1 is: '+str(fields_per_m1))
print('fields_per_m1 length is: '+str(len(fields_per_m1)))
print('\n-----------------------------------------------------------------\n')
# p_reply=input('breakup code 2')






# @@@@@@@@@@@@@@@@@@22222222


fout3=open('models.py','w')
fout3.write(str(s_pre_marker))
fout3.close()


# why is this happening:
fout3=open('models2.py','w')
fout3.write(str(s_pre_marker_tests_def))
fout3.close()

#fout3=open('func_def_placeholder_xxx.txt','w')
#fout3.write(str(s_pre_marker_tests_def))
#fout3.close()





#fout3=open('api/models.py','w')
#fout3=open('fout3_models.py','w')
#fout3.write(str(s_pre_marker))
#fout3.write(str(s_post_marker))

#fout3.close()


" > type_application_clean_slate_final.py

























touch api_auto_xxx/finish_my_api.sh
chmod 777 api_auto_xxx/finish_my_api.sh


echo "This second shell script will be created and placed into the new folder"
echo "This will enable you to complete the remaining steps of the pregame"
echo "Just cd into that directory and execute that shell script to finish it."

echo "# step 3a

cp ../m1_file .
cp ../dir_b[1-99] .
cp ../dir[1-99] .
cp ../lc_mf[1-99] .
mkdir seven_namesakes .
cp -r ../seven_namesakes/models.py seven_namesakes/
#cp -r ../seven_namesakes/models.py .
#mkdir api

git init

# step 3b

# cp ~/workspace/final_project_reflections/my2_branch_reflect/reflections-project/.gitignore .

echo '

# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*\$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints

# pyenv
.python-version

# celery beat schedule file
celerybeat-schedule

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/

' > .gitignore

git add .gitignore


# step 3c
git commit -m 'hopefully first commit'

# step 4
touch requirements.txt
pip freeze > requirements.txt

# step 5
django-admin startproject config .

sudo cp ../stage1_auto_d.py .


git add config
git add requirements.txt
git add stage1_auto_d.py
git add finish_my_api.sh

git commit -m 'added all our files just prior to final step of the pregame'

# step 9

python3 manage.py startapp api


# final step of pregame:
python3 stage1_auto_d.py









field_types_added=''

field_types_added='YES'
#echo 'enter YES if you DID add a second .csv file which contained field type info for your models: '
#read field_types_added

if [ \"\$field_types_added\" == 'YES' ]
then
	echo '...starting process of incorporating type information into models.py...'
	python ../type_application_clean_slate_final.py
fi





echo 'The automatic portion of the Django Rest API setup is now complete.'
echo 'Now for testing and implementation of changes-- '



echo '
from .models import runserver
admin.site.register(User)
' >> api/admin.py



cp ../seven_namesakes/admin.py api/
cp ../seven_namesakes/models.py api/
cp ../seven_namesakes/config/urls.py config/

cp ../seven_namesakes/tests.py api/
cp ../seven_namesakes/views.py api/
cp ../seven_namesakes/serializers.py api/
cp ../seven_namesakes/urls.py api/



cp models.py api/



python manage.py makemigrations
python manage.py migrate


# this is what adds the foreign keys back in:
cp ../models.py api/models.py
python manage.py makemigrations
python manage.py migrate




#----------------------------------
file_t_count=0

for file in ../seven_namesakes/tests_m[1-99]; do

	let file_t_count=file_t_count+1
	head -n 199 ../m1_file_tests\$file_t_count | cat >> \$file

	head -n 199 \$file | cat >> api/tests.py

done

#----------------------------------


echo '------------------------------------------------------------------------------------------------------'

echo 'THE CREATION OF YOUR DJANGO REST API IS NOW COMPLETE!'

echo '----------------------------------------------------'

echo 'to gain access to this API you have just created and verify that everything is working correctly you first need to set up a username and password using the following terminal command:'

echo 'python manage.py createsuperuser'


echo '...and now whenever you want to make use of the API you have just made you can simply execute the following terminal command from within the folder you are current in right now, while your virtual environment is activated, as it should be at the moment: '

echo 'python manage.py runserver'


echo '...and then just copy the url displayed in the terminal into your firefox browser to test it with /admin/ added to the end of the URL let you view the login screen'
echo 'to stop using this API, simply go back to the terminal and hit ctrl+c to leave'

echo '...and as before, if you want to activate your virtual environment again, if it should become deactivated, simply enter the following terminal command PRIOR to python manage.py runserver:'

echo 'source environV88/bin/activate'

echo '--that concludes this automatic portion of this Django Rest API setup.  Good luck!'

echo 'As one last final step, we are now setting up some basic functionality just as a placeholder'

mkdir api/completed_color_change_animations

mv ../fixed_redder_grass1.py api/fixed_redder_grass.py


" > api_auto_xxx/finish_my_api.sh

chmod 777 api_auto_xxx/finish_my_api.sh

echo "now cd into the api_auto_xxx folder you created and execute the shell script within it called finish_my_api.sh to continue"

sudo rm -r seven_namesakes
mkdir seven_namesakes
mkdir seven_namesakes/config
outer_folder='seven_namesakes/'













if [ "$csv_reply2" != "SKIP" ]
then
	placeholder_s='	return "{}, {}".format(self.'
	input1b=$csv_reply2
	output1=""
	s2_field_count=1
	tot_num_all_mf=0
	num_fields=5

	let num_fields_less_one=num_fields+1
	num_fields_counted=1

	serializers_fields="fields = ("

	num_placeholder=0
	while read -r line
	do
		set $line
		while [ "$num_fields_counted" -lt "$num_fields_less_one" ]
		do
			if [ "$tot_num_all_mf" -lt 1 ]
			then
				echo model $num_fields_counted is
				echo "${!num_fields_counted}"
				if [ "${!num_fields_counted}" == "NOMODEL" ]
				then
					echo "no model here... skipped"
					echo '' > $dir_b$num_fields_counted
					let mod_now=mod_now-1
				else
					echo "${!num_fields_counted}" >> $dir_b$num_fields_counted
				fi
				let num_fields_counted=num_fields_counted+1
			else
				if [ "${!num_fields_counted}" == "NA" ]
				then
					let tot_num_all_mf=99
					# null statement alters now pointless variable
				else
					echo "${!num_fields_counted}" >> $dir_b$num_fields_counted
				fi
				let num_fields_counted=num_fields_counted+1
			fi
		done
		let num_fields_counted=0
		let tot_num_all_mf=tot_num_all_mf+1
	done < $input1b
else
	echo '--ok a default CharField will be used for all fields for now'
	f_dtype='Char'
	f_dtype2="max_length=255, null=False"
fi


















created_urls_list=0


# ------------------- START OF DIRECT ENTRY INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------
if [ "$csv_reply" == "NO" ]
	then
	echo 'how many models do you want to make to start out with?'
	read num_models
	echo 'what is the name of the first model you wish to create?'
	read model_name
	echo 'how many fields do you want to make for this model?'
	read num_fields
	shortfolder='dir'
	echo $model_name >> $outer_folder$shortfolder$num_models
	startingmodels=$num_models
	while :
	do
		if [ $num_fields -lt 1 ]
		then
			num_models=$[ $num_models -1 ]

			if [ $num_models -lt 1 ]
			then
				echo 'all fields and all models have been created!!!  Moving on...'
				break
			else
				echo 'what would you like to call the next model?'
				read model_name
				echo 'how many fields do you want to make for that model?'
				read num_fields
				touch $outer_folder$shortfolder$num_models
				echo $model_name >> $outer_folder$shortfolder$num_models
			fi
		else
			echo 'what would you like this field to be named?'
			read field_name
			echo $field_name >> $outer_folder$shortfolder$num_models
			num_fields=$[ $num_fields -1 ]
		fi
		echo "models remaining to set up: "$num_models
		echo "fields remaining to set up: "$num_fields
	done

	input1=$outer_folder$shortfolder$num_models
  # input1 is seven_namesakes/dir--(model number being currently set up)


	line1model=''
	line2plusfields=''
	countforfields=0

	# this is the final product thatll become models.py:
	models_info1='models_alt.py'


	echo '' > $outer_folder$models_info1
	# models_alt.py

	num_models=$[ $num_models +1 ]
	#num_models=$[ $num_models +1 ]
	input1=$outer_folder$shortfolder$num_models

	echo "num_models just prior to start of while loop is: ${num_models}"
	echo "input1 just prior to start of while loop is: ${input1}"
	echo "output location just prior to start of while loop is: ${outer_folder}${models_info1} so that is where text from models will output to"
	output_line_urls=""
	output_line_tests=""

	while [ "$num_models" -lt "$startingmodels" ]
	do
		while read -r line
		do
			set $line
			echo $line
			if [ "$countforfields" -lt 1 ]
			then
				line1model=$line
				outputline="class ${line1model}(models.Model):"
				echo $outputline >> $outer_folder$models_info1

			else
		# num_models <----why is this here???
				line2plusfields=$line
				outputline="	${dir_b}${num_fields_counted} = models.CharField(max_length=255, null=False)"

				#output_line_urls="	${dir_b}${num_fields_counted} = models.CharField(max_length=255, null=False)"

				echo $outputline >> $outer_folder$models_info1
			echo "	tab test this line should be slightly indented"
			fi
			countforfields=$[ $countforfields +1 ]
			# echo $outputline >> $outer_folder$shortfolder$num_models
		done < $input1
	num_models=$[ $num_models +1 ]
	# we need to continually update our input like this to make sure get the correct input:
	input1=$outer_folder$shortfolder$num_models
	echo "input1 after the completion of a single cycle outside the first while loop but inside the second: ${input1}"
	done
	input1=$outer_folder$shortfolder$num_models

# ------------------- END OF DIRECT ENTRY INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------

# ------------------- START OF .CSV INPUT INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------

else
	placeholder_s='	return "{} - {}".format('
	# default input1 is spaces_only.csv which we will leave as this as for quicker testing and debugging until done
	# ...however once finished it will revert back to $csv_reply --since we've confirmed this manual entry works
	input1=$csv_reply
	output1=""

	s2_field_count=1

	# this just counts everything that gets read out so we can use an if
	# conditional to check if the models have been dislayed yet
	tot_num_all_mf=0

	num_fields=5
	let num_fields_less_one=num_fields+1

	num_fields_counted=1

	dir="dir"
	mod_now=""

	serializers_fields="fields = ("


	while read -r line
	do
		set $line

		while [ "$num_fields_counted" -lt "$num_fields_less_one" ]
		do
			if [ "$tot_num_all_mf" -lt 1 ]
			then
				echo model $num_fields_counted is
				echo "${!num_fields_counted}"
				if [ "${!num_fields_counted}" == "NOMODEL" ]
				then
					echo "no model here... skipped"
					rm $dir$num_fields_counted
				else
					echo "${!num_fields_counted}" > $dir$num_fields_counted
				fi

				let num_fields_counted=num_fields_counted+1
			else
				if [ "${!num_fields_counted}" == "NA" ]
				then
					let tot_num_all_mf=99
					# null statement alters now pointless variable
				else
					echo "${!num_fields_counted}" >> $dir$num_fields_counted
				fi

				let num_fields_counted=num_fields_counted+1
			fi
		done

		let num_fields_counted=0
		let tot_num_all_mf=tot_num_all_mf+1

	done < $input1

	linec=1
	line_count_mf=1
	countforfields=1
	f1=""
	m1=""
	mf1=0
	mf1_plus=0

	# admin.py get imports from m_all and then object strings from pt2:
	m_all=""
	first_m=""

	a2_pt2="zzz"
	sense_of_self=""
	echo "" > a2_pt2_file
	echo "" > m1_file
	# namesake-ification of 7 python modules:

	# admin.py, models.py, and serializers.py:
	echo "from django.contrib import admin" > seven_namesakes/admin.py
	echo "from django.db import models" > seven_namesakes/models.py
	echo "from rest_framework import serializers" > seven_namesakes/serializers.py

	# for tests.py:
	echo "import unittest" > seven_namesakes/tests.py
	echo "from django.test import TestCase" >> seven_namesakes/tests.py
	echo "from django.test import Client" >> seven_namesakes/tests.py
	# more tests.py imports
	echo "from django.urls import reverse" >> seven_namesakes/tests.py
	echo "from rest_framework.test import APITestCase, APIClient" >> seven_namesakes/tests.py
	echo "from rest_framework.views import status" >> seven_namesakes/tests.py


	tests_m_count=0


	# first urls.py which lives in folder with 6 .py modules together:
	echo 'from django.urls import path' > seven_namesakes/urls.py

	# views.py:
	echo 'from rest_framework.views import APIView' > seven_namesakes/views.py
	echo 'from rest_framework.response import Response' >> seven_namesakes/views.py
	echo 'from rest_framework import status' >> seven_namesakes/views.py

	echo 'from django.contrib import admin' > seven_namesakes/config/urls.py
	echo 'from django.urls import path, include, re_path' >> seven_namesakes/config/urls.py
	echo 'urlpatterns = [' >> seven_namesakes/config/urls.py
	echo "	path('admin/', admin.site.urls)," >> seven_namesakes/config/urls.py
	echo "	re_path('api/', include('api.urls'))" >> seven_namesakes/config/urls.py
	echo ']' >> seven_namesakes/config/urls.py

  arr1=()
	lc_mf_count=0

	#created_urls_list=0
	if [ "$created_urls_list" -lt 1 ]
	then
		echo "urlpatterns = [" >> seven_namesakes/urls_one_list.py
		created_urls_list=1
	fi


	for file in dir[1-99]; do
		# more +number5 dir2
		let lc_mf_count=lc_mf_count+1

	arr1+=( $(head -n $countforfields $file) )

		wc -l $file | awk '{print $1}' | cat > lc_mf$lc_mf_count
		while read -r line; do set $line; mf1=$(echo $1); done < lc_mf$lc_mf_count
		let mf1_plus=mf1+1

		while [ "$countforfields" -le "$mf1" ]
		do
			if [ "$countforfields" -lt 2 ]
			then
				head -n $countforfields $file | cat >> m1_file
				while read -r line; do set $line; m1=$(echo $1); done < m1_file
				outputline="class ${m1}(models.Model):"
				echo $outputline >> seven_namesakes/models.py
				echo "from .views import ${m1}View" >> seven_namesakes/urls.py

				echo "" >> seven_namesakes/views.py
				echo "from .models import ${m1}" >> seven_namesakes/views.py
				echo "from .serializers import ${m1}Serializer" >> seven_namesakes/views.py

				echo "class ${m1}View(APIView):" >> seven_namesakes/views.py
				echo "	def get(self, request, format=None):" >> seven_namesakes/views.py
				echo "		${m1,,} = ${m1}.objects.all()" >> seven_namesakes/views.py
				echo "		serializer = ${m1}Serializer(${m1,,}, many=True)" >> seven_namesakes/views.py
				echo "		return Response(serializer.data)" >> seven_namesakes/views.py

				echo "	def post(self, request, format=None):" >> seven_namesakes/views.py
				echo "		serializer = ${m1}Serializer(data=request.data)" >> seven_namesakes/views.py
				echo "		if serializer.is_valid():" >> seven_namesakes/views.py
				echo "			serializer.save()" >> seven_namesakes/views.py
				echo "			return Response(serializer.data, status=status.HTTP_201_CREATED)" >> seven_namesakes/views.py
				echo "		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)" >> seven_namesakes/views.py



				# working on tests.py now:
				echo "from .models import ${m1}" >> seven_namesakes/tests.py
				echo "from .serializers import ${m1}Serializer" >> seven_namesakes/tests.py

				let tests_m_count=tests_m_count+1
				echo "class BaseViewTest${tests_m_count}(APITestCase):" >> seven_namesakes/tests_m$tests_m_count
				echo "	client = APIClient()" >> seven_namesakes/tests_m$tests_m_count
				echo "	@staticmethod" >> seven_namesakes/tests_m$tests_m_count
				#echo "	def create${m1,,}(" >> seven_namesakes/func_def_tests_m$tests_m_count






				# url_pat2="View.as_view(), name=\"user-all\""

				# most recent changes to urlpatterns:
				#echo "urlpatterns = [" >> seven_namesakes/urls.py
				#echo "	path('${m1,,}/', ${m1}View.as_view(), name=\"${m1,,}-all\")," >> seven_namesakes/urls.py
				#echo "]" >> seven_namesakes/urls.py
				#echo "" >> seven_namesakes/urls.py

				#echo "urlpatterns = [" >> seven_namesakes/urls_one_list.py
				echo "	path('${m1,,}/', ${m1}View.as_view(), name=\"${m1,,}-all\")," >> seven_namesakes/urls_one_list.py
				# echo "]" >> seven_namesakes/urls_one_list.py
				#echo "" >> seven_namesakes/urls_one_list.py


				echo "" >> seven_namesakes/serializers.py

				echo "from .models import ${m1}" >> seven_namesakes/serializers.py

				echo "class ${m1}Serializer(serializers.ModelSerializer):" >> seven_namesakes/serializers.py
				echo "	class Meta:" >> seven_namesakes/serializers.py
				echo "		model = ${m1}" >> seven_namesakes/serializers.py
				# now we get admin.py done:
				if [ "$a2_pt2" == "zzz" ]
				then
					m_all="from .models import ${m1}"
					a2_pt2=""

				else
					m_all="${m_all}, ${m1}"
				fi
				if [ "$countforfields" -lt 2 ]
				# if [ "$a2_pt2" == "xxx" ]
				then
					a2_pt2="${m1}"
					echo $a2_pt2 >> a2_pt2_file
				fi

			else
				head -n $countforfields $file | cat > f1_file
				while read -r line; do set $line; f1=$(echo $1); done < f1_file


				if [ "$countforfields" -lt 3 ]
				then
					placeholder_s="${placeholder_s}self.${f1}"
				else
					sense_of_self="${sense_of_self}, self.${f1}"
				fi


				# $break_up_code_for_debugging=''
		# dir_b="dir_b"
		# echo 'we use these user inputs to break up the code for debugging purposes:'
		# read break_up_code_for_debugging





		outputline="${f1} = models.CharField(max_length=255, null=False)"


				echo "	${outputline}" >> seven_namesakes/models.py

				let s2_field_count=$s2_field_count+1
				if [ "$s2_field_count" -ge "$mf1" ]
				then
					s_outputline="\"${f1}\""
				else
					s_outputline="\"${f1}\", "
				fi

				# while read -r line; do set $line; serializers_fields=$serializers_fields$s_outputline; done < f1_file
				serializers_fields=$serializers_fields$s_outputline
				echo "------------------------------------------------------------------"
				echo "------------------------------------------------------------------"
				echo "for debug purposes: f1 at this moment is: ${f1}"
				echo "...and s_outputline is: ${s_outputline}"
				echo "...and serializers_fields is: ${serializers_fields}"
				echo "...and number of fields plus model is: ${mf1}"
				echo "------------------------------------------------------------------"
				echo "------------------------------------------------------------------"

				outputline=""
				f1=""
			fi
			let countforfields=countforfields+1
		done

		serializers_fields="${serializers_fields})"
		echo ""
		echo "--------------------------------"
		echo "		${serializers_fields}" >> seven_namesakes/serializers.py
		echo "--------------------------------"
		echo ""
		sense_of_self="${sense_of_self})"
		sense_of_self=$placeholder_s$sense_of_self
		echo "	def __str__(self):" >> seven_namesakes/models.py
		echo "	${sense_of_self}" >> seven_namesakes/models.py
		countforfields=1
		serializers_fields="fields = ("
		sense_of_self=""
		s2_field_count=1
		placeholder_s='	return "{} - {}".format('

	done

	# admin.py get imported models once assembled:
	echo $m_all >> seven_namesakes/admin.py

	echo a2_pt2_file just prior to very end where seven_namesakes/admin.py gets finished:
	cat a2_pt2_file
	echo ...seven_namesakes/admin.py on the other hand just prior to while loop ending looks like this:
	cat seven_namesakes/admin.py
	echo ...a1 on the other hand just prior to while loop ending looks like this:
	echo $a1

	w_count=0
	while read -r line
	do
		if [ "$w_count" -lt 1 ]
		then
			echo ""
		else
			set $line
			a1="admin.site.register($1)"
			echo $a1 >> seven_namesakes/admin.py
			echo "a1 is $1"
		fi
		let w_count=w_count+1
	done < a2_pt2_file

# ------------------- END OF .CSV INPUT INTO 7 PYTHON MODULES UPON USER PROMPTS -------------------
fi




echo "" >> seven_namesakes/urls.py




#echo "	path('${m1,,}/', ${m1}View.as_view(), name=\"${m1,,}-all\")," >> seven_namesakes/urls_one_list.py
echo "]" >> seven_namesakes/urls_one_list.py

# cat seven_namesakes/urls_one_list.py >> urls.py

head -n 99 seven_namesakes/urls_one_list.py | cat >> seven_namesakes/urls.py




















echo "

# autumn venusaur makeover:

# here is our newest gif url source--first front gif:
# http://www.pokestadium.com/sprites/xy/cubone.gif

# ...then back gif:
# http://www.pokestadium.com/sprites/xy/back/cubone.gif

# HOW TO USE:
# just enter this terminal command to use this python code:
#  python stripped_down_autumn_makeover5.py
# --for us, 'python' just defaults to python3.6 rather than 3.7
# ...which is what we want here-- also, don't use the usual virtual
# environment here either-- it won't work.

import math
# abs(-9) = 9

import random

import numpy as np
from skimage import io
import imageio
import matplotlib.pyplot as plt

# ===========================================

import numpy
import scipy
from scipy import misc
import matplotlib.pyplot as plt
from scipy import ndimage
import numpy as np
from glob import glob

# ===========================================

#from scipy.misc import imsave
import scipy.misc

# ===========================================

import os
import imageio

os.system('rm -r poke_id_gif_fr')
os.system('rm -r *saur_gif_fr/')
os.system('rm -r poke_id*')
os.system('rm -r *_gif_fr')

os.system('rm -r frame*.png')
os.system('rm -r *_gif_fr')


# ===================================================================
# now to turn created png into combined gif:



def fin_gif_out(a1_in_in_pokemon, png_dir_in, file_name_list_in, images_in, gif_name_out):
    for file_name in file_name_list_in:
        if file_name.endswith('.png'):
            file_path = os.path.join(png_dir_in, file_name)
            images_in.append(imageio.imread(file_path))
    print('\n\nHere is imageio.mimsave: '+str('./' + str(a1_in_in_pokemon) + '_gif_fr/' + 'output_' + str(a1_in_in_pokemon) + str(gif_name_out) + '2.gif'))
    imageio.mimsave('./' + str(a1_in_in_pokemon) + '_gif_fr/' + 'output_' + str(a1_in_in_pokemon) + str(gif_name_out) + '2.gif',images_in,fps=25)
    #imageio.mimsave('./' + str(a1_in_in_pokemon) + '_gif_fr/' + 'output_' + str(a1_in_in_pokemon) + str(file_name_list_in[0][:16]) + '2.gif',images_in,fps=25)
    #print('our new file is named using ' + str(file_name_list_in[0][:16]) + str(a1_in_in_pokemon) + '_gif_fr/' + 'output_' + str(a1_in_in_pokemon) + str(file_name_list_in[0][:16]) + '2.gif')
    return images_in

# gif_from_png_autumn

def fin_gif_out_even(a1_in_in_pokemon, png_dir_in, file_name_list_in, images_in, gif_name_out):
    for count_file_elem, file_name in enumerate(file_name_list_in):
        if file_name.endswith('.png'):
            if(count_file_elem % 2 == 0):
                file_path = os.path.join(png_dir_in, file_name)
                images_in.append(imageio.imread(file_path))
    print('\n\nHere is imageio.mimsave: '+str('./' + str(a1_in_in_pokemon) + '_gif_fr/' + 'output_' + str(a1_in_in_pokemon) + str(gif_name_out) + '2.gif'))
    imageio.mimsave('./' + str(a1_in_in_pokemon) + '_gif_fr/' + 'output_' + str(a1_in_in_pokemon) + str(gif_name_out) + '2.gif',images_in,fps=35)
    #imageio.mimsave('./' + str(a1_in_in_pokemon) + '_gif_fr/' + 'output_' + str(a1_in_in_pokemon) + str(file_name_list_in[0][:16]) + '2.gif',images_in,fps=25)
    #print('our new file is named using ' + str(file_name_list_in[0][:16]) + str(a1_in_in_pokemon) + '_gif_fr/' + 'output_' + str(a1_in_in_pokemon) + str(file_name_list_in[0][:16]) + '2.gif')
    return images_in

# ========================================================================

p_list_all_grass = ['Leafeon', 'Bulbasaur', 'Ivysaur', 'Venusaur', 'Oddish', 'Gloom', 'Vileplume', 'Paras', 'Parasect', 'Bellsprout', 'Weepinbell', 'Victreebel', 'Exeggcute', 'Exeggutor', 'Tangela', 'Chikorita', 'Bayleef', 'Meganium', 'Bellossom', 'Hoppip', 'Skiploom', 'Jumpluff', 'Sunkern', 'Sunflora', 'Celebi', 'back/Leafeon', 'back/Bulbasaur', 'back/Ivysaur', 'back/Venusaur', 'back/Oddish', 'back/Gloom', 'back/Vileplume', 'back/Paras', 'back/Parasect', 'back/Bellsprout', 'back/Weepinbell', 'back/Victreebel', 'back/Exeggcute', 'back/Exeggutor', 'back/Tangela', 'back/Chikorita', 'back/Bayleef', 'back/Meganium', 'back/Bellossom', 'back/Hoppip', 'back/Skiploom', 'back/Jumpluff', 'back/Sunkern', 'back/Sunflora', 'back/Celebi']

p_list_all_grass = ['Leafeon', 'Bulbasaur', 'Ivysaur', 'Venusaur', 'Oddish', 'Gloom', 'Vileplume', 'back/Leafeon', 'back/Bulbasaur', 'back/Ivysaur', 'back/Venusaur', 'back/Oddish', 'back/Gloom', 'back/Vileplume']

#p_list_all_grass = ['Leafeon']

e_type_list = ['mareep', 'zapdos', 'emolga', 'joltik', 'back/mareep', 'back/zapdos', 'back/emolga', 'back/joltik']

too_normal = ['eevee','snorlax','ditto','jigglypuff','meowth','slaking','lopunny']
too_normal = ['meowth']
# grass:
r_mutation_vector_grass = (2/3)
r2_mutation_vector_grass = (1/2)
g_mutation_vector_grass = (1/4)
b_mutation_vector_grass = (1/4)

# electric:
r_gamma_e_type = -(3/4)
r2_gamma_e_type = -(1/2)
g_gamma_e_type = (95/100)
b_gamma_e_type = (7/8)

# best source of gifs currently-- is NOW THIS INSTEAD:
# http://www.pokestadium.com/sprites/xy/cubone.gif
p_list_to_change=[]
a1_poke_id = 'venonat'
p_reply = a1_poke_id
a1_poke_id = str(p_reply)
p_type_choice = 'g'

print('type abbreviations are: ')
print('n = normal, g = grass, e = electric ')

a1_poke_id = input('enter a single pokemon name OR enter a type abbreviation FROM CHOICES ABOVE to alter multiple individuals of that type at once: ')
p_type_choice = a1_poke_id
if(a1_poke_id == 'g'):
    p_list_to_change = p_list_all_grass

    r_factor = r_mutation_vector_grass
    r2_factor = r2_mutation_vector_grass
    g_factor = g_mutation_vector_grass
    b_factor = b_mutation_vector_grass

    r_grass_buffer = -35
    b_grass_buffer = -45
    r_buff = r_grass_buffer
    b_buff = b_grass_buffer

elif(a1_poke_id == 'e'):
    p_list_to_change = e_type_list

    r_factor = r_gamma_e_type
    r2_factor = r2_gamma_e_type
    g_factor = g_gamma_e_type
    b_factor = b_gamma_e_type

    r_e_type_buffer = 14
    b_e_type_buffer = -29
    r_buff = r_e_type_buffer
    b_buff = b_e_type_buffer
elif(a1_poke_id == 'n'):
    p_list_to_change = too_normal

else:
    #p_list_to_change.append(a1_poke_id)
    p_list_to_change = too_normal

import requests

# ==========================================================================
# ==========================================================================

# ==========================================================================

from PIL import Image, ImageSequence

for num_p_mon, p_mon_elem in enumerate(p_list_to_change):
    os.system(\"rm frame*.png\")

    print('STARTING NEW POKEMON ALTERATIONS NOW: ' + str(p_mon_elem))
    print('----------------------------------------------------------------\n')

    a1_poke_id = str(p_mon_elem).lower()
    p_reply = a1_poke_id
    poke_id = str(p_reply)
    # ==========================================================================
    image_url = 'http://www.pokestadium.com/sprites/xy/'+str(a1_poke_id)+'.gif'
    s2 = poke_id
    if (s2.count('/') == 1):
        a1_poke_id = 'Back' + str(a1_poke_id[( a1_poke_id.find('/') + 1 ):]).title()
        p_reply = a1_poke_id
        poke_id = str(p_reply)
#>>> if (s2.count('/') == 1):
#...     s1=s1[(s1.find('/') +1):]

    img_data = requests.get(image_url).content
    with open(str(a1_poke_id)+'.gif', 'wb') as handler:
        handler.write(img_data)

    a1 = io.imread(str(a1_poke_id)+'.gif')

    # ====================================================
    im=a1

    if(p_mon_elem.count('/') >= 1):
        renamed_file = str(p_mon_elem).replace('/',' ').title().replace(' ','')
    else:
        renamed_file = str(p_mon_elem).lower()
    im = Image.open( str(renamed_file) + \".gif\")

    index = 1
    for frame in ImageSequence.Iterator(im):
        frame.save(\"frame%d.png\" % index)
        index += 1
    # ====================================================

    a1 = io.imread('frame' + str(num_p_mon + 1)+'.png')

    #a1_frame_test=a1[7,:,:,:]
    a1_frame_test = io.imread('frame' + str(num_p_mon + 1)+'.png')

    #plt.imshow(a1_frame_test)
    #plt.show()

    a1 = io.imread(str(a1_poke_id)+'.gif')
    #r1=range(len(a1[:,:,:,0]))


    os.system(\"ls -l | grep 'frame' | wc -l > aaa_text.txt\")
    file_n='aaa_text.txt'
    file_n_o=open(file_n, 'r')

    frames_in_gif_num = 1

    for line in file_n_o:
        print(str(line))
        frames_in_gif_num = int(line)

    file_n_o.close()

    # this needs to change!!!  (len(a1[1]))/2 should be replaced with the length of the gif.... I guess Im just having trouble getting the correct length right now...
    r1=range(1, int( (len(a1[1]))/2.0 ) )
    r1=range(1, int(frames_in_gif_num - 2) )
    # thats why i divide by 2 there... its just a random number that will likely be small enough to not exceed the indices

    frame_file_list=[]
    poke_id = a1_poke_id
    os.system('mkdir ' + (str('poke_id') + str(poke_id)) + '_gif_fr')

    new_file_name=''
    images_anim = []

    for frame_elem in r1:

        #a1_frame_test=a1[frame_elem,:,:,:]
        a1_frame_test = io.imread('frame' + str(frame_elem)+'.png')

        a1 = io.imread(str(a1_poke_id)+'.gif')
        b2=a1_frame_test
        a2=b2
        a3 = a2

        if(p_type_choice == 'e'):
            # r is 30 higher than g and >100 higher than b

            a2 = b2[:,:,0] > b2[:,:,1] + 29
            a2_smooth = b2
            a2_smooth = b2[:,:,0] > b2[:,:,2] + 99
            booling2 = a2 & a2_smooth

            b2[:,:,0][booling2] = ( b2[:,:,0][booling2] + ( (b2[:,:,0][booling2]) ) * (r_gamma_e_type) )

            #b2[:,:,1][booling2] = ( b2[:,:,1][booling2] + ( 255 - (b2[:,:,1][booling2]) ) * (g_gamma_e_type) )
            b2[:,:,1][booling2] = ( b2[:,:,1][booling2] + ( 255 - (b2[:,:,1][booling2]) ) * (g_gamma_e_type) )

            b2[:,:,2][booling2] = ( b2[:,:,2][booling2] + ( 255 - (b2[:,:,2][booling2]) ) * (b_gamma_e_type) )
        elif(p_type_choice == 'g'):
            a2 = b2[:,:,0] < b2[:,:,1] + r_buff
            a2_smooth = b2
            a2_smooth = b2[:,:,2] < b2[:,:,1] + b_buff
            booling2 = a2 & a2_smooth

            b2[:,:,0][booling2] = b2[:,:,0][booling2] + (( 255 - b2[:,:,0][booling2] ) * (r_factor))

            a3 = b2[:,:,0] < b2[:,:,1] - 11
            a3_smooth = b2
            a3_smooth=b2[:,:,2] < b2[:,:,1] - 11
            booling3 = a3 & a3_smooth
            b2[:,:,0][booling3] = b2[:,:,0][booling3] + ( (255 - b2[:,:,0][booling3]) * (r2_factor) )

            b2[:,:,2][booling2] = ((b2[:,:,2][booling2]) * (b_factor))
            #b2[:,:,1][booling2] = (b2[:,:,1][booling2])/2
            b2[:,:,1][booling2] = b2[:,:,1][booling2] - ((b2[:,:,1][booling2]) * (g_factor))
        elif(p_type_choice == 'no'):
            # for normal types alter beige: r > b +20 and g > b+20
            a2 = b2[:,:,0] > b2[:,:,1] + 11
            a2_smooth = b2
            a2_smooth = b2[:,:,1] > b2[:,:,2] + 19

            a3_smooth = b2
            a3_smooth = b2[:,:,2] > 25

            a4_smooth = b2
            a4_smooth = b2[:,:,0] < 241

            a5_smooth = b2
            a5_smooth = b2[:,:,2] < 125

            booling2 = a2 & a2_smooth & a3_smooth & a4_smooth & a5_smooth
            b2[:,:,1][booling2] = b2[:,:,1][booling2] + (( 255 - b2[:,:,1][booling2] ) * (1/3))
            b2[:,:,0][booling2] = b2[:,:,0][booling2] - ( ( b2[:,:,0][booling2] ) * (1/5) )
        elif(p_type_choice == 'f'):
            # ----------------------------------------------------------------
            # ------------------ OJ fire and lightning bond_str and bond_len:
            a2 = b2[:,:,0] > b2[:,:,1] + 11
            a2_smooth = b2
            a2_smooth = b2[:,:,1] > b2[:,:,2] + 19

            a3_smooth = b2
            a3_smooth = b2[:,:,2] > 25

            a4_smooth = b2
            a4_smooth = b2[:,:,0] < 250

            a5_smooth = b2
            a5_smooth = b2[:,:,2] < 125

            booling2 = a2 & a2_smooth & a3_smooth & a4_smooth & a5_smooth
        elif(p_type_choice == 'n'):

            min_bond_len_rg = 0
            min_bond_len_rb = 2
            min_bond_len_gb = 0

            max_bond_len_rg = 20
            max_bond_len_rb = 25
            max_bond_len_gb = 45

            max0=253
            max1=245
            max2=227

            min0=52
            min1=52
            min2=52

            a01_min = min_bond_len_rg < abs(b2[:,:,0] - b2[:,:,1])
            a12_min = min_bond_len_gb < abs(b2[:,:,2] - b2[:,:,1])
            a02_min = min_bond_len_rb < abs(b2[:,:,2] - b2[:,:,0])

            # $$$$ ========================================================
            a01_max = max_bond_len_rg > abs(b2[:,:,0] - b2[:,:,1])
            a12_max = max_bond_len_gb > abs(b2[:,:,2] - b2[:,:,1])
            a02_max = max_bond_len_rb > abs(b2[:,:,2] - b2[:,:,0])
            # $$$$ ========================================================

            a_max2 = b2[:,:,2] < max2
            a_min2 = b2[:,:,2] > min2

            a_max0 = b2[:,:,0] < max0
            a_min0 = b2[:,:,0] > min0

            a_max1 = b2[:,:,1] < max1
            a_min1 = b2[:,:,1] > min1

            booling2 = a01_min & a02_min & a_max2 & a_min2 & a_max0 & a_min0 & a_max1 & a_min1 & a12_min & a01_max & (~a12_max) & (~a02_max)

            proportion_c_increase = 0.5
            b2[:,:,0][booling2] = b2[:,:,0][booling2] + ( -1 * ( ( b2[:,:,0][booling2] ) - 255 ) * proportion_c_increase )

            proportion_c_increase = -0.2
            b2[:,:,1][booling2] = b2[:,:,1][booling2] + ( -1 * (255 - ( b2[:,:,1][booling2] ) ) * proportion_c_increase )
        else:

            min_bond_len_rg = 0
            min_bond_len_rb = 2
            min_bond_len_gb = 0

            max_bond_len_rg = 20
            max_bond_len_rb = 25
            max_bond_len_gb = 45

            max0=253
            max1=245
            max2=227

            min0=52
            min1=52
            min2=52

            a01_min = min_bond_len_rg < abs(b2[:,:,0] - b2[:,:,1])
            a12_min = min_bond_len_gb < abs(b2[:,:,2] - b2[:,:,1])
            a02_min = min_bond_len_rb < abs(b2[:,:,2] - b2[:,:,0])

            # $$$$ ========================================================
            a01_max = max_bond_len_rg > abs(b2[:,:,0] - b2[:,:,1])
            a12_max = max_bond_len_gb > abs(b2[:,:,2] - b2[:,:,1])
            a02_max = max_bond_len_rb > abs(b2[:,:,2] - b2[:,:,0])
            # $$$$ ========================================================

            a_max2 = b2[:,:,2] < max2
            a_min2 = b2[:,:,2] > min2

            a_max0 = b2[:,:,0] < max0
            a_min0 = b2[:,:,0] > min0

            a_max1 = b2[:,:,1] < max1
            a_min1 = b2[:,:,1] > min1

            booling2 = a01_min & a02_min & a_max2 & a_min2 & a_max0 & a_min0 & a_max1 & a_min1 & a12_min & a01_max & (~a12_max) & (~a02_max)

            proportion_c_increase = 0.5
            b2[:,:,0][booling2] = b2[:,:,0][booling2] + ( -1 * ( ( b2[:,:,0][booling2] ) - 255 ) * proportion_c_increase )

            proportion_c_increase = -0.2
            b2[:,:,1][booling2] = b2[:,:,1][booling2] + ( -1 * (255 - ( b2[:,:,1][booling2] ) ) * proportion_c_increase )

        # =====================================================================
        # ========== finally-- removing the background we accidentally created:
        b2_black_bg_bool = (b2[:,:,0] > 120) & (b2[:,:,2] < 3 ) & (b2[:,:,1] < 3)

        a2 = b2

        a2_black = b2

        a2_black[:,:,0][b2_black_bg_bool] = 0

        a2 = a2_black

        #b2[:,:,0][booling2] = 255
        b2[:,:,2][booling2] = b2[:,:,2][booling2] - (b2[:,:,2][booling2] / 3)

        # =====================================================================
        # =====================================================================

        new_file_name='autumn_ivy_'+str(frame_elem)+'_makeover_'+str(a1_poke_id)+'.png'
        plt.imsave( str('./' + (str('poke_id') + str(poke_id)) + '_gif_fr' + '/' + new_file_name), b2)
        frame_file_list.append(new_file_name)

    images_anim2=images_anim
    images_anim2 = fin_gif_out_even((str('poke_id') + str(poke_id)), str('./' + (str('poke_id') + str(poke_id)) + '_gif_fr' + '/'), frame_file_list, images_anim, 're_combo_anim')
    # =========================================================================
    # =========================================================================

    os.system( str('cp ' + str('./' + ('poke_id' + str(poke_id)) + '_gif_fr' + '/' + 'output_poke_id' + str(poke_id) + 're_combo_anim2.gif')) + ' ' + './completed_color_change_animations/' + str(poke_id) + '_FALL_type3.gif')
    os.system( str('cp ' + str('./' + ('poke_id' + str(poke_id)) + '_gif_fr' + '/' + 'output_poke_id' + str(poke_id) + 're_combo_anim2.gif')) + ' ' + './completed_color_change_animations/' + str(poke_id) + '_FALL_type3.gif')
    os.system('gifsicle --flip-horizontal ' + 'completed_color_change_animations/' + str(poke_id) + '_FALL_type3.gif' + ' -o ' + 'completed_color_change_animations/' + str(poke_id) + 'flipped_FALL_type3.gif' )

    # transparent background creation:
    os.system('gifsicle -bII --transparent \"#000000\" completed_color_change_animations/' + str(renamed_file) + '*type3.gif')


os.system('rm -r frame*.png')
os.system('rm -r *_gif_fr')

#

" >> fixed_redder_grass1.py


















echo "




#from utils import date
import datetime

import random



fin_t=open('m1_file','r')
t_list=[]
for line in fin_t:
	t_list.append(str(line))
fin_t.close()


t2_list=[]
for t_elem in t_list:
	t2_list.append(t_elem.replace('\n',''))


t3_list=[]
for t_elem in t2_list:
	if(len(t_elem)>0):
		t3_list.append(t_elem)

t3_list_b=[]
#t3_list_b=t3_list

t4_list=[]

for stage_2_elem in t3_list:
	stage_2_s = stage_2_elem
	stage_3_s=''
	for c_elem_s, elem_s in enumerate(stage_2_s):
		if(elem_s.isupper()==True):
			if(c_elem_s != 0):
				stage_3_s=stage_3_s+'_'
				stage_3_s=stage_3_s+elem_s
			else:
				stage_3_s=stage_3_s+elem_s
		else:
			stage_3_s=stage_3_s+elem_s
	stage_3_s=stage_3_s.lower()
	t4_list.append(stage_3_s)

	fk_cap=stage_3_s
	fk_cap2 = fk_cap.replace('_',' ')
	fk_cap2=fk_cap2.title()
	fk_cap2=fk_cap2.replace(' ','')

	for other_elem in t4_list:
		t3_list_b.append(str(other_elem))

fout_t=open('m1_file_tests','w')
for line_t in t4_list:
	fout_t.write(str(line_t)+'\n')
fout_t.close()

p_reply=''

t4_list=[]
t4_list_c=[]
num_models_l1=list(range(1,8))




def_para=''
def_cond=''
ob_of_class_call=''
samp_data_tests=''
t_list_dir_b=[]
rand_samp_data=''

new_ob_c=''



single_tests_line=''

for m_elem in num_models_l1:

	##p_reply=input('break in the code_within_main_for_PRE_first_for')
	try:
		fin_t=open(str('dir' + str(m_elem)),'r')
		t_list=[]
		for line in fin_t:
			t_list.append(str(line))
		fin_t.close()


		fin_t=open(str('dir_b' + str(m_elem)),'r')
		t_list_dir_b=[]
		for line in fin_t:
			t_list_dir_b.append(str(line))
		fin_t.close()



		fin_t=open(str('dir' + str(m_elem)),'r')
		t_list=[]
		for line in fin_t:
			t_list.append(str(line))
		fin_t.close()



		print('dir' + str(m_elem) + ' file produces this list: ' +str(t_list))

		#p_reply=input('break in code after read to show what we grabbed above')

		t2_list=[]
		for t_elem in t_list:
			t2_list.append(t_elem.replace('\n',''))

		t3_list=[]
		for t_elem in t2_list:
			if(len(t_elem)>0):
				t3_list.append(t_elem)






		t2_list_dir_b=[]
		for t_elem in t_list_dir_b:
			t2_list_dir_b.append(t_elem.replace('\n',''))

		t3_list_dir_b=[]
		for t_elem in t2_list_dir_b:
			if(len(t_elem)>0):
				t3_list_dir_b.append(t_elem)







		##p_reply=input('break in the code_within_main_for_past second and third for')
		t4_list=[]
		for stage_2_elem in t3_list:
			##p_reply=input('break in the code-- within main for, within fourth for')

			stage_2_s = stage_2_elem
			stage_3_s=''
			for c_elem_s, elem_s in enumerate(stage_2_s):
				##p_reply=input('break in the code-- within main for, within fourth for, within first for')
				if(elem_s.isupper()==True):
					if(c_elem_s != 0):
						stage_3_s=stage_3_s+'_'
						stage_3_s=stage_3_s+elem_s
					else:
						stage_3_s=stage_3_s+elem_s
				else:
					stage_3_s=stage_3_s+elem_s
				stage_3_s=stage_3_s.lower()
			t4_list.append(stage_3_s)

			#p_reply=input('break in the code-- WITHIN fourth for-- at end-- enter s to show lists:')
			if(p_reply == 's'):
				print('t4_list is: '+str(t4_list))
				print('\n----------------------\n')
				print('t_list is: '+str(t_list))
				print('\n----------------------\n')
				print('t3_list is: '+str(t3_list))
				print('\n----------------------\n')
				print('\n----------------------\n')

			#p_reply=input('break in the code')


		##p_reply=input('break in the code-- past fourth for')
		for count_t4, t3_elem in enumerate(t4_list):
			#p_reply=input('break in the code-- within FIFTH for-- enter s to show lists:')
			if(p_reply == 's'):
				print('t3_list_b is: '+str(t3_list_b))
				print('t4_list is: '+str(t4_list))
				print('t4_list_c is: '+str(t4_list_c))
			if(count_t4 == 0):
				if(m_elem != 1):
					print('null statement')
					#def_para = str(def_para) + '):\n'
					#t4_list_c.append(str(def_para))
					#def_cond = str(def_cond) + ':\n'
					#t4_list_c.append(str(def_cond))

				def_para = str('	def create_' + str(t3_elem) + '(')
				def_cond = '		if('



				ob_of_class_call='			' + str(t3_elem.replace('_',''))

				ob_of_class_call = ob_of_class_call.title()
				ob_of_class_call = ob_of_class_call.replace('_', '')
				new_ob_c = t3_elem.title()
				new_ob_c = new_ob_c.replace('_', '')

				#ob_of_class_call='			' + str(new_ob_c)

				ob_of_class_call = '\n			#comment_placeholder\n\n			'

				ob_of_class_call = str(ob_of_class_call) + str(t3_list[0]) + '.objects.create('

				samp_data_tests='\n		self.create_'+ str(t3_elem) + '('

#			elif(count_t4 == (len(t4_list) - 1)):
#				if (m_elem == num_models_l1[-1]):
#					def_para = str(def_para) + '):\n'
#					t4_list_c.append(str(def_para))
#					def_cond = str(def_cond) + ':\n'
#					t4_list_c.append(str(def_cond))


			else:

				if(count_t4 != 1):
					def_cond = str(def_cond) + ' and '
					def_para = str(def_para) + ', '
					ob_of_class_call = str(ob_of_class_call) + ', '
					samp_data_tests = str(samp_data_tests) + ', '

				ob_of_class_call = str(ob_of_class_call) + str(t3_elem) + '=' + str(t3_elem)

				def_para = str(def_para) + str(t3_elem) + '=' + '\"\"'

				def_cond = str(def_cond) + str(t3_elem) + ' != ' + '\"\"'

				if(t3_list_dir_b[count_t4] == 'Char'):
					rand_samp_data = chr(random.randint(65,90))
					samp_data_tests = str(samp_data_tests) + '\"' + str(rand_samp_data) + '\"'
				elif(t3_list_dir_b[count_t4] == 'Integer'):
					rand_samp_data = int(random.randint(65,90))
					samp_data_tests = str(samp_data_tests) + str(rand_samp_data)
				elif(t3_list_dir_b[count_t4] == 'Float'):
					rand_samp_data = float(random.randint(65,90))
					samp_data_tests = str(samp_data_tests) + str(rand_samp_data)
				elif(t3_list_dir_b[count_t4] == 'Date'):
					rand_samp_data = str(datetime.date.today())
					samp_data_tests = str(samp_data_tests) + '\"' + str(rand_samp_data) + '\"'
				else:
					rand_samp_data = 'placeholder_for_Others'
					samp_data_tests = str(samp_data_tests) + '\"' + str(rand_samp_data) + '\"'
				# t4_list_c.append(str('field:' + str(t3_elem) + ''))

		##p_reply=input('break in the code-- past fifth for')


		if(def_cond != '		if '):
			def_para = str(def_para) + '):\n'
			t4_list_c.append(str(def_para))
			def_cond = str(def_cond) + '):\n'
			t4_list_c.append(str(def_cond))

			ob_of_class_call = str(ob_of_class_call) + ')'
			t4_list_c.append('				' + str(ob_of_class_call))

			t4_list_c.append( str('\n	def setUp(self):') )

			samp_data_tests = str(samp_data_tests) + ')\n'
			t4_list_c.append(str(samp_data_tests))

			single_tests_line = '\nclass GetAll' + str((t3_list[0])) + 'Test(BaseViewTest' + str(m_elem) + '):\n'
			single_tests_line = single_tests_line.replace('_', '')
			t4_list_c.append( str(single_tests_line) )

			single_tests_line = '\n	def test_get_all_' + str(t3_list[0]) + '(self):\n'
			t4_list_c.append( str(single_tests_line) )

			single_tests_line = '\n		response = self.client.get(' + '\n'
			single_tests_line = str(single_tests_line) + '			reverse(\"' + (str((t3_list[0]).lower())).replace('_','') + '-all\"' + ')\n'
			single_tests_line = str(single_tests_line) + '		)\n'
			t4_list_c.append( str(single_tests_line) )

			single_tests_line = '		expected = ' + str(t3_list[0]) + '.objects.all()\n'
			single_tests_line = single_tests_line.replace('_', '')
			single_tests_line = str(single_tests_line) + '		serialized = ' + str(t3_list[0]) + 'Serializer(expected, many=True)\n'
			single_tests_line = str(single_tests_line) + '		self.assertEqual(response.data, serialized.data)\n'
			single_tests_line = str(single_tests_line) + '\n		self.assertEqual(response.status_code, status.HTTP_200_OK)\n'
			t4_list_c.append( str(single_tests_line) )



		fout_t=open(str('m1_file_tests' + str(m_elem)),'w')
		for line_t in t4_list_c:
			fout_t.write(str(line_t))
		fout_t.close()

		t4_list_c = []

		##p_reply=input('break in the code-- past sixth for-- about to restart MAIN for loop')

	except:
		print('...fewer than '+str(m_elem)+ ' models produced.')



















" > testing_test_maker.py






python3 testing_test_maker.py
































echo "----------------------------------------------"
echo "----------------------------------------------"
echo ">>>>>>>> STEP 1 OF 2 IS NOW COMPLETE! <<<<<<<<"
echo "----------------------------------------------"
echo "----------------------------------------------"

echo "to finish the setup of this API, use the following terminal commands: "
echo "cd api_auto_xxx"
echo "...followed by:"
echo "./finish_my_api"

echo "...and in a few moments your API will be finished!"



# head -n $countforfields $file
