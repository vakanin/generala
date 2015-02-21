package main

import (
	"fmt"
	"gopkg.in/qml.v1"
	"math/rand"
	"os"
)

type ScoreDice struct {
	mDice     []int
	mDiceHash []int // how many times we have 1s, 2s ...
    mDiceBoxes     map[string]int
	mGeneralaJoker bool
	die1 int
	die2 int
	die3 int
	die4 int
	die5 int
}

//This constructor sets the values of the dice.
func NewScoreDice() *ScoreDice {
	sd := new(ScoreDice)
	sd.mDice = make([]int, 5)
	sd.mDiceHash = make([]int, 6)
	sd.mDiceBoxes = make(map[string]int)
    sd.NewGame()
	return sd
}

//Sets the dice values
//param dice An array of 5 short ints containing the values of the dice.
func (sd *ScoreDice) SetDice() {
    sd.mDice[0] = sd.die1
    sd.mDice[1] = sd.die2
    sd.mDice[2] = sd.die3
    sd.mDice[3] = sd.die4
    sd.mDice[4] = sd.die5

	//fill the dice hash
	for i, _ := range sd.mDiceHash {
		sd.mDiceHash[i] = 0
	}
	for _, v := range sd.mDice {
		sd.mDiceHash[v-1] += 1
	}
}

//Tells the scoring class wheter or not we have a Generala Joker. It needs the dice set before it can operate.
func (sd *ScoreDice) GeneralaJoker(isGeneralaJoker bool) {
	sd.mGeneralaJoker = isGeneralaJoker
}

//Gets the value of a dice.
//param number the index of the dice wanted.
//return the value of the dice. 0 if wrong input.
func (sd *ScoreDice) GetDice(number int) int {
	if number <= 5 && number >= 1 {
		return sd.mDice[number-1]
	}
	return 0
}

//return the score for the aces box.
func (sd *ScoreDice) Aces() int {
	sd.mDiceBoxes["aces"] = sd.mDiceHash[0]
    return sd.mDiceHash[0]
}

//return the score for the twos box.
func (sd *ScoreDice) Twos() int {
    sd.mDiceBoxes["twos"] = 2 * sd.mDiceHash[1]
	return 2 * sd.mDiceHash[1]
}

//return the score for the threes box.
func (sd *ScoreDice) Threes() int {
    sd.mDiceBoxes["threes"] = 3 * sd.mDiceHash[2]
	return 3 * sd.mDiceHash[2]
}

//return the score for the fours box.
func (sd *ScoreDice) Fours() int {
    sd.mDiceBoxes["fours"] = 4 * sd.mDiceHash[3]
	return 4 * sd.mDiceHash[3]
}

//return the score for the fives box.
func (sd *ScoreDice) Fives() int {
    sd.mDiceBoxes["fives"] = 5 * sd.mDiceHash[4]
	return 5 * sd.mDiceHash[4]
}

//return the score for the sixes box.
func (sd *ScoreDice) Sixes() int {
    sd.mDiceBoxes["sixes"] = 6 * sd.mDiceHash[5]
	return 6 * sd.mDiceHash[5]
}

//return the score for the "Three of A Kind" box.
func (sd *ScoreDice) ThreeOfAKind() int {
	for i, v := range sd.mDiceHash {
		if v >= 3 {
            sd.mDiceBoxes["tok"] = v * (i + 1)      // tok = three of a kind
			return v * (i + 1)
		}
	}
    sd.mDiceBoxes["tok"] = 0
	return 0
}

//return the score for the "Four of A Kind" box.
func (sd *ScoreDice) FourOfAKind() int {
	for i, v := range sd.mDiceHash {
		if v >= 4 {
            sd.mDiceBoxes["fok"] = v * (i + 1)      // fok = four of a kind
			return v * (i + 1)
		}
	}
    sd.mDiceBoxes["fok"] = 0
	return 0
}

