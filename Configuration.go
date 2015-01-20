package main

type Configuration struct {
    mFile   string
    higscores   map[string]*HighScoreItem
}

type HighScoreItem {
    score int
    name string
}

func NewConfiguration(file string) *Configuration{

}

//Reads Open Generala configurations file and parses it.
func (c *Configuration) Load(file string) {

}

//Saves the configurations (setting and highscores) to the file
func (c *Configuration) Save(file string) {

}

//Checks if a given score quallifies to the high score list
func (c *Configuration) IsHighScore(score int) bool {

}

//Adds a given entry to the highscore list.
//return the place in the highscore list for the new entry, or
//zero if it didn't quallify. 
func (c *Configuration) SubmitHighscore(score int, name string) {

}

//Clear highscore list
func (c *Configuration) ClearHighscores() {

}


