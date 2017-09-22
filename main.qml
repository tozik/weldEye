import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQml 2.2
import "view"

Item {
    id:window
    visible: true
    property int counter: 0
    property bool statusScaner: false
    property int customFontWidth: chart.width/25

    Chart
    {
        id:chart
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.margins: 4
        height: parent.height/1.2
        width: parent.width/2

    }

    Controls
    {
        id:controls
        anchors.top:parent.top
        anchors.right: parent.right
        width: parent.width/2
        anchors.margins: 26
    }



    TemplateSet
    {
        id:templateSet
        anchors.top:controls.bottom
        anchors.right: parent.right
        anchors.left:chart.right
        anchors.bottom: parent.bottom
        anchors.margins: 5

    }
//    Template
//    {
//        id:template
//        anchors.top:templateSet.bottom
//        anchors.right:parent.right
//        anchors.margins: 5
//    }

    Log
    {

    id:log
    anchors.top:chart.bottom
    anchors.left: parent.left
    anchors.margins: 5


    }



    }

