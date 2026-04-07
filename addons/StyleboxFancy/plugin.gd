@tool
extends EditorPlugin

const InspectorPlugin = preload("uid://b1yas08a5nx6o")
const StyleBoxFancyConverter = preload("uid://flio81hb670j")

var converter = StyleBoxFancyConverter.new()
var inspector_plugin = InspectorPlugin.new()

func _enter_tree():
	add_inspector_plugin(inspector_plugin)
	add_resource_conversion_plugin(converter)

	add_custom_type(
		"StyleBoxFancy",
		"StyleBox",
		preload("uid://bkl6g25jwb47h"),
		preload("uid://ds1a2dtd5mvjg")
	)

	add_custom_type(
		"StyleBorder",
		"Resource",
		preload("uid://cjmmhbp1b5312"),
		preload("uid://bvvu8c56q60gy")
	)

func _exit_tree():
	remove_inspector_plugin(inspector_plugin)
	remove_resource_conversion_plugin(converter)
	remove_custom_type("StyleBoxFancy")
	remove_custom_type("StyleBorder")
