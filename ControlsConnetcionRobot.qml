import QtQuick 2.4
import QtQuick.Controls 2.2

ControlsConnetcionRobotForm {

Column
{
    Row
    {
        id:ipDevice
        spacing: 30
        ComboBox {

            model: ["Fanuc USI", "Kawasaki", "Kuka"]
            currentIndex: 0
            onCurrentIndexChanged: console.debug(currentIndex)
            width: 180
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

    }

    Row{
        spacing: 20
        Row{

            Label{y:10; font.pixelSize:20; text: qsTr("IP")}
            TextField
            {
                id:firstIP
                width: 50
                maximumLength: 3
                validator: RegExpValidator
                {
                    regExp:/\d+$/
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
                    regExp:/\d+$/
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
                    regExp: /\d+$/
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
                    regExp: /\d+$/
                }
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"
            }
        }
        Row
        {
            Label{y:10; font.pixelSize:20; text: qsTr("PORT")}
            TextField
            {
                id:port
                width: 80
                maximumLength: 4
                validator: RegExpValidator
                {
                    regExp: /\d+$/
                }
                horizontalAlignment: "AlignHCenter"
                verticalAlignment: "AlignVCenter"
            }
        }
    }
}
}
