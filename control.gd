extends Control

var rockSprite = load("res://rock.png")
var paperSprite = load("res://paper.png")
var scissorsSprite = load("res://scissors.png")
var random_number = 0
var playerScore = 0
var comScore = 0

func newgame():
	$Label.text = ""
	$Label2.text = ""
	$Label3.text = ""
	$Sprite2D.texture = null
	$Sprite2D2.texture = null
	$Button.show()
	$Button2.show()
	$Button3.show()
	playerScore = 0
	comScore = 0
	$Label4.text = str(playerScore)
	$Label5.text = str(comScore)
	$Button4.hide()
	$Label6.hide()	
	
func _ready():
	newgame()
	
func computer_turn():
	var rng = RandomNumberGenerator.new()
	random_number = rng.randi_range(0, 2)
	if random_number == 0:
		$Label2.text = "Rock"
		$Sprite2D2.texture = rockSprite
		if $Label.text == "Rock":
			$Label3.text = "Draw"
		elif $Label.text == "Paper":
			$Label3.text = "You Win"
		elif $Label.text == "Scissors":
			$Label3.text = "You Lose"	
	elif random_number == 1:
		$Label2.text = "Paper"
		$Sprite2D2.texture = paperSprite
		if $Label.text == "Rock":
			$Label3.text = "You Lose"
		elif $Label.text == "Paper":
			$Label3.text = "Draw"
		elif $Label.text == "Scissors":
			$Label3.text = "You Win"
	elif random_number == 2:
		$Label2.text = "Scissors"
		$Sprite2D2.texture = scissorsSprite
		if $Label.text == "Rock":
			$Label3.text = "You Win"
		elif $Label.text == "Paper":
			$Label3.text = "You Lose"
		elif $Label.text == "Scissors":
			$Label3.text = "Draw"
	if $Label3.text == "You Win":
		playerScore += 1
	elif $Label3.text == "You Lose":
		comScore += 1
	$Label4.text = str(playerScore)
	$Label5.text = str(comScore)
	if playerScore == 10 or comScore == 10:
		$Label6.show()
		$Button4.show()
		$Button.hide()
		$Button2.hide()
		$Button3.hide()

func _on_button_button_down():
	$Label.text = "Rock"
	$Sprite2D.texture = rockSprite
	computer_turn()

func _on_button_2_button_down():
	$Label.text = "Paper"
	$Sprite2D.texture = paperSprite
	computer_turn()

func _on_button_3_button_down():
	$Label.text = "Scissors"
	$Sprite2D.texture = scissorsSprite
	computer_turn()

func _on_button_4_button_down():
	newgame()
