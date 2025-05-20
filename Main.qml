import QtQuick 2.6
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    //visibility: "FullScreen"
    title: qsTr("Media Player")

    property bool isClickedRepeat: false
    property bool isPressedRepeat: false
    property bool isPlaying: false
    //Background of Application
    Rectangle {
        anchors.fill: parent
        color: "#2c3e50"

        //Background Image
        Image {
            source: "qrc:/Image/background.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop

        }
    }

    //Header
    Rectangle {
        id: header
        width: parent.width
        height: parent.height * 0.13
        color: "transparent"

        Image {
            source: "qrc:/Image/background.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop

        }

        Text {
            anchors.centerIn: parent
            text: "Media Player"
            font.pixelSize: Math.min(parent.width/2, parent.height/2)
            color: "white"
        }
    }

    ColumnLayout {
        id: mainLayout
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        RowLayout {
            anchors.fill: parent
            spacing: 0

            Rectangle {
                id: playList
                Layout.preferredWidth: parent.width * 0.35
                Layout.fillHeight: true
                color: "transparent"

                Image {
                    source: "qrc:/Image/playlist_item.png"
                    width: parent.width
                    height: parent.height/5

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        text: "Playlist Item"

                        color: Qt.rgba(1, 1, 1, 0.5)
                        font.pixelSize: Math.min(playList.width/16, playList.height/16)
                    }

                }
            }

            Rectangle {
                Layout.preferredWidth: parent.width * 0.65  // 66%
                Layout.fillHeight: true
                color: "transparent"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    Rectangle {
                        Layout.preferredHeight: parent.height * 0.10
                        Layout.fillWidth: true
                        color: "transparent"

                        RowLayout{
                            anchors.fill: parent
                            spacing: 0

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.9
                                Layout.fillHeight: true
                                color: "transparent"

                                Image {
                                    source: "qrc:/Image/PhoKhongMua_BAT.png"
                                    anchors.top: parent.top
                                    anchors.left: parent.left

                                    anchors.topMargin: 10
                                    anchors.leftMargin: 10

                                    width: Math.min(parent.width/2, parent.height*3)
                                    height: width/4
                                }
                            }


                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.05
                                Layout.fillHeight: true
                                color: "transparent"

                                Image {
                                    source: "qrc:/Image/music.png"
                                    anchors.centerIn: parent
                                    width: Math.min(parent.width/2, parent.height/2)
                                    height: width
                                }
                            }
                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.05
                                Layout.fillHeight: true
                                color: "transparent"

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    text: "3"
                                    font.bold: true
                                    font.pixelSize: Math.min(parent.width/2, parent.height/2)
                                    color: Qt.rgba(1, 1, 1, 0.5)
                                }
                            }
                        }



                    }


                    //Ảnh bài hát
                    Rectangle {
                        Layout.preferredHeight: parent.height * 0.50
                        Layout.fillWidth: true
                        color: "transparent"

                        // Lề trái và phải 15
                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 15
                            anchors.rightMargin: 35
                            spacing: 5

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.3
                                Layout.fillHeight: true
                                color: "transparent"

                                Image {
                                    source: "qrc:/Image/BuiAnhTuan.png"
                                    anchors.centerIn: parent
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                }
                            }

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.4
                                Layout.fillHeight: true
                                color: "transparent"

                                Image {
                                    source: "qrc:/Image/Hongkong1.png"
                                    anchors.centerIn: parent
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                }
                            }

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.3
                                Layout.fillHeight: true
                                color: "transparent"

                                Image {
                                    source: "qrc:/Image/HaAnhTuan.png"
                                    anchors.centerIn: parent
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                }
                            }
                        }
                    }


                    //
                    Rectangle {
                        Layout.preferredHeight: parent.height * 0.15
                        Layout.fillWidth: true
                        color: "transparent"

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 50
                            anchors.rightMargin: 50
                            spacing: 5

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.1
                                Layout.fillHeight: true
                                color: "transparent"

                                Text {
                                    anchors.centerIn: parent
                                    text: "00:00"
                                    font.pixelSize: Math.min(parent.width/4, parent.height/4)
                                    color: Qt.rgba(1, 1, 1, 0.5)
                                }

                            }

                            //thanh âm thanh
                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.8
                                Layout.fillHeight: true
                                color: "transparent"

                                Image {
                                    id: progressBar
                                    source: "qrc:/Image/progress_bar_bg.png"
                                    anchors.centerIn: parent
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                }


                                Image {
                                    source: "qrc:/Image/progress_bar.png"
                                    anchors.left: parent.left
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: parent.width * 0.15
                                    height: parent.height
                                    fillMode: Image.PreserveAspectFit
                                }


                                Image {
                                    source: "qrc:/Image/point.png"
                                    anchors.verticalCenter: progressBar.verticalCenter
                                    anchors.left: progressBar.left
                                    anchors.leftMargin: parent.width * 0.15
                                    width: parent.width * 0.03
                                    height: parent.height
                                    fillMode: Image.PreserveAspectFit
                                }
                            }

                            //thời gian

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.1
                                Layout.fillHeight: true
                                color: "transparent"

                                Text {
                                    anchors.centerIn: parent
                                    text: "00:00"
                                    font.pixelSize: Math.min(parent.width/4, parent.height/4)
                                    color: Qt.rgba(1, 1, 1, 0.5)
                                }

                            }
                        }
                    }



                    //điều khiển
                    Rectangle {
                        Layout.preferredHeight: parent.height * 0.20
                        Layout.fillWidth: true
                        color: "transparent"

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 50
                            anchors.rightMargin: 50
                            spacing:0

                            //nút suffle
                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.15
                                Layout.fillHeight: true
                                color: "transparent"

                                Rectangle {
                                    width: parent.width
                                    height: parent.height
                                    color: "transparent"

                                    Image {
                                        id: mainShuffleImage
                                        anchors.centerIn: parent

                                        source: "qrc:/Image/shuffle.png"
                                        fillMode: Image.PreserveAspectFit
                                        width: parent.width
                                        height: width
                                    }

                                    MouseArea {
                                        anchors.fill: mainShuffleImage
                                        hoverEnabled: true

                                        property bool toggled: false
                                        property string normalSource: "qrc:/Image/shuffle.png"
                                        property string toggledSource: "qrc:/Image/shuffle-1.png"

                                        onEntered: {
                                            if (toggled) {
                                                mainShuffleImage.source = normalSource
                                            } else {
                                                mainShuffleImage.source = toggledSource
                                            }
                                        }

                                        onExited: {
                                            if (toggled) {
                                                mainShuffleImage.source = toggledSource
                                            } else {
                                                mainShuffleImage.source = normalSource
                                            }
                                        }

                                        onClicked: {
                                            toggled = !toggled
                                            if (toggled) {
                                                mainShuffleImage.source = toggledSource
                                            } else {
                                                mainShuffleImage.source = normalSource
                                            }
                                        }
                                    }
                                }
                            }



                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.25
                                Layout.fillHeight: true
                                color: "transparent"

                                Image {
                                    id: imgPrev
                                    source: mouseAreaPrev.containsMouse ? "qrc:/Image/hold-prev.png" : "qrc:/Image/prev.png"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    width: parent.width * 0.5
                                    height: width
                                    fillMode: Image.PreserveAspectFit
                                }

                                MouseArea {
                                    id: mouseAreaPrev
                                    anchors.fill: parent
                                    hoverEnabled: true  // Bắt sự kiện hover
                                }
                            }


                            //Đầu nút play
                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.2
                                Layout.fillHeight: true
                                color: "transparent"



                                MouseArea {
                                    id: mouseArea
                                    anchors.fill: parent
                                    hoverEnabled: true

                                    onClicked: {
                                        isPlaying = !isPlaying
                                    }
                                }

                                // Image mặc định (play hoặc pause)
                                Image {
                                    id: playImage
                                    anchors.fill: parent
                                    anchors.centerIn: parent
                                    fillMode: Image.PreserveAspectFit

                                    // Chọn ảnh play hoặc pause tùy trạng thái isPlaying
                                    source: isPlaying ? "qrc:/Image/pause.png" : "qrc:/Image/play.png"

                                    // Khi hover thì giảm opacity để lộ holdPlayImage
                                    opacity: mouseArea.containsMouse ? 0 : 1

                                    Behavior on opacity {
                                        OpacityAnimator {
                                            duration: 300
                                        }
                                    }
                                }

                                // Image hover (hold-play hoặc hold-pause)
                                Image {
                                    id: holdPlayImage
                                    anchors.fill: parent
                                    anchors.centerIn: parent
                                    fillMode: Image.PreserveAspectFit

                                    // Chọn ảnh hold-play hoặc hold-pause tùy trạng thái isPlaying
                                    source: isPlaying ? "qrc:/Image/hold-pause.png" : "qrc:/Image/hold-play.png"

                                    // Khi hover thì hiện, không hover thì ẩn
                                    opacity: mouseArea.containsMouse ? 1 : 0

                                    Behavior on opacity {
                                        OpacityAnimator {
                                            duration: 300
                                        }
                                    }
                                }
                            }

                            //cuối nút play

                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.25
                                Layout.fillHeight: true
                                color: "transparent"

                                Image {
                                    id: imgNext
                                    source: mouseAreaNext.containsMouse ? "qrc:/Image/hold-next.png" : "qrc:/Image/next.png"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    width: parent.width * 0.5
                                    height: width
                                    fillMode: Image.PreserveAspectFit
                                }

                                MouseArea {
                                    id: mouseAreaNext
                                    anchors.fill: parent
                                    hoverEnabled: true
                                }
                            }

                            //repeat button
                            Rectangle {
                                Layout.preferredWidth: parent.width * 0.15
                                Layout.fillHeight: true
                                color: "transparent"

                                // Bên trong đây mình nhúng đoạn ApplicationWindow (đã lược bớt thành Rectangle chứa Image và MouseArea)
                                Rectangle {
                                    width: parent.width
                                    height: parent.height
                                    color: "transparent"

                                    Image {
                                        id: mainRepeatImage
                                        anchors.centerIn: parent
                                        source: "qrc:/Image/repeat.png"
                                        fillMode: Image.PreserveAspectFit
                                        width: parent.width
                                        height: width
                                    }

                                    MouseArea {
                                        anchors.fill: mainRepeatImage
                                        hoverEnabled: true

                                        property bool toggled: false
                                        property string normalSource: "qrc:/Image/repeat.png"
                                        property string toggledSource: "qrc:/Image/repeat1_hold.png"

                                        onEntered: {
                                            if (toggled) {
                                                mainRepeatImage.source = normalSource
                                            } else {
                                                mainRepeatImage.source = toggledSource
                                            }
                                        }

                                        onExited: {
                                            if (toggled) {
                                                mainRepeatImage.source = toggledSource
                                            } else {
                                                mainRepeatImage.source = normalSource
                                            }
                                        }

                                        onClicked: {
                                            toggled = !toggled
                                            if (toggled) {
                                                mainRepeatImage.source = toggledSource
                                            } else {
                                                mainRepeatImage.source = normalSource
                                            }
                                        }
                                    }
                                }
                            }
                            //xong repeat button



                        }


                    }
                    Rectangle {
                        Layout.preferredHeight: parent.height * 0.05
                        Layout.fillWidth: true
                        color: "transparent"
                    }
                }

            }
        }

    }


}
