import QtQuick 2.4
import QtQuick.Controls 2.2

ControlsSettingsScanerForm {

    id:controlsSettingsScanerForm
    height: chart.height/8
    width: chart.width/3
    Rectangle{

    anchors.fill: parent
    color: "transparent"
    border.color: "blue"
    border.width: 0
    Column
    {
        id:columnSlider
        spacing: 20
        Row{
            id:rowLaserLevelSlider
            spacing:chart.width/80
            Slider {
                id: laserLevelSlider
                value: 0.5

                background: Rectangle {
                    x: laserLevelSlider.leftPadding
                    y: laserLevelSlider.topPadding + laserLevelSlider.availableHeight / 2 - height / 2
                    implicitWidth: chart.width/4
                    implicitHeight: chart.width/200
                    width: laserLevelSlider.availableWidth
                    height: implicitHeight
                    radius: chart.width/300
                    color: "#81e889"

                    Rectangle {
                        width: laserLevelSlider.visualPosition * parent.width
                        height: parent.height
                        color: "skyblue"
                        radius: 2
                    }
                }

                handle: Rectangle {
                    id:handlerLaserLevel
                    x: laserLevelSlider.leftPadding + laserLevelSlider.visualPosition * (laserLevelSlider.availableWidth - width)
                    y: laserLevelSlider.topPadding + laserLevelSlider.availableHeight / 2 - height / 2
                    implicitWidth: chart.width/33
                    implicitHeight: chart.width/33
                    radius: chart.width/100
                    color: laserLevelSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                    border.width: chart.width/400
                    border.color: laserLevelSlider.pressed ? "skyblue" : "#10A911"
                }

                Label{
                    text: qsTr("Laser level" )
                    anchors.horizontalCenter: laserLevelSlider.horizontalCenter
                    anchors.verticalCenter: laserLevelSlider.top
                }
                Label{
                    text: qsTr("" + ((laserLevelSlider.visualPosition*255)-((laserLevelSlider.visualPosition*255)%1)))
                    anchors.horizontalCenter: handlerLaserLevel.horizontalCenter
                    anchors.top: handlerLaserLevel.bottom
                }
            }
            Button
            {   id:apllyLaserLevel
                width: chart.width/15
                text: qsTr("Apply")
            }
        }

        Row{
            id:rowAutoExpousureSlider
            spacing: chart.width/80
            Slider {
                id: autoExpousureSlider
                value: 0.5

                background: Rectangle {
                    x: autoExpousureSlider.leftPadding
                    y: autoExpousureSlider.topPadding + autoExpousureSlider.availableHeight / 2 - height / 2
                    implicitWidth: chart.width/4
                    implicitHeight: chart.width/200
                    width: autoExpousureSlider.availableWidth
                    height: implicitHeight
                    radius: chart.width/300
                    color: "#81e889"

                    Rectangle {
                        width: autoExpousureSlider.visualPosition * parent.width
                        height: parent.height
                        color: "skyblue"
                        radius:3
                    }
                }

                handle: Rectangle {
                    id:handlerExpTime
                    x: autoExpousureSlider.leftPadding + autoExpousureSlider.visualPosition * (laserLevelSlider.availableWidth - width)
                    y: autoExpousureSlider.topPadding + autoExpousureSlider.availableHeight / 2 - height / 2
                    implicitWidth: chart.width/33
                    implicitHeight: chart.width/33
                    radius: chart.width/100
                    color: autoExpousureSlider.pressed ? "#f6f6f6" : "#f0f0f0"
                    border.width: chart.width/400
                    border.color: autoExpousureSlider.pressed ? "#10A911" : "skyblue"
                }

                Label{
                text: qsTr("Expousure time ")
                anchors.horizontalCenter: autoExpousureSlider.horizontalCenter
                anchors.verticalCenter: autoExpousureSlider.top

                }
                Label{
                    text: qsTr(""+(autoExpousureSlider.visualPosition*1912-autoExpousureSlider.visualPosition*1912%1))
                    anchors.horizontalCenter: handlerExpTime.horizontalCenter
                    anchors.top: handlerExpTime.bottom
                }
            }
            Button
            {

                id:applyExpousureTime
                text: qsTr("Apply")
                width: chart.width/15
            }
        }
        Row
        {
            id:scanerChose
            spacing: chart.width/80
            ComboBox {

                model: ["Riftek RF625", "Ardeonova"]
                currentIndex: 0
                onCurrentIndexChanged: console.debug(currentIndex,model[currentIndex])
                width: chart.width/4
            }
            Button
            {

                id:applySets

                text: qsTr("Apply")
                width: chart.width/15
            }
        }
    }
}
}
