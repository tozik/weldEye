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
                    ctx.lineTo(150,50)
                    ctx.moveTo(300,1)
                    ctx.lineTo(150,50)

                    // stroke path
                    ctx.stroke()
                }
            }
            }
        }
}

