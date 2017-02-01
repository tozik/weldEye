import QtQuick 2.7
import QtCharts 2.1
import QtQuick.Controls 2.0


TemplateSetForm {
    id:templateSet
    Rectangle {

            anchors.fill: parent
            border.color: "blue"
            color:"transparent"
            border.width: 2
            Column{
                id:templateSettings
                anchors.top:parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                height: parent.height/3
                Rectangle{anchors.fill: parent; border.color: "red"}
                    Row{
                        id:globalParametrsTemplate
                        anchors.top:parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 2
                        height: parent.height/2
                        Rectangle{anchors.fill: parent; border.color: "blue"}
                        Row {
                            spacing: 10
                            Column{
                                Rectangle{color: "red";border.width: 10;border.color: "red"; radius: 20;}
                                Label{
                                    id:labelSizeBetweenPoints
                                    text: qsTr("Max distanse between points")
                                }
                                TextField{
                                     id:sizeBetweenPoints

                                }
                            }
                            Column{

                                id: name
                                Label{
                                    id:labelMaxHalfWidtg
                                    text: qsTr("Max half width")
                                }
                                TextField{
                                     id:maxHalfWidth


                                }
                            }

                        }

                    }
                    Row{
                        id:localParametrsTemplate
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.margins: 2
                        anchors.top: globalParametrsTemplate.bottom
                        Rectangle{anchors.fill: parent; border.color: "green"}
                    }
            }
            Column{
                id:viewTemplate
                anchors.top: templateSettings.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 10
                Rectangle{anchors.fill: parent;color: "transparent"; border.color: "steelblue"}

                Canvas {
                    id: ex
                    anchors.fill: parent

                onPaint: {
                    var ctx = getContext("2d")

                    // setup the stroke
                    ctx.strokeStyle = "red"


                    // create a path
                    ctx.beginPath()
                    ctx.moveTo(1,1)
                    ctx.lineTo(300,350)
                    ctx.moveTo(300,350)
                    ctx.lineTo(600,1)

                    // stroke path
                    ctx.stroke()
                }
            }
            }
        }
}

