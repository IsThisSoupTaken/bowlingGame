extends RichTextLabel


func _ready() -> void:
	$".".visible = false
	$".".text = "[tornado radius=10.0 freq=5.0][rainbow freq=1.7 sat=1 val=1 speed=-0.7][outline_size=30px][outline_color=black]Strike![/outline_color][/outline_size][/rainbow][/tornado]"




func _on_label_show_timer_timeout() -> void:
	$".".visible = false


func _on_visibility_changed() -> void:
	if $".".visible == true:
		%LabelShowTimer.start()
