"
	Hi! This is my guide for reading and building more of this and other projects:

File organization:
	- g_ files are .gd(scripts)
	- t_ files are .tscn(scenes)
	- e_ files are themes
	- r_ files are common resources
	- Most files use snake_case
	- Nodes use PascalCase
	- Components have '_comp' on their end, ex: 'DoubleJump_comp'
	
	1- Systems: 
		- Holds systems that the project depends upon, like a pause system and singletons
	2- General Assets:
		- Holds assets not related to entities, hud nor level design
	3, 4 and 5 are self explanatory

#===================================================================================================

Code organization:
	- Scripts are usually divided by a long #===== line that up to de second line an 100% zoomed 1920x1080 screen
		- Minor divisions might use instead a #----- line of same lenght
		- Even lesser separations will be just an empty line

		- The common divisions are as follows:
			#extends X and class
			#Variables
			#Dictionaries and Enums
			#Main functions(_ready, _process, _input, etc...)
			#Summarizing functions(functions used for shortening and avoid repetitions in other functions)
(
#===================================================================================================
#Variables

#===================================================================================================
#Dicts and Enums

#===================================================================================================
#Main functions

#===================================================================================================
#Summ funtions
)
		- The main exception being SignalBus with only the division #Signals
	- Nomenclature:
		- Common variables(ints, floats, Strings, bools, etc...) use snake_case
		- Node and Signal references use Pascal_Snake_Case
		- Preloads use SCREAMING_SNAKE_CASE
		- Functions start with _ and so do arguments

#===================================================================================================

Notable project settings:
	- Some inputs were added for convinience
	- All custom inputs should start with 'c_', standing for custom
	- Resolution default is 640x360 or 640x360 with a Maximized starting window
	- Max fps is 144
	- Strech mode is keep with canvas_items
	- Warnings:
		- Unused signal = Ignore
		- Untyped declaration = Warn
		- Unused parameter = Ignore
	- Default Texture filter = Nearest
	- Default font MSDF = on
	- 2D physics layer naming: 
		layer2 = Player area
		layer3 = Map geometry
		layer4 = Input Interactability
"
