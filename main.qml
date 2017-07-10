import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQml 2.2

Item {
    id:window
    visible: true
    property int counter: 0
    property bool statusScaner: false


    Chart
    {
        id:chart
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.margins: 5
        height: parent.height
        width: parent.width/2

    }

    Template
    {
        id:template
        anchors.top:chart.bottom
        anchors.left: parent.left
        anchors.margins: 5
    }

    Controls
    {
        id:controls
        anchors.top:parent.top
        anchors.right: parent.right
        width: parent.width/2
        anchors.margins: 5
    }



//    TemplateSet
//    {
//        id:templateSet
//        anchors.top:controls.bottom
//        anchors.right: parent.right
//        anchors.left:chart.right
//        anchors.bottom: parent.bottom
//        anchors.margins: 5


//    }

//    Log
//    {

//        id:log
//        anchors.left:parent.left
//        anchors.right: templateSet.left
//        anchors.bottom: parent.bottom
//        anchors.top:template.bottom
//        anchors.margins: 5

//    }



    }

