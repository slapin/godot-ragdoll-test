
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

var bonebody = {
		"hips": "hips",
		"hips/leftleg": "leg_L",
		"hips/rightleg": "leg_R",
		"hips/spine": "spine",
		"hips/spine/leftarm": "arm_L",
		"hips/spine/rightarm": "arm_R",
		"hips/spine/neck": "neck",
		"hips/spine/neck/head": "head",
	}
var skeleton

func _ready():
	# Initalization here
	skeleton = get_node("bob/Armature/Skeleton")
	set_fixed_process(true)


func _fixed_process(delta):
	for d in bonebody.keys():
		var bone = skeleton.find_bone(bonebody[d])
		skeleton.set_bone_global_pose(bone, get_node(d).get_global_transform())



