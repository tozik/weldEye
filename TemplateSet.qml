import QtQuick 2.7
import QtCharts 2.1
import QtQuick.Controls 2.0



TemplateSetForm {
    property double elementWidth: labelSizeBetweenPoints.width+10;
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
                Rectangle{anchors.fill: parent; border.color: "white"}
                    Row{
                        id:globalParametrsTemplate
                        anchors.top:parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 2
                        height: parent.height/2
                        Rectangle{anchors.fill: parent; border.color: "aliceblue"}
                        Row {
                            anchors.fill: parent
                            anchors.margins: 2
                            spacing: 50

                                Rectangle{
                                    id:rectSizeBetweenPoints
                                    color: "transparent"
                                    border.width: 2
                                    border.color: "gainsboro"
                                    radius: 5
                                    height:parent.height
                                    width:elementWidth

                                    Label{
                                        id:labelSizeBetweenPoints
                                        anchors.horizontalCenter: rectSizeBetweenPoints.horizontalCenter
                                        anchors.bottom: labelSizeBetweenPoints.top
                                        text: qsTr("Max distanse between points")
                                    }
                                    TextField{
                                         id:sizeBetweenPoints
                                         anchors.horizontalCenter: rectSizeBetweenPoints.horizontalCenter
                                         anchors.verticalCenter: rectSizeBetweenPoints.verticalCenter
                                         horizontalAlignment: "AlignHCenter"
                                         validator: RegExpValidator {
                                             regExp:/\d+$/
                                         }

                                    }
                                }
                                Rectangle{
                                    id:rectMaxHalfWidth
                                    color: "transparent"
                                    border.width: 2
                                    border.color: "gainsboro"
                                    radius: 5
                                    height:parent.height
                                    width:elementWidth
                                    Label{
                                        id:labelMaxHalfWidth
                                        anchors.horizontalCenter: rectMaxHalfWidth.horizontalCenter
                                        anchors.bottom: labelSizeBetweenPoints.top
                                        text: qsTr("Maximal half width")
                                    }
                                    TextField{
                                         id:sizeMaxHalfWidth
                                         anchors.horizontalCenter: rectMaxHalfWidth.horizontalCenter
                                         anchors.verticalCenter: rectMaxHalfWidth.verticalCenter
                                         horizontalAlignment: "AlignHCenter"
                                         validator: RegExpValidator {
                                             regExp:/\d+$/
                                         }

                                    }
                                }
                                Rectangle{
                                    id:rectMinimalLineLength
                                    color: "transparent"
                                    border.width: 2
                                    border.color: "gainsboro"
                                    radius: 5
                                    height:parent.height
                                    width:elementWidth
                                    Label{
                                        id:labelMinimalLineLength
                                        anchors.horizontalCenter: rectMinimalLineLength.horizontalCenter
                                        anchors.bottom: labelMinimalLineLength.top
                                        text: qsTr("Minimal line length")

                                    }
                                    TextField{
                                         id:sizeMinimalLineLength
                                         anchors.horizontalCenter: rectMinimalLineLength.horizontalCenter
                                         anchors.verticalCenter: rectMinimalLineLength.verticalCenter
                                         horizontalAlignment: "AlignHCenter"
                                         validator: RegExpValidator {
                                             regExp:/\d+$/
                                         }

                                    }
                                }
                                Rectangle{
                                    id:rectCircleKoeficietn
                                    color: "transparent"
                                    border.width: 2
                                    border.color: "gainsboro"
                                    radius: 5
                                    height:parent.height
                                    width:elementWidth
                                    Label{
                                        id:labelCircleKoeficietn
                                        anchors.horizontalCenter: rectCircleKoeficietn.horizontalCenter
                                        anchors.bottom: labelCircleKoeficietn.top
                                        text: qsTr("Circle koeficient ")
                                    }
                                    TextField{
                                         id:sizeCircleKoeficietn
                                         anchors.horizontalCenter: rectCircleKoeficietn.horizontalCenter
                                         anchors.verticalCenter: rectCircleKoeficietn.verticalCenter
                                         horizontalAlignment: "AlignHCenter"
                                         validator: RegExpValidator {
                                             regExp:/\d+$/
                                         }

                                    }
                                }
                                Button{
                                    id:applyGlobalChanges
                                    text:qsTr("Apply global parametrs")
                                    onClicked: {}
                                    y:globalParametrsTemplate.height/2-applyGlobalChanges.height/2
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



//}
//Column{
//Label{
//    id:labelMaxHalfWidtg
//    text: qsTr("Max half width")
//}
//TextField{
//     id:maxHalfWidth
//     anchors.horizontalCenter: labelMaxHalfWidtg.horizontalCenter

//}
//}
//Column{
//Label{
//    id:labelMinLineLenth
//    text: qsTr("Max half width")
//}
//TextField{
//     id:minLineLength
//     anchors.horizontalCenter: labelMinLineLenth.horizontalCenter

//}
//}
//Column{
//Label{
//    id:labelCircleCoefficient
//    text: qsTr("Max half width")
//}
//TextField{
//     id:circleCoefficient
//     anchors.horizontalCenter: circleCoefficient.horizontalCenter

//}
//}
//Button{id:applyGlobalChanges;text:qsTr("Allpy settings")}
