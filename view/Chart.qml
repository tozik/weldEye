import QtQuick 2.7
import QtCharts 2.1


ChartForm {
    id:chart

        ChartView
        {

                // @disable-check M17
                legend.visible: false
                id:chartView
                theme: ChartView.ChartThemeBlueNcs
                animationOptions: ChartView.AllAnimations
                anchors.fill: parent
                property int count: 0


                ValueAxis {
                    id: axisY
                    min: -5
                    max: 150
                }

                ValueAxis {
                    id: axisY2
                    min: -5
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
                    axisY: axisY
                    //Legend.enabled: false

                }

                ScatterSeries
                {
                    id:pointSeries2
                    borderWidth: 2
                    borderColor: 'blue'
                    axisYRight: axisY2
                    axisX:axisX
                    //Legend.enabled: false

                }
                Timer {
                    id: refreshTimer
                    interval:20/// 60 * 1000 // 60 Hz
                    running: statusScaner
                    repeat: true
                    onTriggered: {

                            deviceScaner.update(chartView.series(0));
                            deviceScaner.firstTemplate(chartView.series(1));

                    }
                }


        }
    }
