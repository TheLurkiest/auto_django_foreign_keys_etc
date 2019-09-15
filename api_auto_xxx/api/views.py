from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status





from django.shortcuts import render
from django.conf import settings
import requests
from github import Github, GithubException

import json

import objectpath

from skimage import io
import imageio

import os

def small_pokedex(request):
    # context data given-- creating dictionary-- with values
    search_result = {}
    if 'poke_name' in request.GET:
        poke_name = request.GET['poke_name']

        url = 'https://pokeapi.co/api/v2/pokemon/%s' % poke_name

        response = requests.get(url)
        search_was_successful = (response.status_code == 200)
        search_result = response.json()

        r = requests.get(url)
        if(r.ok):
            repoItem = json.loads(r.text or r.content)

            print( '\n---====================================---\n\n')
            print( '\n---====================================---\n\n')
            print( '\n---====================================---\n\n')

            l1=list(range(6))
            d1={}

            len_moves=range(0, ( len(repoItem['moves']) - 1 ) )

            d1['name']=repoItem['name']
            d1['id']=repoItem['id']
            d1['height']=repoItem['height']
            d1['weight']=repoItem['weight']
            d1['base_experience']=repoItem['base_experience']

            l2 = []

            for l_elem in l1:
                repo_stat0 = str(repoItem['stats'][l_elem]['stat']['name']).replace('-', '')
                repo_stat0_num = str(repoItem['stats'][l_elem]['base_stat'])
                d1[str(repo_stat0)] = str(repo_stat0_num)
                l2.append([str(repo_stat0).replace('-',''), repo_stat0_num])


            d1['moves']=[]
            # d2['everywhere']['fleas']=453


            for l_mo_elem in len_moves:
                repo_move1 = str(repoItem['moves'][l_mo_elem]['move']['name'])
                repo_move1_lvl = str(repoItem['moves'][l_mo_elem]['version_group_details'][0]['level_learned_at'])
#                d1[str(repo_move1)] = str(repo_move1_lvl)
                #d1['moves'][str(repo_move1)]=str(repo_move1_lvl)

                d1['moves'].append([str(repo_move1), int(repo_move1_lvl)])


            #search_result_type_data_s = str(search_result['types'][0]['type']['name'])

            d1['type1'] = str(search_result['types'][0]['type']['name'])
            l2.append(['type1', str(search_result['types'][0]['type']['name'])])
            if(len(search_result['types']) >= 2):
                d1['type2'] = str(search_result['types'][1]['type']['name'])
                l2.append(['type2', str(search_result['types'][1]['type']['name'])])
            else:
                d1['type2'] = 'none'
                l2.append(['type2', 'none'])

            #print( '\nThe repoItem dictionary type info is: \n\n' + str(repoItem['types'][0]['type']['name']))
            #print( '\nThe repoItem dictionary type info is: \n\n' + str(repo_item_type_data) )

            #print( '\nThe repoItem dictionary type_d info is: \n\n' + str(repo_item_type_data_d) )

            #print( '\nThe search_result_type_data_s info is: \n\n' + str(search_result_type_data_s) )
            print( '\nd1 is: \n\n' + str(d1) )
            #print( '\nstats for d1 are: \n\n' + str(d1['name']) )

            print( '\n---====================================---\n\n')
            print( '\n---====================================---\n\n')

            print( '\nl2 is: \n\n' + str(l2) )


            print( '\n---====================================---\n\n')
            print( '\n---====================================---\n\n')

            #with open(str(poke_name) + '_dict_repo.json', 'wb') as handler:
            #    handler.write(repoItem)
            #handler.close()

            search_result['last_search'] = str(poke_name)
#            print('\n---===========---\nLast Search was: ' + str(search_result['last_search']))
#    print('search_result is ' + str(search_result))

#    data1 = requests.get(url).content

#    with open(str(poke_name) + '_dict.json', 'wb') as handler:
#        handler.write(data1)
#    handler.close()
    #a1 = io.imread(str(poke_name)+'_dict.json')
    #print( '\n---====================================---\n\na1 is: ' + str(a1) )
    # =========================================================
#    with open(str(poke_name)+'_dict.json') as data1:
#        data2 = json.load(data1)
#    a2 = io.imread(str(poke_name)+'_dict.json')
    #print( '\n---====================================---\n\na2 is: ' + str(a2) )
    # =========================================================

    #jsonnn_tree = objectpath.Tree(data['types']['type'])
    #result_tuple = tuple(jsonnn_tree.execute('$..type'))
    print( '\n---====================================---\n\n')
    print( '\n---====================================---\n\n')
    print( '\n---====================================---\n\n')
    print( '\n---====================================---\n\n')

#    print( '\n---====================================---\n\nFINAL RESULT-- TYPE INFO IS: ' + str(result_tuple) )
    # =========================================================

    #return render(request, 'api/small_pokedex.html', {'search_result': search_result}, {'search_result2': repo_item_type_data})
    #return render(request, 'api/small_pokedex.html', {'search_result': search_result_type_data_s})
    return render(request, 'api/small_pokedex.html', {'search_result': d1})


from .models import FarmerId
from .serializers import FarmerIdSerializer
class FarmerIdView(APIView):
	def get(self, request, format=None):
		farmerid = FarmerId.objects.all()
		serializer = FarmerIdSerializer(farmerid, many=True)
		return Response(serializer.data)
	def post(self, request, format=None):
		serializer = FarmerIdSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

from .models import CultivarGroup
from .serializers import CultivarGroupSerializer
class CultivarGroupView(APIView):
	def get(self, request, format=None):
		cultivargroup = CultivarGroup.objects.all()
		serializer = CultivarGroupSerializer(cultivargroup, many=True)
		return Response(serializer.data)
	def post(self, request, format=None):
		serializer = CultivarGroupSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

from .models import PlotOfLand
from .serializers import PlotOfLandSerializer
class PlotOfLandView(APIView):
	def get(self, request, format=None):
		plotofland = PlotOfLand.objects.all()
		serializer = PlotOfLandSerializer(plotofland, many=True)
		return Response(serializer.data)
	def post(self, request, format=None):
		serializer = PlotOfLandSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

from .models import SingleMound
from .serializers import SingleMoundSerializer
class SingleMoundView(APIView):
	def get(self, request, format=None):
		singlemound = SingleMound.objects.all()
		serializer = SingleMoundSerializer(singlemound, many=True)
		return Response(serializer.data)
	def post(self, request, format=None):
		serializer = SingleMoundSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

from .models import Dog
from .serializers import DogSerializer
class DogView(APIView):
	def get(self, request, format=None):
		dog = Dog.objects.all()
		serializer = DogSerializer(dog, many=True)
		return Response(serializer.data)
	def post(self, request, format=None):
		serializer = DogSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
