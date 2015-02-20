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
            onClicked: {
                textField1.text = game.aces()
            }
        }

        Button {
            id: button2
            x: 8
            y: 112
            text: qsTr("Twos")
            onClicked: {
                textField2.text = game.twos()
            }
        }

        Button {
            id: button3
            x: 8
            y: 153
            text: qsTr("Threes")
            onClicked: {
                textField3.text = game.threes()
            }
        }

        Button {
            id: button4
            x: 8
            y: 194
            text: "Fours"
            onClicked: {
                textField4.text = game.fours()
            }
        }

        Button {
            id: button5
            x: 8
            y: 232
            text: qsTr("Fives")
            onClicked: {
                textField5.text = game.fives()
            }
        }

        Button {
            id: button6
            x: 8
            y: 270
            text: qsTr("Sixes")
            onClicked: {
                textField6.text = game.sixes()
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
            onClicked: {
                if (!checkBox1.checked) {
                    textField7.text = game.getDice1()
                }
                if (!checkBox2.checked) {
                    textField8.text = game.getDice2()
                }
                if (!checkBox3.checked) {
                    textField9.text = game.getDice3()
                }
                if (!checkBox4.checked) {
                    textField10.text = game.getDice4()
                }
                if (!checkBox5.checked) {
                    textField11.text = game.getDice5()
                }
            }
        }

        TextField {
            id: textField7
            x: 8
            y: 445
            width: 61
            height: 64
            placeholderText: qsTr("Dice 1")
        }

        TextField {
            id: textField8
            x: 83
            y: 445
            width: 61
            height: 64
            readOnly: true
            placeholderText: qsTr("Dice 2")
        }

        TextField {
            id: textField9
            x: 166
            y: 445
            width: 61
            height: 64
            readOnly: true
            placeholderText: qsTr("Dice 3")
        }

        TextField {
            id: textField10
            x: 245
            y: 445
            width: 61
            height: 64
            readOnly: true
            placeholderText: qsTr("Dice 4")
        }

        TextField {
            id: textField11
            x: 319
            y: 445
            width: 61
            height: 64
            readOnly: true
            placeholderText: qsTr("Dice 5")
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
        }

        Button {
            id: button10
            x: 245
            y: 112
            width: 125
            text: qsTr("Four of a kind")
        }

        Button {
            id: button11
            x: 245
            y: 153
            width: 125
            height: 27
            text: qsTr("Full house")
        }

        Button {
            id: button12
            x: 245
            y: 194
            width: 125
            text: qsTr("Small sequence")
        }

        Button {
            id: button13
            x: 245
            y: 232
            text: qsTr("Large sequence")
        }

        Button {
            id: button14
            x: 245
            y: 270
            width: 125
            text: qsTr("Chance")
        }

        Button {
            id: button15
            x: 245
            y: 308
            width: 125
            text: qsTr("GENERALA")
        }

        TextField {
            id: textField12
            x: 384
            y: 74
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textField13
            x: 384
            y: 112
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textField14
            x: 384
            y: 153
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textField15
            x: 384
            y: 194
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textField16
            x: 384
            y: 232
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textField17
            x: 384
            y: 270
            width: 40
            height: 27
            readOnly: true
            placeholderText: qsTr("0")
        }

        TextField {
            id: textField18
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
            onClicked: game.aces()
        }
}
