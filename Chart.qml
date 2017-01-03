import QtQuick 2.7
import QtCharts 2.1


ChartForm {
    id:chart

        ChartView
        {

                id:chartView
                theme: ChartView.ChartThemeBlueNcs
                titleColor: "white"
                animationOptions: ChartView.AllAnimations
                anchors.fill: parent
                ValueAxis {
                    id: axisX
                    min: -100
                    max: 1024
                }

                ValueAxis {
                    id: axisY
                    min: -10
                    max: 10
                }
                LineSeries {
                    id: lineSeries1
                    name: "signal 1"
                    axisX: axisX
                    axisY: axisY
                }
                LineSeries {
                    id: lineSeries2
                    name: "signal 2"
                    axisX: axisX
                    axisY: axisY
                }
                Timer {
                    id: refreshTimer
                    interval: 1 / 60 * 1000 // 60 Hz
                    running: true
                    repeat: true
                    onTriggered: {
                             deviceScaner.update(chartView.series(0));
                            deviceScaner.update(chartView.series(1));

                    }
                }
        }
    }
