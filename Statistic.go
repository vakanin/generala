package generala

type Statistic struct {
    gamesStarted int
    gamesFinished int
}

func NewStatistic() *Statistic{

}

//Records that a new game has been started
func (s *Statistic) GameStarted() {

}

//Records that a game was ended
//param score is the score the game ended with
func (s *Statistic) GameFinished(score int) {

}

//Reset the statistics data
func (s *Statistic) Reset() {

}

//Returns games started
func (s *Statistic) GamesStarted() int{

}

//Returns games finished
func (s *Statistic) GamesFinished() int{

}
