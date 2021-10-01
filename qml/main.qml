import QtQuick 2.13
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"


Window {
    id: main_window
    width: 1280
    height: 720
    minimumWidth: 800
    minimumHeight: 500
    visible: true
    color: "#00000000"
    title: qsTr("SIPREB")


    //Remove title bar
    flags: Qt.Window | Qt.FramelessWindowHint

    //Properties
    property int windowStatus: 0
    property int windowMargin: 10

    QtObject{
        id: internal

        function resetResizeBorder(){
            //Reset visibility
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            resizeWindow.visible = true
        }

        function maximizeRestore() {
            if(windowStatus == 0){
                main_window.showMaximized()
                windowStatus = 1
                windowMargin = 0
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeWindow.visible = false
                btnMaximize.btnIconSource = "../images/svg_images/restore_icon.svg"
            }
            else{
                windowStatus = 0
                windowMargin = 10
                main_window.showNormal()
                internal.resetResizeBorder()
                btnMaximize.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function ifMaximizedWindowRestore() {
            if(windowStatus == 1){
                btnMaximize.btnIconSource = "../images/svg_images/restore_icon.svg"
                main_window.showNormal()
                windowStatus = 0
                windowMargin = 10
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeWindow.visible = false
            }
        }

        function restoreMargins() {
            windowStatus = 0
            windowMargin = 10
            internal.resetResizeBorder()
            btnMaximize.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }


    Rectangle {
        id: bg
        color: "#2c313c"
        border.color: "#2d323d"
        border.width: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: 10
        z: 1

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1c1d20"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleBtn {
                    btnIconSource: "../images/svg_images/menu.svg"
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    y: 19
                    height: 25
                    color: "#282c34"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        color: "#c3cbdd"
                        text: qsTr("Información referente al usuario")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                        font.pointSize: 13
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        color: "#c3cbdd"
                        text: qsTr("|Inicio")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 15
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.leftMargin: 0
                        anchors.rightMargin: 10
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0

                    DragHandler{
                        onActiveChanged: if(active){
                            main_window.startSystemMove()
                            internal.ifMaximizedWindowRestore()
                        }
                    }

                    Image {
                        id: icon
                        width: 30
                        height: 30
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/biblioteca.svg"
                        anchors.leftMargin: 450
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#c3cbdd"
                        text: qsTr("SIPREB")
                        anchors.left: icon.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 450
                        anchors.leftMargin: 0
                        font.pointSize: 20
                    }
                }

                Row {
                    id: rowBtns
                    x: 872
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopBarButton {
                        id: btnMinimize
                        onClicked: {
                            main_window.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopBarButton {
                        id: btnMaximize
                        btnColorClicked: "#00aa00"
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorClicked: "#ff007f"
                        btnColordDefault: "#1c1d20"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                        onClicked: main_window.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#1c1d20"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    PropertyAnimation{
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width == 70) return 250; else return 70
                        duration: 1000
                        easing.type: Easing.InOutQuint
                    }

                    Column {
                        id: columnMenu
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        clip: true
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            height: 55
                            text: qsTr("Inicio")
                            iconHeight: 35
                            font.family: "Arial"
                            font.pointSize: 15
                            btnIconSource: "../images/svg_images/casa.svg"
                            isActiveMenu: true
                            enabled: true
                            onClicked: {
                                labelTopInfo.text = "Información referente al usuario"
                                btnHome.isActiveMenu = true
                                btnSettings.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = false
                                btnEditarLibro.isActiveMenu = false
                                btnBuscarLibro.isActiveMenu = false
                                btnEliminarLibro.isActiveMenu = false
                                btnAgregarUsuario.isActiveMenu = false
                                btnEliminarUsuario.isActiveMenu = false
                                btnEditarUsuario.isActiveMenu = false
                                btnPassword.isActiveMenu = false
                                btnDeudas.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/paginaInicio.qml"))
                                labelRightInfo.text = "|Inicio"
                            }
                        }

                        LeftMenuBtn {
                            id: btnAgregarLibro
                            width: leftMenu.width
                            text: qsTr("Agregar Libro")
                            font.family: "Arial"
                            font.pointSize: 15
                            btnIconSource: "../images/svg_images/anadir.svg"
                            onClicked: {
                                labelTopInfo.text = "En esta página usted puede agregar nuevos libros al sistema SIPREB"
                                btnHome.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = true
                                btnEditarLibro.isActiveMenu = false
                                btnBuscarLibro.isActiveMenu = false
                                btnEliminarLibro.isActiveMenu = false
                                btnAgregarUsuario.isActiveMenu = false
                                btnEliminarUsuario.isActiveMenu = false
                                btnEditarUsuario.isActiveMenu = false
                                btnPassword.isActiveMenu = false
                                btnDeudas.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/agregarLibro.qml"))
                                labelRightInfo.text = "|Agregar Libro"
                            }
                        }

                        LeftMenuBtn {
                            id: btnEditarLibro
                            width: leftMenu.width
                            text: qsTr("Editar Libro")
                            font.pointSize: 15
                            font.family: "Arial"
                            btnIconSource: "../images/svg_images/editar.svg"
                            onClicked: {
                                labelTopInfo.text = "En esta página usted puede editar la información de un libro registrado en el sistema SIPREB"
                                btnHome.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = false
                                btnEditarLibro.isActiveMenu = true
                                btnBuscarLibro.isActiveMenu = false
                                btnEliminarLibro.isActiveMenu = false
                                btnAgregarUsuario.isActiveMenu = false
                                btnEliminarUsuario.isActiveMenu = false
                                btnEditarUsuario.isActiveMenu = false
                                btnPassword.isActiveMenu = false
                                btnDeudas.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/editarLibro.qml"))
                                labelRightInfo.text = "|Editar Libro"
                            }
                        }

                        LeftMenuBtn {
                            id: btnBuscarLibro
                            width: leftMenu.width
                            text: qsTr("Buscar Libro")
                            font.pointSize: 15
                            font.family: "Arial"
                            btnIconSource: "../images/svg_images/busqueda.svg"
                            onClicked: {
                                labelTopInfo.text = "En esta página usted puede buscar un libro registrado en el sistema SIPREB"
                                btnHome.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = false
                                btnEditarLibro.isActiveMenu = false
                                btnBuscarLibro.isActiveMenu = true
                                btnEliminarLibro.isActiveMenu = false
                                btnAgregarUsuario.isActiveMenu = false
                                btnEliminarUsuario.isActiveMenu = false
                                btnEditarUsuario.isActiveMenu = false
                                btnPassword.isActiveMenu = false
                                btnDeudas.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/buscarLibro.qml"))
                                labelRightInfo.text = "|Buscar Libro"
                            }
                        }

                        LeftMenuBtn {
                            id: btnEliminarLibro
                            width: leftMenu.width
                            text: qsTr("Eliminar Libro")
                            font.pointSize: 15
                            font.family: "Arial"
                            btnIconSource: "../images/svg_images/eliminar.svg"
                            onClicked: {
                                labelTopInfo.text = "En esta página usted puede eliminar algun libro registrado en el sistema SIPREB"
                                btnHome.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = false
                                btnEditarLibro.isActiveMenu = false
                                btnBuscarLibro.isActiveMenu = false
                                btnEliminarLibro.isActiveMenu = true
                                btnAgregarUsuario.isActiveMenu = false
                                btnEliminarUsuario.isActiveMenu = false
                                btnEditarUsuario.isActiveMenu = false
                                btnPassword.isActiveMenu = false
                                btnDeudas.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/eliminarLibro.qml"))
                                labelRightInfo.text = "|Eliminar Libro"
                            }
                        }

                        LeftMenuBtn {
                            id: btnAgregarUsuario
                            width: leftMenu.width
                            text: qsTr("Agregar Usuario")
                            font.pointSize: 15
                            font.family: "Arial"
                            btnIconSource: "../images/svg_images/agregar-usuario.svg"
                            onClicked: {
                                labelTopInfo.text = "En esta página usted puede agregar un nuevo usuario al sistema SIPREB"
                                btnHome.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = false
                                btnEditarLibro.isActiveMenu = false
                                btnBuscarLibro.isActiveMenu = false
                                btnEliminarLibro.isActiveMenu = false
                                btnAgregarUsuario.isActiveMenu = true
                                btnEliminarUsuario.isActiveMenu = false
                                btnEditarUsuario.isActiveMenu = false
                                btnPassword.isActiveMenu = false
                                btnDeudas.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/agregarUsuario.qml"))
                                labelRightInfo.text = "|Agregar Usuario"
                            }
                        }

                        LeftMenuBtn {
                            id: btnEliminarUsuario
                            width: leftMenu.width
                            text: qsTr("Eliminar Usuario")
                            font.pointSize: 15
                            font.family: "Arial"
                            btnIconSource: "../images/svg_images/usuario(1).svg"
                            onClicked: {
                                labelTopInfo.text = "En esta página usted puede eliminar un usuario del sistema SIPREB"
                                btnHome.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = false
                                btnEditarLibro.isActiveMenu = false
                                btnBuscarLibro.isActiveMenu = false
                                btnEliminarLibro.isActiveMenu = false
                                btnAgregarUsuario.isActiveMenu = false
                                btnEliminarUsuario.isActiveMenu = true
                                btnEditarUsuario.isActiveMenu = false
                                btnPassword.isActiveMenu = false
                                btnDeudas.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/eliminarUsuario.qml"))
                                labelRightInfo.text = "|Eliminar Usuario"
                            }
                        }

                        LeftMenuBtn {
                            id: btnEditarUsuario
                            width: leftMenu.width
                            text: qsTr("Editar Usuario")
                            font.pointSize: 15
                            font.family: "Arial"
                            btnIconSource: "../images/svg_images/usuario.svg"
                            onClicked: {
                                labelTopInfo.text = "En esta página usted puede editar la información de un usuario del sistema SIPREB"
                                btnHome.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = false
                                btnEditarLibro.isActiveMenu = false
                                btnBuscarLibro.isActiveMenu = false
                                btnEliminarLibro.isActiveMenu = false
                                btnAgregarUsuario.isActiveMenu = false
                                btnEliminarUsuario.isActiveMenu = false
                                btnEditarUsuario.isActiveMenu = true
                                btnPassword.isActiveMenu = false
                                btnDeudas.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/editarUsuario.qml"))
                                labelRightInfo.text = "|Editar Usuario"
                            }
                        }

                        LeftMenuBtn {
                            id: btnPassword
                            width: leftMenu.width
                            text: qsTr("Cambiar contraseña")
                            font.pointSize: 14
                            font.family: "Arial"
                            btnIconSource: "../images/svg_images/clave.svg"
                            onClicked: {
                                labelTopInfo.text = "En esta página usted puede cambiar su contraseña de acceso"
                                btnHome.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = false
                                btnEditarLibro.isActiveMenu = false
                                btnBuscarLibro.isActiveMenu = false
                                btnEliminarLibro.isActiveMenu = false
                                btnAgregarUsuario.isActiveMenu = false
                                btnEliminarUsuario.isActiveMenu = false
                                btnEditarUsuario.isActiveMenu = false
                                btnPassword.isActiveMenu = true
                                btnDeudas.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/cambiarPass.qml"))
                                labelRightInfo.text = "|Cambiar Contraseña"
                            }
                        }

                        LeftMenuBtn {
                            id: btnCerrarSesion
                            width: leftMenu.width
                            text: qsTr("Cerrar Sesion")
                            btnColordDefault: "#1c1d29"
                            font.pointSize: 15
                            font.family: "Arial"
                            btnIconSource: "../images/svg_images/boton-de-encendido.svg"
                        }

                        LeftMenuBtn {
                            id: btnDeudas
                            width: leftMenu.width
                            text: qsTr("Cambiar contraseña")
                            font.pointSize: 14
                            font.family: "Arial"
                            btnIconSource: "../images/svg_images/recompensa.svg"
                            onClicked: {
                                labelTopInfo.text = "En esta página usted puede saldar las deudas de un usuario"
                                btnHome.isActiveMenu = false
                                btnAgregarLibro.isActiveMenu = false
                                btnEditarLibro.isActiveMenu = false
                                btnBuscarLibro.isActiveMenu = false
                                btnEliminarLibro.isActiveMenu = false
                                btnAgregarUsuario.isActiveMenu = false
                                btnEliminarUsuario.isActiveMenu = false
                                btnEditarUsuario.isActiveMenu = false
                                btnPassword.isActiveMenu = false
                                btnDeudas.isActiveMenu = true
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/deudas.qml"))
                                labelRightInfo.text = "|Deudas de usuario"
                            }
                        }
                    }

                    LeftMenuBtn {
                        id: btnSettings
                        width: leftMenu.width
                        text: qsTr("Configuracion")
                        anchors.bottom: parent.bottom
                        font.pointSize: 15
                        font.family: "Arial"
                        anchors.bottomMargin: 25
                        btnIconSource: "../images/svg_images/ajustes.svg"
                        onClicked: {
                            labelTopInfo.text = "En esta página usted puede configurar aspectos de su interfaz de usuario"
                            btnHome.isActiveMenu = false
                            btnAgregarLibro.isActiveMenu = false
                            btnEditarLibro.isActiveMenu = false
                            btnBuscarLibro.isActiveMenu = false
                            btnEliminarLibro.isActiveMenu = false
                            btnAgregarUsuario.isActiveMenu = false
                            btnEliminarUsuario.isActiveMenu = false
                            btnEditarUsuario.isActiveMenu = false
                            btnPassword.isActiveMenu = false
                            btnDeudas.isActiveMenu = false
                            btnSettings.isActiveMenu = true
                            stackView.push(Qt.resolvedUrl("pages/configuracion.qml"))
                            labelRightInfo.text = "|Configuración"
                        }
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#2c313c"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        initialItem: Qt.resolvedUrl("pages/paginaInicio.qml")
                    }
                }

                Rectangle {
                    id: rectangle
                    color: "#282c34"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelTopInfo1
                        text: qsTr("Application Description")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.leftMargin: 10
                        anchors.rightMargin: 30
                    }
                }
            }
        }
            MouseArea {
                id: resizeWindow
                x: 953
                y: 548
                width: 25
                height: 25
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                cursorShape: Qt.SizeFDiagCursor
                antialiasing: false

                DragHandler{
                    target: null
                    onActiveChanged: if(active){
                                         main_window.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                     }
                }

                Image {
                    id: resizeImage
                    width: 16
                    height: 16
                    opacity: 0.5
                    anchors.fill: parent
                    source: "../images/svg_images/resize_icon.svg"
                    anchors.leftMargin: 5
                    anchors.topMargin: 5
                    sourceSize.height: 16
                    sourceSize.width: 16
                    fillMode: Image.PreserveAspectFit
                    antialiasing: false
                }
            }
        }

    MouseArea {
        id: resizeLeft
        width: 12
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.leftMargin: 0
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 main_window.startSystemResize(Qt.LeftEdge)
                             }
        }
    }

    MouseArea {
        id: resizeRight
        width: 12
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 main_window.startSystemResize(Qt.RightEdge)
                             }
        }
    }

    MouseArea {
        id: resizeBottom
        y: 570
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 0
        anchors.leftMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 main_window.startSystemResize(Qt.BottomEdge)
                             }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:11}D{i:21}D{i:24}D{i:25}D{i:26}D{i:27}D{i:28}D{i:29}
D{i:30}D{i:31}
}
##^##*/
