import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

ControlsForm {
    id:controls
    height: 300

    signal udpOFF
    signal udpOn
    signal tcpOff
    signal tcpOn

     Column
     {
         spacing: 30
         Row
            {
                spacing: 100
                Row
                {
                    spacing: 10

                        Button
                        {
                            id:udpButton
                            width: 160
                            property bool connectUdp: true
                            text: connectUdp ? "UDP Connection" :"UDP Disconnection"
                            onClicked:
                                {

                                    udpButton.connectUdp=!udpButton.connectUdp;                             //twice button
                                    connectUdp ? tcpButton.enabled=true : tcpButton.enabled=false           //if press tsp dismis udpButton
                                    !connectUdp ? deviceScaner.search() & deviceScaner.connectionTO() & (window.statusScaner=true)
                                                : deviceScaner.disconnection() & deviceScaner.releaseMemory() & (window.statusScaner=false)
                                                 console.log("status",statusScaner)
                                }

                        }
                        Button
                        {
                            id:tcpButton
                            width: 160
                            property bool connectTcp: true
                            text: connectTcp ? "TCP Connection": "TCP Disconnection"
                            onClicked:
                                {
                                tcpButton.connectTcp=!tcpButton.connectTcp                                  //twice button
                                connectTcp ? udpButton.enabled=true : udpButton.enabled=false               // if press udpButton dismis tcp
                                }
                        }
                }

        Row
        {
            id:ipDevice
            spacing: 10
            ComboBox {

                model: ["Fanuc USI", "Kawasaki", "Kuka"]
                currentIndex: 0
                onCurrentIndexChanged: console.debug(currentIndex)
            }
            TextField
            {
                id:firstIP
                width: 50
                maximumLength: 3
                validator: RegExpValidator
                {
                    regExp: /^((?:[0-1]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])\.){0,3}(?:[0-1]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])$/
                }
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"

            }
            Label{y:20;text: qsTr(".")}
            TextField
            {
                id:secondIP
                width: 50
                maximumLength:3
                validator: RegExpValidator
                {
                    regExp: /0-255/
                }
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"
            }
            Label{y:20;text: qsTr(".")}
            TextField
            {
                id:thirdIP
                width: 50
                maximumLength:3
                validator: RegExpValidator
                {
                    regExp: /0-255/
                }
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"
            }
            Label{y:20;text: qsTr(".")}
            TextField
            {
                id:fourthIP
                width: 50
                maximumLength:3
                validator: RegExpValidator
                {
                    regExp: /0-255/
                }
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"
            }


            Button
            {
                id:applyBotton
                text: "Connect Robot"
                width: 180
                property bool robotConnect: false
                onClicked:
                    {

                    robotConnect=!robotConnect
                    robotConnect ? firstIP.enabled=false: firstIP.enabled=true
                    robotConnect ? secondIP.enabled=false: secondIP.enabled=true
                    robotConnect ? thirdIP.enabled=false : thirdIP.enabled=true
                    robotConnect ? fourthIP.enabled=false : fourthIP.enabled=true
                    robotConnect ? text="Disconnect Robot" : text="Сonnect Robot"
                    }

            }
            RadioButton {
                 text: "Robot control"
                 checked: false
                 onClicked:
                 {

                 }
              }
            }
        }

                Row
                {
                spacing: 210
                Row{
                spacing: 50
                Slider {
                    id: control
                    value: 0.5

                    background: Rectangle {
                        x: control.leftPadding
                        y: control.topPadding + control.availableHeight / 2 - height / 2
                        implicitWidth: 200
                        implicitHeight: 4
                        width: control.availableWidth
                        height: implicitHeight
                        radius: 2
                        color: "skyblue"

                        Rectangle {
                            width: control.visualPosition * parent.width
                            height: parent.height
                            color: "#81e889"
                            radius: 2
                        }
                    }

                    handle: Rectangle {
                        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                        y: control.topPadding + control.availableHeight / 2 - height / 2
                        implicitWidth: 26
                        implicitHeight: 26
                        radius: 13
                        color: control.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.width: 3
                        border.color: control.pressed ? "skyblue" : "#10A911"
                    }
                    Label{
                    text: qsTr("Laser level" + ((control.visualPosition*255)-((control.visualPosition*255)%1)))
                    }
                }
                Button
                {text: qsTr("Apply")}
            }
                Row{
                    spacing: 45
                Slider {
                    id: controlAutoexpous
                    value: 0.5

                    background: Rectangle {
                        x: controlAutoexpous.leftPadding
                        y: controlAutoexpous.topPadding + controlAutoexpous.availableHeight / 2 - height / 2
                        implicitWidth: 200
                        implicitHeight: 4
                        width: controlAutoexpous.availableWidth
                        height: implicitHeight
                        radius: 2
                        color: "#81e889"

                        Rectangle {
                            width: controlAutoexpous.visualPosition * parent.width
                            height: parent.height
                            color: "skyblue"
                            radius:3
                        }
                    }

                    handle: Rectangle {
                        x: controlAutoexpous.leftPadding + controlAutoexpous.visualPosition * (control.availableWidth - width)
                        y: controlAutoexpous.topPadding + controlAutoexpous.availableHeight / 2 - height / 2
                        implicitWidth: 26
                        implicitHeight: 26
                        radius: 13
                        color: controlAutoexpous.pressed ? "#f6f6f6" : "#f0f0f0"
                        border.width: 3
                        border.color: controlAutoexpous.pressed ? "#10A911" : "skyblue"
                    }
                    Label{
                    text: qsTr("Expousure time "+(controlAutoexpous.visualPosition*1912-controlAutoexpous.visualPosition*1912%1))
                    }
                }
                Button
                {text: qsTr("Apply")}
         }
    }

                Button
                {
                    text: qsTr("test button server start")
                    onClicked: {objServer.startServer()}

                }
                Button
                {
                text:qsTr("test close server")
                onClicked: {objServer.closeServer()}}
}
}
