from django.urls import path
from .views import FarmerIdView
from .views import CultivarGroupView
from .views import PlotOfLandView
from .views import SingleMoundView
from .views import DogView

from . import views

urlpatterns = [
	path('farmerid/', FarmerIdView.as_view(), name="farmerid-all"),
	path('cultivargroup/', CultivarGroupView.as_view(), name="cultivargroup-all"),
	path('plotofland/', PlotOfLandView.as_view(), name="plotofland-all"),
	path('singlemound/', SingleMoundView.as_view(), name="singlemound-all"),
	path('dog/', DogView.as_view(), name="dog-all"),
    path('small_pokedex/', views.small_pokedex, name='small_pokedex'),
]
