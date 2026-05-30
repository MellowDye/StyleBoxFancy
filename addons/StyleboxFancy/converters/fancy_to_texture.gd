extends EditorResourceConversionPlugin

func _handles(resource: Resource) -> bool:
	return resource is StyleBoxFancy

func _converts_to() -> String:
	return "StyleBoxTexture"

func _convert(styleboxfancy) -> StyleBoxTexture:
	var styleboxtexture = StyleBoxTexture.new()

	styleboxtexture.texture = styleboxfancy.texture
	styleboxtexture.modulate_color = styleboxfancy.color
	return styleboxtexture
