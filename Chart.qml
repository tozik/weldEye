import QtQuick 2.7
import QtCharts 2.1


ChartForm {
    id:chart

        ChartView
        {

                id:chartView
                theme: ChartView.ChartThemeBlueNcs
                titleColor: "white"
                //animationOptions: ChartView.AllAnimations
                anchors.fill: parent
                ValueAxis {
                    id: axisY1
                    min: -2
                    max: 8
                }

                ValueAxis {
                    id: axisY2
                    min: -10
                    max: 5
                }

                ValueAxis {
                    id: axisX
                    min: 0
                    max: 1024
                }
                LineSeries {
                    id: lineSeries1
                    name: "signal 1"
                    axisX: axisX
                    axisY: axisY1
                }
                LineSeries {
                    id: lineSeries2
                    name: "signal 2"
                    axisX: axisX
                    axisYRight:axisY2
                }
                Timer {
                    id: refreshTimer
                    interval: 1 / 60 * 500 // 60 Hz
                    running: true
                    repeat: true
                    onTriggered: {
                            console.log("onTrig");
                             deviceScaner.update(chartView.series(0));
                          //  deviceScaner.update(chartView.series(1));

                    }
                }
        }
    }
