    # after entering:
    # import red_grass_mo
    # ...into idle you can create a turtle object and then make it move randomly
    # in the following way:
    # enter the following line of code to start the program:
    # ...after making sure to enter this: ob1 = red_grass_mo.RedT1()
    # ...then enter this one line:
    # y = ob1.turtlesetup()
    # ...or something like this: func = ob1.turtlesetup()

    # ...followed by something like this:
    # ob1.moveturtle( func[0], func[1] )
# ...and boom!  The turtle moves!!! yay!

def poke_mutate(poke_input_name, poke_input_type):

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
    import requests
    from PIL import Image, ImageSequence

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
    a1_poke_id = str(poke_input_name)
    p_list_to_change.append(a1_poke_id)

    p_reply = a1_poke_id
    a1_poke_id = str(p_reply)

    if(poke_input_type == 'grass'):
        p_type_choice = 'g'
    elif(poke_input_type == 'electric'):
        p_type_choice = 'e'
    elif(poke_input_type == 'normal'):
        p_type_choice = 'n'

    a1_poke_id = p_type_choice
    p_type_choice = a1_poke_id

    #print('type abbreviations are: ')
    #print('n = normal, g = grass, e = electric ')
    #a1_poke_id = input('enter a single pokemon name OR enter a type abbreviation FROM CHOICES ABOVE to alter multiple individuals of that type at once: ')

    if(a1_poke_id == 'g'):
        #p_list_to_change = p_list_all_grass

        r_factor = r_mutation_vector_grass
        r2_factor = r2_mutation_vector_grass
        g_factor = g_mutation_vector_grass
        b_factor = b_mutation_vector_grass

        r_grass_buffer = -35
        b_grass_buffer = -45
        r_buff = r_grass_buffer
        b_buff = b_grass_buffer

    elif(a1_poke_id == 'e'):
        #p_list_to_change = e_type_list

        r_factor = r_gamma_e_type
        r2_factor = r2_gamma_e_type
        g_factor = g_gamma_e_type
        b_factor = b_gamma_e_type

        r_e_type_buffer = 14
        b_e_type_buffer = -29
        r_buff = r_e_type_buffer
        b_buff = b_e_type_buffer
    elif(a1_poke_id == 'n'):
        print('normal')
        #p_list_to_change = too_normal

    for num_p_mon, p_mon_elem in enumerate(p_list_to_change):
        os.system("rm frame*.png")

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
        im = Image.open( str(renamed_file) + ".gif")

        index = 1
        for frame in ImageSequence.Iterator(im):
            frame.save("frame%d.png" % index)
            index += 1
        # ====================================================

        a1 = io.imread('frame' + str(num_p_mon + 1)+'.png')

        #a1_frame_test=a1[7,:,:,:]
        a1_frame_test = io.imread('frame' + str(num_p_mon + 1)+'.png')

        #plt.imshow(a1_frame_test)
        #plt.show()

        a1 = io.imread(str(a1_poke_id)+'.gif')
        #r1=range(len(a1[:,:,:,0]))


        os.system("ls -l | grep 'frame' | wc -l > aaa_text.txt")
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
        os.system('gifsicle -bII --transparent "#000000" completed_color_change_animations/' + str(renamed_file) + '*type3.gif')


    os.system('rm -r frame*.png')

    os.system('rm -r *_gif_fr')

    #
# =========================================================================
p_reply4=''
p_reply3=''
p_reply2=''

# for testing purposes:
#p_reply2=input('enter pokemon name: ')
#p_reply3=input('enter g, n, or e for grass, normal, or electric: ')
#p_reply4=''

if(p_reply3 == 'g'):
    p_reply4 = 'grass'
elif(p_reply3 == 'e'):
    p_reply4 = 'electric'
elif(p_reply3 == 'n'):
    p_reply4 = 'normal'

#poke_mutate(p_reply2, p_reply4)
# =========================================================================

#
