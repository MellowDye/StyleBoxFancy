extends EditorResourceConversionPlugin

func _handles(resource: Resource) -> bool:
	return resource is StyleBoxFlat

func _converts_to() -> String:
	return "StyleBoxFancy"

func _convert(stylebox) -> StyleBoxFancy:
	var styleboxfancy = StyleBoxFancy.new()

	styleboxfancy.color = stylebox.bg_color
	styleboxfancy.draw_center = stylebox.draw_center
	styleboxfancy.skew = stylebox.skew
	styleboxfancy.corner_detail = stylebox.corner_detail
	styleboxfancy.shadow_enabled = stylebox.shadow_size > 0
	styleboxfancy.shadow_color = stylebox.shadow_color
	styleboxfancy.shadow_blur = stylebox.shadow_size
	styleboxfancy.shadow_offset = stylebox.shadow_offset
	styleboxfancy.anti_aliasing = stylebox.anti_aliasing
	styleboxfancy.anti_aliasing_size = stylebox.anti_aliasing_size
	styleboxfancy.resource_local_to_scene = stylebox.resource_local_to_scene


	var stylebox_border_widths: Array[int]
	# i represents corner/side
	for i: int in range(4):
		styleboxfancy.set_corner_radius(i, stylebox.get_corner_radius(i))
		styleboxfancy.set_expand_margin(i, stylebox.get_expand_margin(i))
		styleboxfancy.set_content_margin(i, stylebox.get_content_margin(i))
		stylebox_border_widths.append(stylebox.get_border_width(i))

	# Borders
	if stylebox_border_widths.max() > 0:
		var styleborder = StyleBorder.new()
		styleborder.color = stylebox.border_color
		styleborder.blend = stylebox.border_blend

		for i: int in range(4):
			styleborder.set_width(i, stylebox_border_widths[i])

		styleboxfancy.borders.append(styleborder)

	return styleboxfancy
