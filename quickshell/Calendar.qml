import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Wayland

import "CalendarUtils.js" as CalendarUtils

PanelWindow {
    id: root
    visible: false
    width: 300
    implicitHeight: mainColumn.implicitHeight - 44
    exclusiveZone: 0
    color: "transparent"

    anchors{
        top: true
    }
    margins{
        top: 0
    }
    
    property int currentDay
    property int currentMonth
    property string currentMonthName
    property int currentYear
    property var gridModel: []

    Component.onCompleted: {
        currentDay = CalendarUtils.getToday()
        currentMonth = CalendarUtils.getCurrentMonth()
        currentMonthName = CalendarUtils.getMonthName(currentMonth)
        currentYear = CalendarUtils.getCurrentYear()
        gridModel = CalendarUtils.buildGridLayout(currentMonth, currentYear)
    }

    Rectangle{
        id: content
        anchors.fill: parent
        radius: 10 
        color: "#cd101621"
        border.width: 2
        border.color: "#857A6D"

        ColumnLayout{
            anchors.fill: parent
            id: mainColumn
            anchors.centerIn: parent
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 10
            }

            RowLayout{
                Layout.fillWidth: true

                Text{
                    text: ""
                    color: "#d6d7bf"
                    font.pixelSize: 18
                    leftPadding: 10
                }

                Text {
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                    text: currentDay.toString().padStart(2, "0") + " " + currentMonthName + " " + currentYear
                    color: "#d6d7bf"
                    font.pixelSize: 18
                }

                Text{
                    text: ""
                    font.pixelSize: 18
                    color: "#d6d7bf"
                    rightPadding: 10
                }
            }

            RowLayout{
                Layout.topMargin: 12
                Layout.fillWidth: true
                Repeater{
                    model: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]                
                    Text{
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignHCenter
                        text: modelData
                        color: "#d6d7bf"
                    }
                }
            }

            GridLayout{
                Layout.fillWidth: true
                columns: 7
                rowSpacing: 2
                columnSpacing: 2

                Repeater{
                    model: root.gridModel

                    Item{
                        Layout.fillWidth: true
                        implicitHeight: 30

                        Rectangle{
                            width: parent.width * 0.8
                            height: parent.width * 0.8
                            anchors.centerIn: parent

                            color: modelData.day === root.currentDay ? "#d6d7bf" : "transparent"
                            radius: 10

                            Text{
                                anchors.centerIn: parent
                                text: modelData.day > 0 ? modelData.day : ""
                                color: modelData.day === root.currentDay && modelData.isCurrentMonth ? "#101621" : "#d6d7bf"
                            }
                        }
                        MouseArea{
                            id: mouseArea
                            hoverEnabled: true
                            anchors.fill: parent
                        }
                    }

                   
                }
            }
        }


    }


    IpcHandler{
        target: "calendar"

        function toggle(): void{
            root.visible = !root.visible 
        }

        function open(): void{
            root.visible = true
        }

        function close(): void{
            root.visible = false
        }



    }
}

