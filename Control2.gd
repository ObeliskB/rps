extends Control

var rock = load("res://rock.png")
var paper = load("res://paper.png")
var scissors = load("res://scissors.png")
var array = ["Rock", "Paper", "Scissors"]
var sArray = [rock, paper, scissors]
var pScore
var cScore

# Called when the node enters the scene tree for the first time.
func _ready():
	newgame()

func newgame():
	$playerLabel.text = ""
	$comLabel.text = ""
	$resultLabel.text = ""
	$gameoverLabel.hide()
	$restartButton.hide()
	$playerSprite.texture = null
	$comSprite.texture = null
	$rock.show()
	$paper.show()
	$scissors.show()
	pScore = 0
	cScore = 0
	$playerScoreLabel.text = str(pScore)
	$comScoreLabel.text = str(cScore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func com_random(playerNumber):
	var rng = RandomNumberGenerator.new()
	var rnd = rng.randi_range(0, 2)
	$comLabel.text = "" + array[rnd]
	$comSprite.texture = sArray[rnd]
	if rnd == playerNumber:
		$resultLabel.text = "Draw"
	elif playerNumber == 0 and rnd == 1:
		$resultLabel.text = "You Lose"
		update_score(0,1)
	elif playerNumber == 0 and rnd == 2:
		$resultLabel.text = "You Win"
		update_score(1,0)
	elif playerNumber == 1 and rnd == 0:
		$resultLabel.text = "You Win"
		update_score(1,0)
	elif playerNumber == 1 and rnd == 2:
		$resultLabel.text = "You Lose"
		update_score(0,1)
	elif playerNumber == 2 and rnd == 0:
		$resultLabel.text = "You Lose"
		update_score(0,1)
	elif playerNumber == 2 and rnd == 1:
		$resultLabel.text = "You Win"
		update_score(1,0)
	if pScore == 10 or cScore == 10:
		$gameoverLabel.show()
		$restartButton.show()
		$rock.hide()
		$paper.hide()
		$scissors.hide()
	
	
func update_score(ps, cs):
	pScore += ps
	cScore += cs
	$playerScoreLabel.text = str(pScore)
	$comScoreLabel.text = str(cScore)

func _on_rock_button_down():
	$playerLabel.text = "Rock"
	$playerSprite.texture = rock
	com_random(0)


func _on_paper_button_down():
	$playerLabel.text = "Paper"
	$playerSprite.texture = paper
	com_random(1)


func _on_scissors_button_down():
	$playerLabel.text = "Scissors"
	$playerSprite.texture = scissors
	com_random(2)


func _on_restart_button_button_down():
	newgame()
