
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
	var hips = get_node("hips")
	var hipsbone = skeleton.find_bone("hips")
	var hipstrans = skeleton.get_bone_global_pose(hipsbone)
	hipstrans.origin = hips.get_global_transform().origin
	hipstrans.basis = hips.get_global_transform().basis
	skeleton.set_bone_global_pose(hipsbone, hipstrans)
	for d in bonebody.keys():
		var bone = skeleton.find_bone(bonebody[d])
		var t = skeleton.get_bone_global_pose(bone)
		t.basis = get_node(d).get_global_transform().basis
		#t.origin = get_node(d).get_global_transform().origin WTF?
		skeleton.set_bone_global_pose(bone, t)



