import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    property int userScore: 0
    property int computerScore: 0

    Rectangle {
        anchors.fill: parent
        anchors.leftMargin: userBadge.width*.5
        anchors.rightMargin: compBadge.width*.5
        color: "transparent"
        border.width: 2
        border.color: "white"
    }



    Label {
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: userScore + " : " + computerScore
        font.pixelSize: 36
        color: "white"
    }
    Badge {
        id: userBadge
        text: "user"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
    }
    Badge {
        id: compBadge
        text: "comp"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
    }

}
