import QtQuick 2.4
import QtQuick.Controls 2.2

ControlsSettingsScanerForm {
    Column
    {
        id:columnSlider
        spacing: 10
        Row{
            id:rowLaserLevelSlider
            spacing: 50
            Slider {
                id: laserLevelSlider
                value: 0.5

                background: Rectangle {
                    x: laserLevelSlider.leftPadding
                    y: laserLevelSlider.topPadding + laserLevelSlider.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 4
                    width: laserLevelSlider.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: "skyblue"

                    Rectangle {
                        width: laserLevelSlider.visualPosition * parent.width
                        height: parent.height
                        color: "#81e889"
                        radius: 2
                    }
                }

                handle: Rectangle {
                    x: laserLevelSlider.leftPadding + laserLevelSlider.visualPosition * (laserLevelSlider.availableWidth - width)
                    y: laserLevelSlider.topPadding + laserLevelSlider.availableHeight / 2 - height / 2
                    implicitWidth: 26
                    implicitHeight: 26
                    radius: 13
                    color: laserLevelSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                    border.width: 3
                    border.color: laserLevelSlider.pressed ? "skyblue" : "#10A911"
                }
                Label{
                    text: qsTr("Laser level" + ((laserLevelSlider.visualPosition*255)-((laserLevelSlider.visualPosition*255)%1)))
                }
            }
            Button
            {   id:apllyLaserLevel
                anchors.right: firstColumn.right
                text: qsTr("Apply")
            }
        }

        Row{
            id:rowAutoExpousureSlider
            spacing: 50
            Slider {
                id: autoExpousureSlider
                value: 0.5

                background: Rectangle {
                    x: autoExpousureSlider.leftPadding
                    y: autoExpousureSlider.topPadding + autoExpousureSlider.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 4
                    width: autoExpousureSlider.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: "#81e889"

                    Rectangle {
                        width: autoExpousureSlider.visualPosition * parent.width
                        height: parent.height
                        color: "skyblue"
                        radius:3
                    }
                }

                handle: Rectangle {
                    x: autoExpousureSlider.leftPadding + autoExpousureSlider.visualPosition * (laserLevelSlider.availableWidth - width)
                    y: autoExpousureSlider.topPadding + autoExpousureSlider.availableHeight / 2 - height / 2
                    implicitWidth: 26
                    implicitHeight: 26
                    radius: 13
                    color: autoExpousureSlider.pressed ? "#f6f6f6" : "#f0f0f0"
                    border.width: 3
                    border.color: autoExpousureSlider.pressed ? "#10A911" : "skyblue"
                }
                Label{
                    text: qsTr("Expousure time "+(autoExpousureSlider.visualPosition*1912-autoExpousureSlider.visualPosition*1912%1))
                }
            }
            Button
            {

                id:applyExpousureTime
                text: qsTr("Apply")
            }
        }
    }
}
