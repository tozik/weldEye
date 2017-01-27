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

                ChartView{
                    id:templateView

                    anchors.fill: parent
                    antialiasing: true
                    axes: false
                    LineSeries{

                                XYPoint { x: 0; y: 0 }
                                XYPoint { x: 1.1; y: 2.1 }
                                XYPoint { x: 1.9; y: 3.3 }
                                XYPoint { x: 2.1; y: 2.1 }
                    }
                }
            }
        }
}

