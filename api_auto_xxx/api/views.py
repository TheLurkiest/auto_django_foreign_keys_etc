from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status





from django.shortcuts import render
from django.conf import settings
import requests
from github import Github, GithubException

import json



def small_pokedex(request):


    # context data given-- creating dictionary-- with values

    search_result = {}
    if 'poke_name' in request.GET:
        poke_name = request.GET['poke_name']

        url = 'https://pokeapi.co/api/v2/pokemon/%s' % poke_name

        response = requests.get(url)
        search_was_successful = (response.status_code == 200)  # 200 = SUCCESS
        search_result = response.json()

        r = requests.get(url)
        if(r.ok):
            repoItem = json.loads(r.text or r.content)

            search_result['last_search'] = str(poke_name)
            print('\n---===========---\nLast Search was: ' + str(search_result['last_search']))

    print('search_result is ' + str(search_result))


    return render(request, 'api/small_pokedex.html', {'search_result': search_result})











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
