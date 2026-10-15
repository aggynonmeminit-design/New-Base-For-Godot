extends Node

#===================================================================================================
#Variables

var config: ConfigFile = ConfigFile.new()
var path: String = "user://settings.cfg"

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

func _ready() -> void: 
	_test_save()	
	
#===================================================================================================
#Summ funtions

func _test_save() -> void:
	config.load(path)
	config.set_value("GENERAL", "test", true)
	config.save(path)
