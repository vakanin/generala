/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Quick Controls module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/





import QtQuick 2.3
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0


Rectangle {
    id: screen

    width: 500; height: 600
    color: "gray"

    SystemPalette { id: activePalette }

    Item {
        width: parent.width
        anchors { top: parent.top; bottom: parent.bottom }

        Image {
            id: background
            anchors.fill: parent
            source: "./pics/background.png"
            fillMode: Image.PreserveAspectFit
        }
    }


        Button {
            id: button1
            x: 8
            y: 72
            text: qsTr("Aces")
            property bool rollEnable: true
            onClicked: {
                textField1.text = game.aces()
                button1.rollEnable = false
                button1.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }

        }

        Button {
            id: button2
            x: 8
            y: 112
            text: qsTr("Twos")
            property bool rollEnable: true
            onClicked: {
                textField2.text = game.twos()
                button2.rollEnable = false
                button2.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button3
            x: 8
            y: 153
            text: qsTr("Threes")
            property bool rollEnable: true
            onClicked: {
                textField3.text = game.threes()
                button3.rollEnable = false
                button3.enabled = false
                //uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button4
            x: 8
            y: 194
            text: "Fours"
            property bool rollEnable: true
            onClicked: {
                textField4.text = game.fours()
                button4.rollEnable = false
                button4.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button5
            x: 8
            y: 232
            text: qsTr("Fives")
            property bool rollEnable: true
            onClicked: {
                textField5.text = game.fives()
                button5.rollEnable = false
                button5.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button6
            x: 8
            y: 270
            text: qsTr("Sixes")
            property bool rollEnable: true
            onClicked: {
                textField6.text = game.sixes()
                button6.rollEnable = false
                button6.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        TextField {
            id: textField1
            x: 112
            y: 72
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("-30")
        }

        TextField {
            id: textField2
            x: 112
            y: 112
            width: 40
            height: 27
            readOnly: true
            placeholderText: "-30"
        }

        TextField {
            id: textField3
            x: 112
            y: 153
            width: 40
            height: 27
            readOnly: true
            placeholderText: "-30"
        }

        TextField {
            id: textField4
            x: 112
            y: 194
            width: 40
            height: 27
            readOnly: true
            placeholderText: "-30"
        }

        TextField {
            id: textField5
            x: 112
            y: 232
            width: 40
            height: 27
            readOnly: true
            placeholderText: "-30"
        }

        TextField {
            id: textField6
            x: 112
            y: 270
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("-30")
        }

        Button {
            id: button7
            x: 386
            y: 421
            width: 102
            height: 99
            text: qsTr("Roll !")
            property int rolls: 3
            onClicked: {
                rollButtonsEnable()
                checkBoxesEnable()
                if (!checkBox1.checked) {
                    textField7.text = game.getDie1()
                }
                if (!checkBox2.checked) {
                    textField8.text = game.getDie2()
                }
                if (!checkBox3.checked) {
                    textField9.text = game.getDie3()
                }
                if (!checkBox4.checked) {
                    textField10.text = game.getDie4()
                }
                if (!checkBox5.checked) {
                    textField11.text = game.getDie5()
                }
                rolls--
                if (rolls == 0) {
                    button7.enabled = false
                    uncheck()
                    checkBoxesDisable()
                }
            }
        }

        TextField {
            id: textField7
            x: 8
            y: 445
            width: 61
            height: 64
            readOnly: true
            placeholderText: qsTr("Die 1")
        }

        TextField {
            id: textField8
            x: 83
            y: 445
            width: 61
            height: 64
            readOnly: true
            placeholderText: qsTr("Die 2")
        }

        TextField {
            id: textField9
            x: 166
            y: 445
            width: 61
            height: 64
            readOnly: true
            placeholderText: qsTr("Die 3")
        }

        TextField {
            id: textField10
            x: 245
            y: 445
            width: 61
            height: 64
            readOnly: true
            placeholderText: qsTr("Die 4")
        }

        TextField {
            id: textField11
            x: 319
            y: 445
            width: 61
            height: 64
            readOnly: true
            placeholderText: qsTr("Die 5")
        }

        CheckBox {
            id: checkBox1
            x: 8
            y: 515
            width: 61
            height: 22
            text: qsTr("keep")
        }

        CheckBox {
            id: checkBox2
            x: 83
            y: 515
            width: 61
            height: 22
            text: qsTr("keep")
        }

        CheckBox {
            id: checkBox3
            x: 166
            y: 515
            width: 61
            height: 22
            text: qsTr("keep")
        }

        CheckBox {
            id: checkBox4
            x: 245
            y: 515
            width: 61
            height: 22
            text: qsTr("keep")
        }

        CheckBox {
            id: checkBox5
            x: 319
            y: 515
            width: 61
            height: 22
            text: qsTr("keep")
        }

        Button {
            id: button8
            x: 245
            y: 72
            width: 125
            text: qsTr("Three of a kind")
            property bool rollEnable: true
            onClicked: {
                textFieldThreeOfAKind.text = game.threeOfAKind()
                button8.rollEnable = false
                button8.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button10
            x: 245
            y: 112
            width: 125
            text: qsTr("Four of a kind")
            property bool rollEnable: true
            onClicked: {
                textFieldFourOfAKind.text = game.fourOfAKind()
                button10.rollEnable = false
                button10.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button11
            x: 245
            y: 153
            width: 125
            height: 27
            text: qsTr("Full house")
            property bool rollEnable: true
            onClicked: {
                textFieldFullHouse.text = game.fullHouse()
                button11.rollEnable = false
                button11.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button12
            x: 245
            y: 194
            width: 125
            text: qsTr("Small sequence")
            property bool rollEnable: true
            onClicked: {
                textFieldSmallSequence.text = game.smallSequence()
                button12.rollEnable = false
                button12.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button13
            x: 245
            y: 232
            text: qsTr("Large sequence")
            property bool rollEnable: true
            onClicked: {
                textFieldLargeSequence.text = game.largeSequence()
                button13.rollEnable = false
                button13.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button14
            x: 245
            y: 270
            width: 125
            text: qsTr("Chance")
            property bool rollEnable: true
            onClicked: {
                textFieldChance.text = game.chance()
                button14.rollEnable = false
                button14.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        Button {
            id: button15
            x: 245
            y: 308
            width: 125
            text: qsTr("GENERALA")
            property bool rollEnable: true
            onClicked: {
                textFieldGenerala.text = game.generala()
                button15.rollEnable = false
                button15.enabled = false
                uncheck()
                button7.enabled = true
                button7.rolls = 3
                rollButtonsDisable()
            }
        }

        TextField {
            id: textFieldThreeOfAKind
            x: 384
            y: 74
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textFieldFourOfAKind
            x: 384
            y: 112
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textFieldFullHouse
            x: 384
            y: 153
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textFieldSmallSequence
            x: 384
            y: 194
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textFieldLargeSequence
            x: 384
            y: 232
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textFieldChance
            x: 384
            y: 270
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textFieldGenerala
            x: 384
            y: 308
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        Button {
            id: button9
            x: 8
            y: 9
            width: 144
            height: 40
            text: qsTr("New game")
            onClicked: {
                newGame()
            }
        }

        Button {
            id: button16
            x: 8
            y: 541
            width: 144
            height: 40
            text: qsTr("Check")
            onClicked: {
                textFieldResult.text = game.check()
                uncheck()
            }
        }

        TextField {
            id: textFieldResult
            x: 166
            y: 541
            width: 61
            height: 40
            readOnly: true
            placeholderText: qsTr("0")
        }

        function checkBoxesDisable() {
            checkBox1.enabled = false
            checkBox2.enabled = false
            checkBox3.enabled = false
            checkBox4.enabled = false
            checkBox5.enabled = false
        }

        function checkBoxesEnable() {
            checkBox1.enabled = true
            checkBox2.enabled = true
            checkBox3.enabled = true
            checkBox4.enabled = true
            checkBox5.enabled = true
        }

        function rollButtonsDisable() {
            button1.enabled = false
            button2.enabled = false
            button3.enabled = false
            button4.enabled = false
            button5.enabled = false
            button6.enabled = false
            button8.enabled = false
            button10.enabled = false
            button11.enabled = false
            button12.enabled = false
            button13.enabled = false
            button14.enabled = false
            button15.enabled = false

        }

        function rollButtonsEnable() {
            button1.enabled = button1.rollEnable
            button2.enabled = button2.rollEnable
            button3.enabled = button3.rollEnable
            button4.enabled = button4.rollEnable
            button5.enabled = button5.rollEnable
            button6.enabled = button6.rollEnable
            button8.enabled = button8.rollEnable
            button10.enabled = button10.rollEnable
            button11.enabled = button11.rollEnable
            button12.enabled = button12.rollEnable
            button13.enabled = button13.rollEnable
            button14.enabled = button14.rollEnable
            button15.enabled = button15.rollEnable
        }

        function uncheck() {
            checkBox1.checked = false
            checkBox2.checked = false
            checkBox3.checked = false
            checkBox4.checked = false
            checkBox5.checked = false
        }


        function newGame() {
            textField1.text = "-30"
            textField2.text = "-30"
            textField3.text = "-30"
            textField4.text = "-30"
            textField5.text = "-30"
            textField6.text = "-30"

            // Dices
            textField7.text = "Die 1"
            textField8.text = "Die 2"
            textField9.text = "Die 3"
            textField10.text = "Die 4"
            textField11.text = "Die 5"

            // others
            textFieldThreeOfAKind.text = "0"
            textFieldFourOfAKind.text = "0"
            textFieldFullHouse.text = "0"
            textFieldSmallSequence.text = "0"
            textFieldLargeSequence.text = "0"
            textFieldChance.text = "0"
            textFieldGenerala.text = "0"
            textFieldResult.text = "0"

            // checkBoxs
            checkBox1.checked = false
            checkBox2.checked = false
            checkBox3.checked = false
            checkBox4.checked = false
            checkBox5.checked = false

            // buttons
            button1.enabled = true
            button2.enabled = true
            button3.enabled = true
            button4.enabled = true
            button5.enabled = true
            button6.enabled = true
            button7.enabled = true
            button8.enabled = true
            button9.enabled = true
            button10.enabled = true
            button11.enabled = true
            button12.enabled = true
            button13.enabled = true
            button14.enabled = true
            button15.enabled = true
            button16.enabled = true

            // rollEnable = true
            button1.rollEnable = true
            button2.rollEnable = true
            button3.rollEnable = true
            button4.rollEnable = true
            button5.rollEnable = true
            button6.rollEnable = true
            button8.rollEnable = true
            button10.rollEnable = true
            button11.rollEnable = true
            button12.rollEnable = true
            button13.rollEnable = true
            button14.rollEnable = true
            button15.rollEnable = true

            button7.rolls = 3

            game.newGame()
        }
}
