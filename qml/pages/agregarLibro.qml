import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent
        clip: true

        Rectangle {
            id: rectangle1
            color: "#23272e"
            radius: 5
            anchors.fill: parent
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10

            Image {
                id: imagenLibro
                x: 210
                width: 100
                height: 100
                anchors.top: parent.top
                anchors.bottom: btnAgregarImagen.top
                source: "../../images/png_images/Libro-pasta-dura.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                fillMode: Image.PreserveAspectFit
            }

            CustomButtonAgregar {
                id: btnAgregarImagen
                x: 386
                y: 116
                width: 240
                height: 30
                text: qsTr("Agregar Imagen")
                anchors.horizontalCenter: parent.horizontalCenter
                iconWidth: 15
                font.family: "Arial"
                font.pointSize: 15
                btnIconSource: "../../images/svg_images/anadir.svg"
                enabled: true
                isActiveMenu: true
                iconHeight: 15
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}D{i:3}D{i:4}D{i:2}
}
##^##*/
