import QtQuick 2.7
import QtCharts 2.1


ChartForm {
    id:chart

        ChartView
        {
               //legend.visible: false
                id:chartView
                title: "RF625"

                theme: ChartView.ChartThemeBlueNcs
                animationOptions: ChartView.AllAnimations
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
                    min: -50
                    max: 50
                }
                ScatterSeries {
                    id: lineSeries1
                    borderWidth: 0
                    borderColor: 'red'
                    markerSize: 2
                    axisX: axisX
                    axisY: axisY1
                }

//                LineSeries {
//                    id: lineSeries2
//                    name: "signal 2"
//                    axisX: axisX
//                    axisYRight:axisY2

//                }
                Timer {
                    id: refreshTimer
                    interval: 1/ 60 * 1000 // 60 Hz
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
