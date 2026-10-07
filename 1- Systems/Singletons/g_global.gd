extends Node

#===================================================================================================
#Variables

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

#===================================================================================================
#Summ funtions

func reset_tween(tween: Tween, parent: Node) -> Tween:
	if tween.is_valid():
		tween.kill()
	var new_tween = parent.create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	return new_tween
