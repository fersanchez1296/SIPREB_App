import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnleftMenu
    text: qsTr("Left Menu Text")
    //Custom properties
    property url btnIconSource: "../../images/svg_images/anadir.svg"
    property color btnColordDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 35
    property int iconHeight: 35
    property color activeMenuColor: "#55aa00"
    property color activeMenuColorRight: "#2c313c"
    property bool isActiveMenu: false

    QtObject{
        id: internal

        //mouse over and click change color
        property var dynamicColor: if(btnleftMenu.down){
                                       btnleftMenu.down ? btnColorClicked : btnColordDefault
                                   } else{
                                       btnleftMenu.hovered ?  btnColorMouseOver : btnColordDefault
                                   }
    }

    implicitWidth: 90
    implicitHeight: 30

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Rectangle{
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }

        Rectangle{
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
        }
    }

    contentItem: Item{
        id: content
        anchors.fill: parent
        Image {
            id: iconBtn
            source: btnIconSource
            anchors.leftMargin: 18
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn

            antialiasing: true
            width: iconWidth
            height: iconHeight
        }

        Text {
            color: "#ffffff"
            text: btnleftMenu.text
            font: btnleftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}