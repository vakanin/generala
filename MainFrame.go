package main

import (
	"fmt"
	"gopkg.in/qml.v1"
	"os"
    "./ScoreDice.go"
)

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
