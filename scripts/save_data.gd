class_name SaveData
extends Resource

var player_save_file : String = "user://player_save.res"


@export var money:int = 0
@export var owned_parts:Dictionary = {
	"basic_head":true,
	"basic_chest":true,
	"machine_gun_arm":true,
	"missile_shoulder":true,
	"basic_legs":true
}
#Levels beaten
#Equipment purchased state
#Save builds(s?)


func write_save() -> void:
	ResourceSaver.save(self, player_save_file, ResourceSaver.FLAG_CHANGE_PATH)
	print("Player data saved at ", player_save_file)

func state_exists() -> bool:
	return ResourceLoader.exists(player_save_file)
 

func load_state() -> Resource:
	return ResourceLoader.load(player_save_file, "", ResourceLoader.CACHE_MODE_IGNORE)
