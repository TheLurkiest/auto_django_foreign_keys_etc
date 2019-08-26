from django.db import models
class FarmerId(models.Model):
	user_id = models.CharField(max_length=255, null=False)
	first_name = models.CharField(max_length=250, null=False)
	last_name = models.CharField(max_length=250, null=False)
	email = models.CharField(max_length=250, null=False)
	phone_number = models.CharField(max_length=250, null=False)
	def __str__(self):
		return "{} - {}".format(self.user_id, self.first_name, self.last_name, self.email, self.phone_number)
class CultivarGroup(models.Model):
	tswv_resistance = models.CharField(max_length=250, null=False)
	yield_lbs_per_acre = models.CharField(max_length=255, null=False)
	days_to_mature = models.CharField(max_length=255, null=False)
	desired_ca = models.BooleanField(max_length=250, null=False)
	white_mold_resistance = models.FloatField(max_length=250, null=False)
	cbr_resistance = models.IntegerField(max_length=250, null=False)
	limb_rot_resistance = models.CharField(max_length=255, null=False)
	def __str__(self):
		return "{} - {}".format(self.tswv_resistance, self.yield_lbs_per_acre, self.days_to_mature, self.desired_ca, self.white_mold_resistance, self.cbr_resistance, self.limb_rot_resistance)
class PlotOfLand(models.Model):
	farmer_id = models.ForeignKey("FarmerId", on_delete=models.CASCADE)
	num_columns_full = models.BooleanField(max_length=250, null=False)
	approx_gps = models.BooleanField(max_length=250, null=False)
	num_rows_full = models.CharField(max_length=255, null=False)
	x_dist_between_mounds = models.CharField(max_length=255, null=False)
	y_dist_between_mounds = models.CharField(max_length=255, null=False)
	diameter_mounds = models.CharField(max_length=255, null=False)
	peanuts_seeds_per_mound = models.CharField(max_length=255, null=False)
	def __str__(self):
		return "{} - {}".format(self.farmer_id, self.num_columns_full, self.approx_gps, self.num_rows_full, self.x_dist_between_mounds, self.y_dist_between_mounds, self.diameter_mounds, self.peanuts_seeds_per_mound)
class SingleMound(models.Model):
	plot_of_land = models.FloatField(max_length=250, null=False)
	x_coord_in_plot = models.CharField(max_length=255, null=False)
	y_coord_in_plot = models.CharField(max_length=255, null=False)
	days_since_h2o_input = models.CharField(max_length=255, null=False)
	last_h2o_input_amt = models.FloatField(max_length=250, null=False)
	def __str__(self):
		return "{} - {}".format(self.plot_of_land, self.x_coord_in_plot, self.y_coord_in_plot, self.days_since_h2o_input, self.last_h2o_input_amt)
class Dog(models.Model):
	farmer_id = models.ForeignKey("FarmerId", on_delete=models.CASCADE)
	name = models.CharField(max_length=255, null=False)
	breed = models.CharField(max_length=255, null=False)
	def __str__(self):
		return "{} - {}".format(self.farmer_id, self.name, self.breed)
