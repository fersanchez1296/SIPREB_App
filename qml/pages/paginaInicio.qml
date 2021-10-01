import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Rectangle {
            id: rectangleVisible
            color: "#1d2128"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 10

            Label {
                id: labelTextName
                y: 8
                height: 25
                color: "#5c667d"
                text: qsTr("Welcome")
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                font.pointSize: 14
            }

            Label {
                id: labelDate
                y: 31
                height: 25
                color: "#55aaff"
                text: qsTr("Date")
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                font.pointSize: 12
            }

            Rectangle {
                id: rectangle1
                color: "#282c34"
                radius: 5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelDate.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10

                Image {
                    id: fotoPersona
                    width: 130
                    height: 130
                    anchors.left: parent.left
                    anchors.top: parent.top
                    source: "../../images/svg_images/usuario(2).svg"
                    anchors.leftMargin: 5
                    anchors.topMargin: 5
                    fillMode: Image.PreserveAspectFit
                }

                Label {
                    id: labelNombre
                    height: 100
                    color: "#ffffff"
                    text: qsTr("Nombre de la persona")
                    anchors.left: fotoPersona.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 25
                    font.family: "Arial"
                    anchors.rightMargin: 5
                    anchors.leftMargin: 5
                    anchors.topMargin: 5
                }

                Label {
                    id: lblTxtCentro
                    height: 25
                    color: "#ffffff"
                    text: qsTr("Centro Universitario de los Valles")
                    anchors.left: fotoPersona.right
                    anchors.right: parent.right
                    anchors.top: labelNombre.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Arial"
                    font.pointSize: 15
                    anchors.rightMargin: 5
                    anchors.leftMargin: 5
                    anchors.topMargin: 5
                }

                GridLayout {
                    id: gridLayout
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: lblTxtCentro.bottom
                    anchors.bottom: parent.bottom
                    columnSpacing: 20
                    rowSpacing: 10
                    anchors.rightMargin: 257
                    anchors.leftMargin: 361
                    anchors.bottomMargin: 14
                    anchors.topMargin: 6
                    rows: 4
                    columns: 2

                    Label {
                        id: lblTxtCodigo
                        width: 300
                        color: "#ffffff"
                        text: qsTr("Codigo:")
                        horizontalAlignment: Text.AlignRight
                        font.family: "Arial"
                        font.pointSize: 13
                        Layout.columnSpan: 1
                        Layout.rowSpan: 1
                        Layout.fillWidth: false
                    }

                    Label {
                        id: lblCodigo
                        color: "#55aaff"
                        text: qsTr("Label")
                        font.family: "Arial"
                        font.pointSize: 13
                        Layout.fillWidth: true
                    }

                    Label {
                        id: lblTxtEmail
                        color: "#ffffff"
                        text: qsTr("Email:")
                        horizontalAlignment: Text.AlignRight
                        font.family: "Arial"
                        font.pointSize: 13
                        Layout.fillWidth: false
                    }

                    Label {
                        id: lblEmail
                        color: "#55aaff"
                        text: qsTr("Label")
                        font.family: "Arial"
                        font.pointSize: 13
                        Layout.fillWidth: false
                    }

                    Label {
                        id: lblTxtTel
                        color: "#ffffff"
                        text: qsTr("Telefono:")
                        horizontalAlignment: Text.AlignRight
                        font.family: "Arial"
                        font.pointSize: 13
                        Layout.fillWidth: false
                    }

                    Label {
                        id: lblTel
                        color: "#55aaff"
                        text: qsTr("Label")
                        font.family: "Arial"
                        font.pointSize: 13
                        Layout.fillWidth: false
                    }

                    Label {
                        id: lblTxtAnt
                        color: "#ffffff"
                        text: qsTr("Antiguedad:")
                        horizontalAlignment: Text.AlignRight
                        font.family: "Arial"
                        font.pointSize: 13
                        Layout.fillWidth: false
                    }

                    Label {
                        id: lblAnt
                        color: "#55aaff"
                        text: qsTr("Label")
                        font.family: "Arial"
                        font.pointSize: 13
                        Layout.fillWidth: false
                    }
                }

                Image {
                    id: logoUdeg
                    anchors.left: parent.left
                    anchors.right: gridLayout.left
                    anchors.top: fotoPersona.bottom
                    anchors.bottom: parent.bottom
                    source: "../../images/png_images/udeg.png"
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
        Connections{
            target: backend

            function onSetName(name){
                labelTextName.text = name
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:800}D{i:18}
}
##^##*/
