@tool
extends EditorPlugin

const InspectorPlugin = preload("res://addons/StyleboxFancy/inspector/inspector_plugin.gd")
const Converters = [
	preload("res://addons/StyleboxFancy/converters/fancy_to_flat.gd"),
	preload("res://addons/StyleboxFancy/converters/fancy_to_texture.gd"),
	preload("res://addons/StyleboxFancy/converters/flat_to_fancy.gd"),
	preload("res://addons/StyleboxFancy/converters/texture_to_fancy.gd")
]

var inspector_plugin = InspectorPlugin.new()
var converters: Array[EditorResourceConversionPlugin]

func _enter_tree():
	add_inspector_plugin(inspector_plugin)
	for converter_script in Converters:
		var converter: EditorResourceConversionPlugin = converter_script.new()
		converters.append(converter)
		add_resource_conversion_plugin(converter)

	add_custom_type(
		"StyleBoxFancy",
		"StyleBox",
		preload("res://addons/StyleboxFancy/StyleBoxFancy.gd"),
		preload("res://addons/StyleboxFancy/StyleBoxFancy.svg")
	)

	add_custom_type(
		"StyleBorder",
		"Resource",
		preload("res://addons/StyleboxFancy/StyleBorder.gd"),
		preload("res://addons/StyleboxFancy/StyleBorder.svg")
	)

func _exit_tree():
	remove_inspector_plugin(inspector_plugin)
	for converter in converters:
		remove_resource_conversion_plugin(converter)
	remove_custom_type("StyleBoxFancy")
	remove_custom_type("StyleBorder")
