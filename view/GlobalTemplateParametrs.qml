import QtQuick 2.0
import QtQuick.Controls 2.2

Row {
    property double elementWidth: labelSizeBetweenPoints.width/2;
    anchors.fill: parent
    anchors.margins: 2
    spacing: 50


        Rectangle{
            id:rectSizeBetweenPoints
            color: "transparent"
            border.color: "gainsboro"
            radius: 10
            height:parent.height/3
            width:elementWidth*4
            Row{
                spacing: 10
                Column{

                    Label{
                        id:labelSizeBetweenPoints
                        text: qsTr("Max distanse")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Label{
                        id:labelSizeBetweenPoints2
                        text: qsTr("between points")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }


                 }
                TextField{
                    id:sizeBetweenPoints
                    width: elementWidth
                    horizontalAlignment: "AlignHCenter"
                    maximumLength: 4

                    validator: RegExpValidator
                    {
                         regExp:/\d+$/
                    }

                }
             }
           }
        Rectangle{
            id:rectMaxHalfWidth
            color: "transparent"
            border.width: 2
            border.color: "gainsboro"
            radius: 10
            height:parent.height/3
            width:elementWidth*4
            Row{
                spacing: 10
                Column{

                    Label{
                        id:labelMaxHalfWidth
                        text: qsTr("Max half")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Label{
                        id:labelMaxHalfWidth2
                        text: qsTr("width")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }


                 }
                TextField{
                    id:sizeMaxHalfWidth
                    width: elementWidth
                    horizontalAlignment: "AlignHCenter"
                    maximumLength: 4

                    validator: RegExpValidator
                    {
                         regExp:/\d+$/
                    }

                }
             }
           }
        Rectangle{
            id:rectMinimalLineLength
            color: "transparent"
            border.width: 2
            border.color: "gainsboro"
            radius: 10
            height:parent.height/3
            width:elementWidth*4
            Row{
                spacing: 10
                Column{

                    Label{
                        id:labelMinimalLineLength
                        text: qsTr("Minimal line")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Label{
                        id:labelMinimalLineLength2
                        text: qsTr("length")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }


                 }
                TextField{
                    id:sizeMinimalLineLength
                    width: elementWidth
                    horizontalAlignment: "AlignHCenter"
                    maximumLength: 4

                    validator: RegExpValidator
                    {
                         regExp:/\d+$/
                    }

                }
             }
           }
        Rectangle{
            id:rectCircleKoeficietn
            color: "transparent"
            border.width: 2
            border.color: "gainsboro"
            radius: 10
            height:parent.height/3
            width:elementWidth*4
            Row{
                spacing: 10
                Column{

                    Label{
                        id:labelCircleKoeficietn
                        text: qsTr("Circle ")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Label{
                        id:labelCircleKoeficietn2
                        text: qsTr("koeficient")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }


                 }
                TextField{
                    id:sizeCircleKoeficietn
                    width: elementWidth
                    horizontalAlignment: "AlignHCenter"
                    maximumLength: 4

                    validator: RegExpValidator
                    {
                         regExp:/\d+$/
                    }

                }
             }
           }


        Button{
            id:applyGlobalChanges
            text:qsTr("Apply")
            onClicked: {}
//            y:globalParametrsTemplate.height/2-applyGlobalChanges.height/2
        }


}
