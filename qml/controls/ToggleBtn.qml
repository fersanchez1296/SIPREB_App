import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnToggle
    //Custom properties
    property url btnIconSource: "../../images/svg_images/icons8-menú.svg"
    property color btnColordDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal

        //mouse over and click change color
        property var dynamicColor: if(btnToggle.down){
                                       btnToggle.down ? btnColorClicked : btnColordDefault
                                   } else{
                                       btnToggle.hovered ?  btnColorMouseOver : btnColordDefault
                                   }
    }

    implicitWidth: 70
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: 35
            height: 35
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn

            antialiasing: false
        }
    }
}
