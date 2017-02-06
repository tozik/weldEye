import QtQuick 2.7

TemplateForm {
        id:templates

    Row{
        spacing: 20
        NumberAnimation {duration:1000}

    Image{
         id: first
         source:  "qrc:/seam/Y-seam.png"
         MouseArea
            {
                anchors.fill: parent
                onClicked:
                    {
                    first.opacity=1
                    second.opacity=0.5
                    third.opacity=0.5
                    fourth.opacity=0.5
                    fifth.opacity=0.5
                    sixth.opacity=0.5

                    }
            }
         }
    Image{
         id: second
         source: "qrc:/seam/V-area.png"
         MouseArea
            {
                anchors.fill: parent
                onClicked:
                    {
                    first.opacity=0.5
                    second.opacity=1
                    third.opacity=0.5
                    fourth.opacity=0.5
                    fifth.opacity=0.5
                    sixth.opacity=0.5
                    }
            }
        }

    Image {
        id: third
        source: "qrc:/seam/Overlapping_seam.png"
        MouseArea
           {
               anchors.fill: parent
               onClicked:
                   {
                   first.opacity=0.5
                   second.opacity=0.5
                   third.opacity=1
                   fourth.opacity=0.5
                   fifth.opacity=0.5
                   sixth.opacity=0.5
                   }
           }
    }
    Image {
        id: fourth
        source: "qrc:/seam/Open_edge.png"
        MouseArea
           {
               anchors.fill: parent
               onClicked:
                   {
                   first.opacity=0.5
                   second.opacity=0.5
                   third.opacity=0.5
                   fourth.opacity=1
                   fifth.opacity=0.5
                   sixth.opacity=0.5
                   }
           }
    }
    Image {
            id: fifth
            source: "qrc:/seam/M-depth.png"
            MouseArea
               {
                   anchors.fill: parent
                   onClicked:
                       {
                       first.opacity=0.5
                       second.opacity=0.5
                       third.opacity=0.5
                       fourth.opacity=0.5
                       fifth.opacity=1
                       sixth.opacity=0.5
                       }
               }
    }
    Image {
        id: sixth
        source: "qrc:/seam/HY-seam.png"
        MouseArea
           {
               anchors.fill: parent
               onClicked:
                   {
                   first.opacity=0.5
                   second.opacity=0.5
                   third.opacity=0.5
                   fourth.opacity=0.5
                   fifth.opacity=0.5
                   sixth.opacity=1
                   }
           }
    }
    }
}

//    "qrc:/seam/U-seam.png"
//    "qrc:/seam/TB-area.png"
//    "qrc:/seam/Tailored_bank.png"
//    "qrc:/seam/HU-seam.png"
//    GridView
//        {
//            anchors.fill: parent
//            model: model
//            delegate: Column {
//                      Image { source: source; anchors.horizontalCenter: parent.horizontalCenter }
//                    //  Text { text: name; anchors.horizontalCenter: parent.horizontalCenter }
//                  }
//             highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
//      focus: true
//        }


