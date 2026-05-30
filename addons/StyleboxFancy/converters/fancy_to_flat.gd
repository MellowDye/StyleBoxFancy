extends EditorResourceConversionPlugin

func _handles(resource: Resource) -> bool:
	return resource is StyleBoxFancy

func _converts_to() -> String:
	return "StyleBoxFlat"

func _convert(styleboxfancy) -> StyleBoxFlat:
	var styleboxflat: StyleBoxFlat = StyleBoxFlat.new()

	styleboxflat.bg_color = styleboxfancy.color
	styleboxflat.draw_center = styleboxfancy.draw_center
	styleboxflat.skew = styleboxfancy.skew
	styleboxflat.corner_detail = styleboxfancy.corner_detail
	styleboxflat.shadow_color = styleboxfancy.shadow_color
	if styleboxfancy.shadow_enabled:
		styleboxflat.shadow_size = styleboxfancy.shadow_blur
	else:
		styleboxflat.shadow_size = 0
	styleboxflat.shadow_offset = styleboxfancy.shadow_offset
	styleboxflat.anti_aliasing = styleboxfancy.anti_aliasing
	styleboxflat.anti_aliasing_size = styleboxfancy.anti_aliasing_size
	styleboxflat.resource_local_to_scene = styleboxfancy.resource_local_to_scene


	# i represents corner/side
	for i: int in range(4):
		styleboxflat.set_corner_radius(i, styleboxfancy.get_corner_radius(i))
		styleboxflat.set_expand_margin(i, styleboxfancy.get_expand_margin(i))
		styleboxflat.set_content_margin(i, styleboxfancy.get_content_margin(i))

	# Borders
	if styleboxfancy.borders.size() > 0:
		var border: StyleBorder = styleboxfancy.borders[0]
		styleboxflat.border_color = border.color
		styleboxflat.border_blend = border.blend

		for i: int in range(4):
			styleboxflat.set_border_width(i, border.get_width(i))

	return styleboxflat
