package main

import (
	"fmt"
	"gopkg.in/qml.v1"
	"math/rand"
	"os"
	//        "strconv"
	//        "time"
)

type ScoreDice struct {
	mDice     []int
	mDiceHash []int // how many times we have 1s, 2s ...
	// mDiceBoxes     map[string]int
	mGeneralaJoker bool
	dice1 int
	dice2 int
	dice3 int
	dice4 int
	dice5 int
}

//This constructor sets the values of the dice.
func NewScoreDice() *ScoreDice {
	sd := new(ScoreDice)
	sd.mDice = make([]int, 5)
	sd.mDiceHash = make([]int, 6)
	//sd.mDiceBoxes = make(map[string]int)
	return sd
}

//Sets the dice values
//param dice An array of 5 short ints containing the values of the dice.
func (sd *ScoreDice) SetDice() {
    sd.mDice[0] = sd.dice1
    sd.mDice[1] = sd.dice2
    sd.mDice[2] = sd.dice3
    sd.mDice[3] = sd.dice4
    sd.mDice[4] = sd.dice5

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

// remove me !!!
func (sd *ScoreDice) GetDiceHash() {
	for _, v := range sd.mDiceHash {
		fmt.Printf("%d, ", v)
	}
}

//return the score for the aces box.
func (sd *ScoreDice) Aces() int {
	fmt.Println("Aces()")
	return sd.mDiceHash[0]
}

//return the score for the twos box.
func (sd *ScoreDice) Twos() int {
	return 2 * sd.mDiceHash[1]
}

//return the score for the threes box.
func (sd *ScoreDice) Threes() int {
	return 3 * sd.mDiceHash[2]
}

//return the score for the fours box.
func (sd *ScoreDice) Fours() int {
	return 4 * sd.mDiceHash[3]
}

//return the score for the fives box.
func (sd *ScoreDice) Fives() int {
	return 5 * sd.mDiceHash[4]
}

//return the score for the sixes box.
func (sd *ScoreDice) Sixes() int {
	return 6 * sd.mDiceHash[5]
}

//return the score for the "Three of A Kind" box.
func (sd *ScoreDice) ThreeOfAKind() int {
	for i, v := range sd.mDiceHash {
		if v >= 3 {
			return v * (i + 1)
		}
	}
	return 0
}

//return the score for the "Four of A Kind" box.
func (sd *ScoreDice) FourOfAKind() int {
	for i, v := range sd.mDiceHash {
		if v >= 4 {
			return v * (i + 1)
		}
	}
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
		return sd.Chance()
	}
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
		return 15
	}
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
		return 20
	}
	return 0
}

// * \return the score for the Generala box.
func (sd *ScoreDice) Generala() int {
	for _, v := range sd.mDiceHash {
		if v == 5 {
			return 50
		}
	}
	return 0
}

//return the score for the chance box.
func (sd *ScoreDice) Chance() int {
	chance := 0
	for _, v := range sd.mDice {
		chance += v
	}
	return chance
}

//return true or false depending on whether there is a Generala or not.
//func (sd *ScoreDice) IsGenerala() bool {
//    return true
//}

func (sd *ScoreDice) Roll() {
	sd.dice1 = rand.Int()%6 + 1
    sd.dice2 = rand.Int()%6 + 1
    sd.dice3 = rand.Int()%6 + 1
    sd.dice4 = rand.Int()%6 + 1
    sd.dice5 = rand.Int()%6 + 1
}

func (sd *ScoreDice) GetDice1() int {
	sd.dice1 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[0]
}

func (sd *ScoreDice) GetDice2() int {
	sd.dice2 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[1]
}

func (sd *ScoreDice) GetDice3() int {
	sd.dice3 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[2]
}

func (sd *ScoreDice) GetDice4() int {
	sd.dice4 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[3]
}

func (sd *ScoreDice) GetDice5() int {
	sd.dice5 = rand.Int()%6 + 1
    sd.SetDice()
	return sd.mDice[4]
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
