import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4


LogForm {
    id:log

        Rectangle
        {   anchors.fill: parent
            border.color: "red"

            Label
            {

                id:logArea
                anchors.fill: parent
                color: "red"
                text: qsTr("LOG lbl")
                }
            }
        }
