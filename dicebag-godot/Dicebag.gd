extends RefCounted

class_name Dicebag

var rng = RandomNumberGenerator.new()

var bags = {}
var tables = {}



#Flip a coin: 50% chance of returning true or false
func flip_coin() -> bool:
	return randf() > 0.5

#D&D-style dice roll, for example 3d6+2. Returns resulting roll value.
func roll_dice(num_dice = 1, num_sides = 6, modifier = 0) -> int:
	var result = modifier

	for i in range(0, num_dice):
		result += rng.randi_range(1, num_sides)

	return result

#Roll one or more dice with advantage or disadvantage (if advantage is not true rolls are disadvantaged). Returns the highest (advantage) or lowest (disadvantage) value of all rolls.
#This script was broken in godot 3.5.1. I simplified it and rewrote it from the ground up. - Cablefish
func roll_special_dice(num_sides:int = 6, advantage:bool = true, num_dice:int = 2) -> int:
	var max_or_min_roll = 1
	var roll

	if advantage:
		for i in range (0, num_dice):
			roll = roll_dice(1, num_sides)
			if(roll > max_or_min_roll):
				max_or_min_roll = roll
	else:
		max_or_min_roll = num_sides
		for i in range (0, num_dice):
			roll = roll_dice(1, num_sides)
			if roll < max_or_min_roll:
				max_or_min_roll = roll
				
	return max_or_min_roll




# Pick a random place in a user defined table. I.e. a loot table.
# Parameter weighted_loot_table is an array in the format [[weight1, value1], [weight2, value2] ...].
# The function adds the weights and returns a random value based on the weighted probabilities.

func roll_table(weighted_loot_table):
	var total_weight = 0
	var acc_weight = 0

	# count up the total weight
	for item in weighted_loot_table:
		total_weight += item[0]
	
	#get random number within the total weight
	var random_num = randf() * total_weight
	
	#find corrosponding die side and return its value.
	for item in weighted_loot_table:
		if random_num <= item[0] + acc_weight:
			return item[1]
		else:
			acc_weight += item[0]

	return weighted_loot_table[-1][1]
