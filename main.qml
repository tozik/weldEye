import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQml 2.2

Item {
    visible: true


    Chart
    {
        id:chart
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: controls.left
        anchors.margins: 5

    }

    Template
    {
        id:template
        anchors.top:chart.bottom
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 5
    }

    Controls
    {
        id:controls
        anchors.top:parent.top
        anchors.right: parent.right
        anchors.left:chart.right
        anchors.margins: 5
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

    Log
    {

        id:log
        anchors.left:parent.left
        anchors.right: templateSet.left
        anchors.bottom: parent.bottom
        anchors.margins: 5

    }



    }
