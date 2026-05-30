@tool
extends EditorPlugin

const InspectorPlugin: GDScript = preload("uid://b1yas08a5nx6o")
const Converters: Array[GDScript] = [
	preload("uid://xlxo4qnslu8a"),
	preload("uid://bjdkkvcvgsgxc"),
	preload("uid://flio81hb670j"),
	preload("uid://ctrm3k0u0xw03")
]

var inspector_plugin: EditorInspectorPlugin = InspectorPlugin.new()
var converters: Array[EditorResourceConversionPlugin]

func _enter_tree() -> void:
	add_inspector_plugin(inspector_plugin)
	for converter_script in Converters:
		var converter: EditorResourceConversionPlugin = converter_script.new()
		converters.append(converter)
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

func _exit_tree() -> void:
	remove_inspector_plugin(inspector_plugin)
	for converter in converters:
		remove_resource_conversion_plugin(converter)
	remove_custom_type("StyleBoxFancy")
	remove_custom_type("StyleBorder")
