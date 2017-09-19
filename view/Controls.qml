import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

ControlsForm {
    id:controls

    signal udpOFF
    signal udpOn
    signal tcpOff
    signal tcpOn

    anchors.top: parent.top
    anchors.right: chart.left
    height: parent.height/4

    Rectangle{
        anchors.fill: parent
        color: "transparent"
        border.color: "red"
        border.width: 0


        Row
        {
            spacing: 10

            ButtonsConnectionScaner
            {
            }


            ControlsConnetcionRobot
            {
            }

            ControlsSettingsScaner
            {
            }
        }

    }
    //                Button
    //                {
    //                    text: qsTr("test button server start")
    //                    onClicked: {objServer.startServer()}

    //                }
    //                Button
    //                {
    //                text:qsTr("test close server")
    //                onClicked: {objServer.closeServer()}}
}
