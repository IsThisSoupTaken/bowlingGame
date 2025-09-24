extends RichTextLabel


func _ready() -> void:
	$".".visible = false
	$".".text = "[outline_size=30px][outline_color=black]Spare[/outline_color][/outline_size]"


func _on_label_show_timer_timeout() -> void:
	$".".visible = false


func _on_visibility_changed() -> void:
	if $".".visible == true:
		%LabelShowTimer.start()
