import QtQuick 2.0
import QtQuick.Controls 2.2

Row {
    property double elementWidth: labelSizeBetweenPoints.width+10;
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
                                        anchors.bottom: templateSettings.top
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
//        Rectangle{
//            id:rectMaxHalfWidth
//            color: "transparent"
//            border.width: 2
//            border.color: "gainsboro"
//            radius: 5
//            height:parent.height
//            width:elementWidth
//            Label{
//                id:labelMaxHalfWidth
//                                        anchors.horizontalCenter: rectMaxHalfWidth.horizontalCenter
//                                        anchors.bottom: labelSizeBetweenPoints.top
//                text: qsTr("Maximal half width")
//            }
//            TextField{
//                 id:sizeMaxHalfWidth
//                                         anchors.horizontalCenter: rectMaxHalfWidth.horizontalCenter
//                                         anchors.verticalCenter: rectMaxHalfWidth.verticalCenter
//                 horizontalAlignment: "AlignHCenter"
//                 validator: RegExpValidator {
//                     regExp:/\d+$/
//                 }

//            }
//        }
//        Rectangle{
//            id:rectMinimalLineLength
//            color: "transparent"
//            border.width: 2
//            border.color: "gainsboro"
//            radius: 5
//            height:parent.height
//            width:elementWidth
//            Label{
//                id:labelMinimalLineLength
//                                        anchors.horizontalCenter: rectMinimalLineLength.horizontalCenter
//                                        anchors.bottom: labelMinimalLineLength.top
//                text: qsTr("Minimal line length")

//            }
//            TextField{
//                 id:sizeMinimalLineLength
//                                         anchors.horizontalCenter: rectMinimalLineLength.horizontalCenter
//                                         anchors.verticalCenter: rectMinimalLineLength.verticalCenter
//                 horizontalAlignment: "AlignHCenter"
//                 validator: RegExpValidator {
//                     regExp:/\d+$/
//                 }

//            }
//        }
//        Rectangle{
//            id:rectCircleKoeficietn
//            color: "transparent"
//            border.width: 2
//            border.color: "gainsboro"
//            radius: 5
//            height:parent.height
//            width:elementWidth
//            Label{
//                id:labelCircleKoeficietn
//                                        anchors.horizontalCenter: rectCircleKoeficietn.horizontalCenter
//                                        anchors.bottom: labelCircleKoeficietn.top
//                text: qsTr("Circle koeficient ")
//            }
//            TextField{
//                 id:sizeCircleKoeficietn
//                                         anchors.horizontalCenter: rectCircleKoeficietn.horizontalCenter
//                                         anchors.verticalCenter: rectCircleKoeficietn.verticalCenter
//                 horizontalAlignment: "AlignHCenter"
//                 validator: RegExpValidator {
//                     regExp:/\d+$/
//                 }

//            }
//        }
        Button{
            id:applyGlobalChanges
            text:qsTr("Apply global parametrs")
            onClicked: {}
            y:globalParametrsTemplate.height/2-applyGlobalChanges.height/2
        }


}
