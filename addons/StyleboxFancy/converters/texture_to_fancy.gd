extends EditorResourceConversionPlugin

func _handles(resource: Resource) -> bool:
	return resource is StyleBoxTexture

func _converts_to() -> String:
	return "StyleBoxFancy"

func _convert(styleboxtexture) -> StyleBoxFancy:
	var styleboxfancy = StyleBoxFancy.new()

	styleboxfancy.texture = styleboxtexture.texture
	styleboxfancy.color = styleboxtexture.modulate_color
	return styleboxfancy
