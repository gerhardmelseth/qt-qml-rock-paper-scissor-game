import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "RockPaperScissor.js" as RockPaperScissor

Window {
    id: root
    width: 480
    height: 640
    visible: true
    title: qsTr("Rock Paper Scissors Game")
    Page {
        id: page
        anchors.fill: parent
        title: "Rock Paper Scissors"
        header: Rectangle {
            height: 60
            width: parent.width
            color: "transparent"
            Label {
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: page.title
                font.pixelSize: 36

            }
        }
        Rectangle {
            color: "#37474F"
            anchors.fill: parent
            ColumnLayout {
                spacing: 20
                anchors.fill: parent
                anchors.margins: 20
                ScoreBoard {
                    id: scoreboard
                    Layout.preferredWidth: 220
                    Layout.preferredHeight: 80
                    Layout.alignment: Qt.AlignCenter
                }

                Label {
                    id: resultLabel
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    font.pixelSize: 48
                    font.bold: true
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "You win!"
                }

                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 90
                    RowLayout {
                        anchors.fill: parent
                        spacing: 40
                        Item {
                            Layout.fillWidth: true
                        }

                        RoundButton {
                            text: "Rock"
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                            Layout.preferredHeight: 60
                            Layout.preferredWidth: 60
                            onClicked: root.doTheMath(RockPaperScissor.rock)
                        }
                        RoundButton {
                            text: "Paper"
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                            Layout.preferredHeight: 60
                            Layout.preferredWidth: 60
                            onClicked: root.doTheMath(RockPaperScissor.paper)
                        }
                        RoundButton {
                            text: "Scissor"
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                            Layout.preferredHeight: 60
                            Layout.preferredWidth: 60
                            onClicked: root.doTheMath(RockPaperScissor.scissor)
                        }
                        Item {
                            Layout.fillWidth: true
                        }
                    }
                }
                Label {
                    Layout.fillWidth: true
                    font.pixelSize: 24
                    font.bold: true
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Make your move"
                }
                Item { Layout.fillHeight: true }
            }
        }
    }
    function doTheMath(myResult) {
        let computerResult = RockPaperScissor.getComputerResult();

        if(computerResult === myResult) {
            resultLabel.text = RockPaperScissor.getText(myResult) + " does not beat " + RockPaperScissor.getText(computerResult) + ".. Draw!"
        }
        else if((myResult === RockPaperScissor.rock && computerResult === RockPaperScissor.scissor) || (myResult === RockPaperScissor.scissor && computerResult === RockPaperScissor.paper) || (myResult === RockPaperScissor.paper && computerResult === RockPaperScissor.rock)) {
            resultLabel.text = RockPaperScissor.getText(myResult) + " beats " + RockPaperScissor.getText(computerResult) + ".. You win!"
            scoreboard.userScore += 1;
        }
        else  {
            resultLabel.text = RockPaperScissor.getText(myResult) + " does not beat " + RockPaperScissor.getText(computerResult) + ".. You loose!"
            scoreboard.computerScore += 1;
        }

    }
}
