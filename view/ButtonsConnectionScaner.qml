import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.1

ButtonsConnectionScanerForm {

    id:buttonsConnectionScanerForm

    height: chart.height/8
    width: chart.width/3

    Rectangle{
        color: "transparent"
        border.color: "transparent"
        border.width: 1
        anchors.fill: parent

        Column{
            id:columnSearch
            spacing: 10

            Button{
                id:searchScaner
                width: chart.width/3
                text: "Search"
            }
            Row{
                id:rowUdpTcp
                spacing: 5
                Button
                {
                    id:udpButton
                    width: chart.width/6
                    anchors.margins: 50
                    property bool connectUdp: true
                    text: connectUdp ? "UDP Connection" :"UDP Disconnection"
                    onClicked:
                    {
                        udpButton.connectUdp=!udpButton.connectUdp;                             //twice button
                        connectUdp ? tcpButton.enabled=true : tcpButton.enabled=false           //if press tsp dismis udpButton
                                     !connectUdp ? deviceScaner.search() & deviceScaner.connectionTO() & (window.statusScaner=true)
                                                 : deviceScaner.disconnection() & deviceScaner.releaseMemory() & (window.statusScaner=false)
                        //                    console.log("status",statusScaner)
                    }

                }
                Button
                {
                    id:tcpButton
                    width: chart.width/6
                    property bool connectTcp: true
                    text: connectTcp ? "TCP Connection": "TCP Disconnection"
                    onClicked:
                    {
                        tcpButton.connectTcp=!tcpButton.connectTcp                                  //twice button
                        connectTcp ? udpButton.enabled=true : udpButton.enabled=false               // if press udpButton dismis tcp

                    }
                }
            }
        }
    }
}
