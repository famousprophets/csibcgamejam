extends PanelContainer
class_name Slot

@onready var texture_rect = $TextureRect
@export var item: Item = null:
	set(value):
		item = value
		
		if value != null:
			texture_rect.texture = value.icon
		else:
			texture_rect.texture = null

func get_preview():
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture_rect.texture
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	return preview
	
func _can_drop_data(_pos,data):
	return data is Slot

func _get_drag_data(_at_position):
	set_drag_preview(get_preview())
	return self

func _drop_data(_at_position,data):
	var temp = item
	item = data.item
	data.item = temp
