import QtQuick 2.7
import QtCharts 2.1
import QtQuick.Controls 2.0



TemplateSetForm {
    id:templateSet
    Rectangle {

            anchors.fill: parent
            border.color: "white"
            border.width: 2
            Rectangle{
                id:templateSettings
                anchors.top:parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 10
                height: parent.height/3
                Rectangle{anchors.fill: parent;}
                    Rectangle{
                        id:globalParametrsTemplate
                        anchors.top:parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 2
                        height: parent.height/2
                        Rectangle{anchors.fill: parent; border.color: "transparent"; color:"whitesmoke"; radius: 15}
                            GlobalTemplateParametrs
                            {

                            }
                    }
                    Rectangle{
                        id:templateList
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.margins: 2
                        anchors.top: globalParametrsTemplate.bottom
                        Rectangle{
                            id:templateRect
                            anchors.fill: parent; border.color: "transparent"; color: "whitesmoke";radius:15
                            Template
                            {

                            }
                        }

                    }
            }
            Rectangle{
                id:viewTemplate
                anchors.top: templateSettings.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                Rectangle{anchors.fill: parent;color: "transparent"; border.color: "transparent"}

                ChartView {
                    id:templateView
                    anchors.fill: parent
                    antialiasing: true
                    backgroundRoundness: 10
                    // @disable-check M17
                    legend.visible: false
                    backgroundColor: "	whitesmoke"

                    ValueAxis
                    {   id: valueAxisX
                        visible: false
                        min:0
                        max:10
                    }
                    ValueAxis
                    {
                        id:valueAxisY
                        visible: false
                        min:0
                        max:10
                    }
                    SplineSeries {
                        pointsVisible: true
                        axisX: valueAxisX
                        axisY: valueAxisY
                        XYPoint { x: 0; y: 10 }
                        XYPoint { x: 4; y: 1.5 }
                        XYPoint { x: 5; y: 0 }
                        XYPoint { x: 6; y: 1.5 }
                        XYPoint { x: 10; y: 10}
                    }
                    SplineSeries {
                        pointsVisible: true
                        axisX: valueAxisX
                        axisY: valueAxisY
                        XYPoint { x: 0; y: 8 }
                        XYPoint { x: 4; y: 1.5 }
                        XYPoint { x: 5; y: 0 }
                        XYPoint { x: 6; y: 1.5 }
                        XYPoint { x: 10; y: 8}

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
