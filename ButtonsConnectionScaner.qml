import QtQuick 2.4
import QtQuick.Controls 2.2

ButtonsConnectionScanerForm {
    Column{
        id:columnSearch
        spacing: 10

        Button{
            id:searchScaner
            anchors.left: parent.left
            anchors.right: parent.right
            text: "Search RF625"
        }
        Row{
            id:rowUdpTcp
            spacing: 5
            Button
            {
                id:udpButton
                width: 160
                anchors.margins: 10
                property bool connectUdp: true
                text: connectUdp ? "UDP Connection" :"UDP Disconnection"
                onClicked:
                {
                    udpButton.connectUdp=!udpButton.connectUdp;                             //twice button
                    connectUdp ? tcpButton.enabled=true : tcpButton.enabled=false           //if press tsp dismis udpButton
                                 !connectUdp ? deviceScaner.search() & deviceScaner.connectionTO() & (window.statusScaner=true)
                                             : deviceScaner.disconnection() & deviceScaner.releaseMemory() & (window.statusScaner=false)
                    console.log("status",statusScaner)
                }

            }
            Button
            {
                id:tcpButton
                width: 160
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

