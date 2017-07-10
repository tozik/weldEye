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
    anchors.right: parent.right
    width: parent.width/2
    height: parent.height/4

    Rectangle{
        anchors.fill: parent
        color: "transparent"
        border.color: "red"
        border.width: 10


        Row
        {
            spacing: 30

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
