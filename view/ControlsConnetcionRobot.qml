import QtQuick 2.4
import QtQuick.Controls 2.2

ControlsConnetcionRobotForm {
    id:controlsConnetcionRobotForm

    height: chart.height/8
    width: chart.width/3

    Rectangle{

        anchors.fill: parent
        color: "transparent"
        border.color: "transparent"
        border.width: 1
        Column
        {
            spacing: 10
            Row
            {
                id:ipDevice
                spacing: 10
                Button
                {
                    id:applyBotton
                    text: "Connect Robot"
                    width: chart.width/6-5
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
                ComboBox {

                    model: ["Fanuc", "Kawasaki", "Kuka"]
                    currentIndex: 0
                    onCurrentIndexChanged: console.debug(currentIndex,model[currentIndex])
                    width: chart.width/6-5
                }

            }

            Row{
                spacing: chart.width/100
                Row{

                    Label{
//                        y:10;
                        anchors.verticalCenter: firstIP.verticalCenter
                        font.pixelSize:chart.width/60;
                        text: qsTr("IP")}
                    TextField
                    {
                        id:firstIP
                        width: chart.width/21
                        maximumLength: 3
                        validator: RegExpValidator
                        {
                            regExp:/\d+$/
                        }
                        horizontalAlignment: "AlignHCenter"
                        verticalAlignment: "AlignBottom"

                    }
                    Label{y:20;text: qsTr(".")}
                    TextField
                    {
                        id:secondIP
                        width: chart.width/21
                        maximumLength:3
                        validator: RegExpValidator
                        {
                            regExp:/\d+$/
                        }
                        horizontalAlignment: "AlignHCenter"
                        verticalAlignment: "AlignBottom"
                    }
                    Label{y:20;text: qsTr(".")}
                    TextField
                    {
                        id:thirdIP
                        width: chart.width/21
                        maximumLength:3
                        validator: RegExpValidator
                        {
                            regExp: /\d+$/
                        }
                        horizontalAlignment: "AlignHCenter"
                        verticalAlignment: "AlignBottom"
                    }
                    Label{y:20;text: qsTr(".")}
                    TextField
                    {
                        id:fourthIP
                        width: chart.width/21
                        maximumLength:3
                        validator: RegExpValidator
                        {
                            regExp: /\d+$/
                        }
                        horizontalAlignment: "AlignHCenter"
                        verticalAlignment: "AlignBottom"
                    }
                }
                Row
                {
                    Label
                    {
                    anchors.verticalCenter: port.verticalCenter
                    font.pixelSize:chart.width/60;
                    text: qsTr("PORT")}
                    TextField
                    {
                        id:port
                        width: chart.width/21
                        maximumLength: 4
                        validator: RegExpValidator
                        {
                            regExp: /\d+$/
                        }
                        horizontalAlignment: "AlignHCenter"
                        verticalAlignment: "AlignBottom"
                    }
                }
            }
        }
    }
}
