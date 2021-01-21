extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var countspath = ""
var file = File.new()
var content = ""
var counts = [35,35,15,14,20,50,70,14,7,14,12,30,12,10,7]

# Called when the node enters the scene tree for the first time.
func _ready():
    $Label2.text = ""
    for c in counts:
        $Label2.text += "/"+str(c) + "\n"
    $FileDialog.popup()
    pass # Replace with function body.


func _process(delta):
    
    var content = ""
    if countspath != "":
        file.open(countspath, file.READ)
        content = file.get_as_text()
        file.close()
    if not content == "":
        content = content.split(",")
        $Label.text = ""
        var greenline = 0
        $UnderlineG.rect_global_position.y = greenline*56 -6
        for c in content:
            if greenline < 15:
                greenline += 1
                $Label.text += c + "\n"
                if int(c) >= counts[greenline-1]:
                    $UnderlineG.rect_global_position.y = greenline*56 -6


func _on_FileDialog_file_selected(path):
    countspath = path