//return the score for the "Full House" box.
func (sd *ScoreDice) FullHouse() int {
	threes := false
	twos := false
	for _, v := range sd.mDiceHash {
		if v == 2 {
			twos = true
		}
		if v == 3 {
			threes = true
		}
	}
	if twos && threes {
        sum := 0
        for _, v := range sd.mDice {
            sum += v
        }
        sd.mDiceBoxes["fh"] = sum
		return sum
	}
    sd.mDiceBoxes["fh"] = 0
	return 0
}

//return the score for the small sequence box.
func (sd *ScoreDice) SmallSequence() int {
	sequence := true
	for i := 0; i <= 4; i++ {
		if sd.mDiceHash[i] == 0 {
			sequence = false
		}
	}
	if sequence {
        sd.mDiceBoxes["ss"] = 15
		return 15
	}
    sd.mDiceBoxes["ss"] = 0
	return 0
}

//return the score for the large sequence box.
func (sd *ScoreDice) LargeSequence() int {
	sequence := true
	for i := 1; i <= 5; i++ {
		if sd.mDiceHash[i] == 0 {
			sequence = false
		}
	}
	if sequence {
        sd.mDiceBoxes["ls"] = 20
		return 20
	}
    sd.mDiceBoxes["ls"] = 0
	return 0
}

//return the score for the Generala box.
func (sd *ScoreDice) Generala() int {
	for _, v := range sd.mDiceHash {
		if v == 5 {
            sd.mDiceBoxes["generala"] = 50
			return 50
		}
	}
    sd.mDiceBoxes["generala"] = 0
	return 0
}

//return the score for the chance box.
func (sd *ScoreDice) Chance() int {
	chance := 0
	for _, v := range sd.mDice {
		chance += v
	}
    sd.mDiceBoxes["chance"] = chance
	return chance
}

//return true or false depending on whether there is a Generala or not.
func (sd *ScoreDice) IsGenerala() bool {
    return sd.mGeneralaJoker
}

func (sd *ScoreDice) Roll() {
	sd.die1 = rand.Int()%6 + 1
    sd.die2 = rand.Int()%6 + 1
    sd.die3 = rand.Int()%6 + 1
    sd.die4 = rand.Int()%6 + 1
    sd.die5 = rand.Int()%6 + 1
}

// returns value of the first die
func (sd *ScoreDice) GetDie1() int {
	sd.die1 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[0]
}

// returns value of the second die
func (sd *ScoreDice) GetDie2() int {
	sd.die2 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[1]
}

// returns value of the third die
func (sd *ScoreDice) GetDie3() int {
	sd.die3 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[2]
}

// returns value of the fourth die
func (sd *ScoreDice) GetDie4() int {
	sd.die4 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[3]
}

// returns value of the fifth die
func (sd *ScoreDice) GetDie5() int {
	sd.die5 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[4]
}

//start a new game :)
func (sd *ScoreDice) NewGame() {
    sd.mGeneralaJoker = false
    sd.mDiceBoxes["aces"] = -30
    sd.mDiceBoxes["twos"] = -30
    sd.mDiceBoxes["threes"] = -30
    sd.mDiceBoxes["fours"] = -30
    sd.mDiceBoxes["fives"] = -30
    sd.mDiceBoxes["sixes"] = -30
}

// this function calculate/check your result and returns it
func (sd *ScoreDice) Check() int {
    result := 0
    for _, v := range sd.mDiceBoxes {
        result += v
    }
    return result
}

func main() {
	if err := qml.Run(run); err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
}

func run() error {
	engine := qml.NewEngine()

	component, err := engine.LoadFile("main.qml")
	if err != nil {
		return err
	}

	game := NewScoreDice()
	game.Roll()
	game.SetDice()

	context := engine.Context()
	context.SetVar("game", game)

	window := component.CreateWindow(nil)

	window.Show()
	window.Wait()
	return nil
}
