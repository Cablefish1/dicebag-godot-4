# dicebag
A Godot 4 port of Dicebag by [8bitskull](https://github.com/8bitskull), originally in Lua for Defold.

It contains various random dice and RNG functions that are useful for anyone making RPG's and especially those that emulate tabletop RPGs.

Converted to Godot 3.2 by [yagich](https://github.com/yagich)

Converted again to Godot 4.0 by [cablefish1](https://github.com/cablefish1) who removed some functions and rewrote some.

Join the [RPGodot discord](https://discord.gg/2ZAdwyG6Sv) to join the development of more universal RPG tools.


## Installation
You can add Dicebag to your own projects using the built-in [Asset Library](https://docs.godotengine.org/en/latest/community/asset_library/using_assetlib.html#in-the-editor).
Once it is added to your project, you need to add an instance of Dicebag to the script you wish to use it in, before the `_ready()` function:
```
@onready var dicebag = Dicebag.new()

func _ready():
...
```
Then you can use Dicebag functions, for example:
```
var coin = dicebag.flip_coin()
```

Remember to do a `randomize()` before you call the scripts if you don't want your results to repeat.

#  Usage

  

###  dicebag.flip_coin()

Flip a coin.

  

**RETURNS**

* `result` (bool) - true or false (50% chance).

  

###  dicebag.roll_dice(num_dice, num_sides, modifier)

Roll a number of dice, D&D-style. An example would be rolling 3d6+2. Returns the sum of the resulting roll.

  

**PARAMETERS**

* `num_dice` (int) - Number of dice to roll.

* `num_sides` (int) - Number of sides on the dice.

* `modifier` (int) - Number to add to the result.

  

**RETURNS**

* `result` (int) - Sum of rolled dice plus modifier.

  

###  dicebag.roll_special_dice(num_sides, advantage, num_dice)

Roll a number of dice and return the highest (advantage) or lowest (disadvantage) results.

  

**PARAMETERS**

* `num_sides` (int) - Number of sides on the dice.

* `advantage` (bool) - If true, the highest rolls will be selected, otherwise the lowest values will be selected.

* `num_dice` (int) - Number of dice to roll.



  

**RETURNS**

* `result` (int) - The highest (advantage) or lowest (disadvantage) dice roll.



###  dicebag.roll_table(sides)

 Pick a random place in a user defined table. I.e. a loot table.
  

**PARAMETERS**


* `weighted_loot_table` is an array in the format [[weight1, value1], [weight2, value2] ...]. The function adds the weights and returns a random value based on the weighted probabilities.
  

**RETURNS**

* `value` (Variant) - The value as specified in Array `weighted_loot_table`.

