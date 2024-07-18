extends Control

@export var health_component:HealthComponent
@export var energy_component:EnergyComponent

@onready var energy_number = %EnergyNumber
@onready var energy_bar = %EnergyBar
@onready var health_number = %HealthNumber
@onready var health_bar = %HealthBar

@onready var l_s_ammo = %L_S_Ammo
@onready var l_a_ammo = %L_A_Ammo
@onready var r_s_ammo = %R_S_Ammo
@onready var r_a_ammo = %R_A_Ammo
@onready var animation_player = $Crosshair/Control/AnimationPlayer
@onready var speed_label = %SpeedLabel
@onready var targets_destroyed = %TargetsDestroyed
@onready var targets_total = %TargetsTotal
@onready var contract_fufilled = %ContractFufilled


func _ready() ->void:
	health_component.health_changed.connect(update_hp)
	energy_component.energy_changed.connect(update_energy)
	energy_component.energy_drained.connect(on_energy_depleted)
	Global.update_targets_defeated.connect(update_targets_defeated)
	Global.update_targets_max.connect(update_targets_max)
	Global.level_complete.connect(update_contract_fufilled)
	contract_fufilled.hide()


func update_hp(current_health:float, max_health:float, has_increased:bool) ->void:
	health_number.text = "%05d" % current_health
	health_bar.value = int(current_health)
	health_bar.max_value = int(max_health)
	
	
func update_energy(current_energy:float, max_energy:float, has_increased:bool) ->void:
	energy_number.text = "%05d" % current_energy
	energy_bar.value = int(current_energy)
	energy_bar.max_value = int(max_energy)
	

func set_speed(value:float) ->void:
	speed_label.text = "%05d" % value
	

func update_left_shoulder_ammo(value:int) ->void:
	l_s_ammo.text = str(value)
	

func update_left_arm_ammo(value:int) ->void:
	l_a_ammo.text = str(value)
	

func update_right_shoulder_ammo(value:int) ->void:
	r_s_ammo.text = str(value)
	

func update_right_arm_ammo(value:int) ->void:
	r_a_ammo.text = str(value)
	

func on_energy_depleted(_1,_2) ->void:
	animation_player.play("energy_out")
	

func update_targets_defeated(str:String):
	targets_destroyed.text = str
	
func update_targets_max(str:String):
	targets_total.text = str
	
func update_contract_fufilled():
	contract_fufilled.show()
