package generala


type ScoreDice struct {
    mDice   []int
    mDiceBoxes  []int
    mGeneralaJoker  bool
}

//This constructor sets the values of the dice.
func NewScoreDice(dice []int, boxes []int) *ScoreDice{

}

//Sets the dice values
//param dice An array of 5 short ints containing the values of the dice. 
func (s *ScoreDice) SetDice(dice []int) {

}


//Tells the scoring class wheter or not we have a Generala Joker. It needs the dice set before it can operate.
func (s *ScoreDice) GeneralaJoker(isGeneralaJoker bool) {

}

//Gets the value of a dice.
//param number the index of the dice wanted.
//return the value of the dice. 0 if wrong input. 
func (s *ScoreDice) GetDice(number int) int {

}

//return the score for the aces box.
func (s *ScoreDice) Aces() int {

}

//return the score for the twos box.
func (s *ScoreDice) Twos() int {

}

//return the score for the threes box.
func (s *ScoreDice) Threes() int {

}

//return the score for the fours box.
func (s *ScoreDice) Fours() int {

}

//return the score for the fives box.
func (s *ScoreDice) Fives() int {

}

//return the score for the sixes box.
func (s *ScoreDice) Sixes() int {

}

//return the score for the "Three of A Kind" box.
func (s *ScoreDice) ThreeOfAKind() int {

}

//return the score for the "Four of A Kind" box.
func (s *ScoreDice) FourOfAKind() int {

}

//return the score for the "Full House" box.
func (s *ScoreDice) FullHouse() int {

}

//return the score for the small sequence box.
func (s *ScoreDice) SmallSequence() int {

}

//return the score for the large sequence box.
func (s *ScoreDice) LargeSequence() int {

}

// * \return the score for the Generala box.
func (s *ScoreDice) Generala() int {

}

//return the score for the chance box.
func (s *ScoreDice) Chance() int {

}

//return true or false depending on whether there is a Generala or not.
func (s *ScoreDice) IsGenerala() bool {

}


