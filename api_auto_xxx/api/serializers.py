from rest_framework import serializers

from .models import FarmerId
class FarmerIdSerializer(serializers.ModelSerializer):
	class Meta:
		model = FarmerId
		fields = ("user_id", "first_name", "last_name", "email", "phone_number")

from .models import CultivarGroup
class CultivarGroupSerializer(serializers.ModelSerializer):
	class Meta:
		model = CultivarGroup
		fields = ("tswv_resistance", "yield_lbs_per_acre", "days_to_mature", "desired_ca", "white_mold_resistance", "cbr_resistance", "limb_rot_resistance")

from .models import PlotOfLand
class PlotOfLandSerializer(serializers.ModelSerializer):
	class Meta:
		model = PlotOfLand
		fields = ("farmer_id", "num_columns_full", "approx_gps", "num_rows_full", "x_dist_between_mounds", "y_dist_between_mounds", "diameter_mounds", "peanuts_seeds_per_mound")

from .models import SingleMound
class SingleMoundSerializer(serializers.ModelSerializer):
	class Meta:
		model = SingleMound
		fields = ("plot_of_land", "x_coord_in_plot", "y_coord_in_plot", "days_since_h2o_input", "last_h2o_input_amt")

from .models import Dog
class DogSerializer(serializers.ModelSerializer):
	class Meta:
		model = Dog
		fields = ("farmer_id", "name", "breed")
