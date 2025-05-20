// File: CommonButtons.qml
import QtQuick 2.6
import QtQuick.Controls 2.4

Rectangle {
    id: root
    property string normalSource: ""
    property string toggledSource: ""
    property bool toggled: false
    property real buttonWidth: 40  // có thể tùy chỉnh từ main.qml

    width: buttonWidth
    height: buttonWidth
    color: "transparent"

    Image {
        id: iconImage
        anchors.centerIn: parent
        source: toggled ? toggledSource : normalSource
        fillMode: Image.PreserveAspectFit
        width: parent.width
        height: width/2
    }

    MouseArea {
        anchors.fill: iconImage
        hoverEnabled: true

        onEntered: {
            iconImage.source = toggled ? normalSource : toggledSource
        }

        onExited: {
            iconImage.source = toggled ? toggledSource : normalSource
        }

        onClicked: {
            toggled = !toggled
            iconImage.source = toggled ? toggledSource : normalSource
        }
    }
}
