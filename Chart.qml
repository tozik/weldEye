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
                    min: 0
                    max: 150
                }

                ValueAxis {
                    id: axisY2
                    min: 0
                    max: 150
                }

                ValueAxis {
                    id: axisX
                    min: -100
                    max: 100
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
                    interval: 100// / 60 * 1000 // 60 Hz
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
