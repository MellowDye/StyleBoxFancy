extends EditorInspectorPlugin

const CornerEditor = preload("uid://c0j12lafuf8qy")

func _can_handle(object: Object) -> bool:
	return object is StyleBoxFancy

func _parse_group(object: Object, group: String) -> void:
	if group == "Corners":
		add_property_editor_for_multiple_properties(
			"Corner Properties",
			[
				"corner_radius_top_left",
				"corner_radius_top_right",
				"corner_radius_bottom_left",
				"corner_radius_bottom_right",
				"corner_curvature_top_left",
				"corner_curvature_top_right",
				"corner_curvature_bottom_left",
				"corner_curvature_bottom_right",
			],
			CornerEditor.new()
		)
