import unittest
from django.test import TestCase
from django.test import Client
from django.urls import reverse
from rest_framework.test import APITestCase, APIClient
from rest_framework.views import status
from .models import FarmerId
from .serializers import FarmerIdSerializer
from .models import CultivarGroup
from .serializers import CultivarGroupSerializer
from .models import PlotOfLand
from .serializers import PlotOfLandSerializer
from .models import SingleMound
from .serializers import SingleMoundSerializer
from .models import Dog
from .serializers import DogSerializer
class BaseViewTest1(APITestCase):
	client = APIClient()
	@staticmethod
	def create_farmer_id(user_id="", first_name="", last_name="", email="", phone_number=""):
		if(user_id != "" and first_name != "" and last_name != "" and email != "" and phone_number != ""):
				
			#comment_placeholder

			FarmerId.objects.create(user_id=user_id, first_name=first_name, last_name=last_name, email=email, phone_number=phone_number)
	def setUp(self):
		self.create_farmer_id("I", "S", "A", "Z", "V")

class GetAllFarmerIdTest(BaseViewTest1):

	def test_get_all_FarmerId(self):

		response = self.client.get(
			reverse("farmerid-all")
		)
		expected = FarmerId.objects.all()
		serialized = FarmerIdSerializer(expected, many=True)
		self.assertEqual(response.data, serialized.data)

		self.assertEqual(response.status_code, status.HTTP_200_OK)
class BaseViewTest2(APITestCase):
	client = APIClient()
	@staticmethod
	def create_cultivar_group(tswv_resistance="", yield_lbs_per_acre="", days_to_mature="", desired_ca="", white_mold_resistance="", cbr_resistance="", limb_rot_resistance=""):
		if(tswv_resistance != "" and yield_lbs_per_acre != "" and days_to_mature != "" and desired_ca != "" and white_mold_resistance != "" and cbr_resistance != "" and limb_rot_resistance != ""):
				
			#comment_placeholder

			CultivarGroup.objects.create(tswv_resistance=tswv_resistance, yield_lbs_per_acre=yield_lbs_per_acre, days_to_mature=days_to_mature, desired_ca=desired_ca, white_mold_resistance=white_mold_resistance, cbr_resistance=cbr_resistance, limb_rot_resistance=limb_rot_resistance)
	def setUp(self):
		self.create_cultivar_group("placeholder_for_Others", 85.0, 90, 66.0, "placeholder_for_Others", "placeholder_for_Others", "placeholder_for_Others")

class GetAllCultivarGroupTest(BaseViewTest2):

	def test_get_all_CultivarGroup(self):

		response = self.client.get(
			reverse("cultivargroup-all")
		)
		expected = CultivarGroup.objects.all()
		serialized = CultivarGroupSerializer(expected, many=True)
		self.assertEqual(response.data, serialized.data)

		self.assertEqual(response.status_code, status.HTTP_200_OK)
class BaseViewTest3(APITestCase):
	client = APIClient()
	@staticmethod
	def create_plot_of_land(farmer_id="", num_columns_full="", approx_gps="", num_rows_full="", x_dist_between_mounds="", y_dist_between_mounds="", diameter_mounds="", peanuts_seeds_per_mound=""):
		if(farmer_id != "" and num_columns_full != "" and approx_gps != "" and num_rows_full != "" and x_dist_between_mounds != "" and y_dist_between_mounds != "" and diameter_mounds != "" and peanuts_seeds_per_mound != ""):
				
			#comment_placeholder

			PlotOfLand.objects.create(farmer_id=farmer_id, num_columns_full=num_columns_full, approx_gps=approx_gps, num_rows_full=num_rows_full, x_dist_between_mounds=x_dist_between_mounds, y_dist_between_mounds=y_dist_between_mounds, diameter_mounds=diameter_mounds, peanuts_seeds_per_mound=peanuts_seeds_per_mound)
	def setUp(self):
		self.create_plot_of_land("placeholder_for_Others", 79, "G", 86, 83.0, 85.0, 87.0, 77)

class GetAllPlotOfLandTest(BaseViewTest3):

	def test_get_all_PlotOfLand(self):

		response = self.client.get(
			reverse("plotofland-all")
		)
		expected = PlotOfLand.objects.all()
		serialized = PlotOfLandSerializer(expected, many=True)
		self.assertEqual(response.data, serialized.data)

		self.assertEqual(response.status_code, status.HTTP_200_OK)
class BaseViewTest4(APITestCase):
	client = APIClient()
	@staticmethod
	def create_single_mound(plot_of_land="", x_coord_in_plot="", y_coord_in_plot="", days_since_h2o_input="", last_h2o_input_amt=""):
		if(plot_of_land != "" and x_coord_in_plot != "" and y_coord_in_plot != "" and days_since_h2o_input != "" and last_h2o_input_amt != ""):
				
			#comment_placeholder

			SingleMound.objects.create(plot_of_land=plot_of_land, x_coord_in_plot=x_coord_in_plot, y_coord_in_plot=y_coord_in_plot, days_since_h2o_input=days_since_h2o_input, last_h2o_input_amt=last_h2o_input_amt)
	def setUp(self):
		self.create_single_mound("placeholder_for_Others", 77, 72, 68, 84.0)

class GetAllSingleMoundTest(BaseViewTest4):

	def test_get_all_SingleMound(self):

		response = self.client.get(
			reverse("singlemound-all")
		)
		expected = SingleMound.objects.all()
		serialized = SingleMoundSerializer(expected, many=True)
		self.assertEqual(response.data, serialized.data)

		self.assertEqual(response.status_code, status.HTTP_200_OK)
class BaseViewTest5(APITestCase):
	client = APIClient()
	@staticmethod
