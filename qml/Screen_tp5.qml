import QtQuick
import QtQuick.Controls
import QtCore
import QtQuick.Controls.Material 2.12
import Qt.labs.qmlmodels 1.0
import QtCharts
import QtQuick.Layouts

Rectangle {
    width: app.width
    height: app.height-rect.height
    color: Material.background
    Material.background:Material.background

    property string colorfxy1_nonlinearsyst: Material.background
    property string colorfxy2_nonlinearsyst: Material.background

    property string colorgxy1PF_nonlinearsyst: Material.background
    property string colorgxy2PF_nonlinearsyst: Material.background

    property string colordf1xyNR_nonlinearsyst: Material.background
    property string colordf2xyNR_nonlinearsyst: Material.background

    function fmethodeindex_nonlinearsyst()
    {
        if (radiobutton1ischecked_nonlinearsyst) methodeindex_nonlinearsyst= 0
        if (radiobutton2ischecked_nonlinearsyst) methodeindex_nonlinearsyst= 1
    }
    Connections {
        target: CalculHaf
        function onRequestDialog_nonlinearsyst(title,error){
            dialogMessageErrorFparser.title=title
            textfirstuseofappdialog_tp.text=error
            dialogMessageErrorFparser.open()
        }
        function onRequestSelectEndtable_nonlinearsyst(){
            tableVerticalBarPF_nonlinearsyst.setPosition(1 - tableVerticalBarPF_nonlinearsyst.size)
            tableVerticalBarNR_nonlinearsyst.setPosition(1 - tableVerticalBarNR_nonlinearsyst.size)
        }
        function onRequestXiPF_nonlinearsyst(i,xi,yi,f1xiyi,f2xiyi){
            tableModelxiPF_nonlinearsyst.appendRow({i:i,xi:xi,yi:yi,f1xiyi:f1xiyi,f2xiyi:f2xiyi})
        }
        function onRequestXiNR_nonlinearsyst(i,xi,yi,f1xiyi,f2xiyi){
            tableModelxiNR_nonlinearsyst.appendRow({i:i,xi:xi,yi:yi,f1xiyi:f1xiyi,f2xiyi:f2xiyi})
        }
    }
    Dialog {
        id: dialogMessageErrorFparser
        title: "Basic Numerical Methods ver "+appVer
        anchors.centerIn: Overlay.overlay
        Material.theme: themeofapp==="Dark"? Material.Dark:Material.Light
        width: parent.width
        Text {
            id:textfirstuseofappdialog_tp
            width: parent.width
            text: "Error"
            wrapMode: Text.Wrap
            font.bold : true
            color: Material.foreground
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        standardButtons: Dialog.Ok
        onAccepted: {
            tableVerticalBarPF_nonlinearsyst.setPosition(1 - tableVerticalBarPF_nonlinearsyst.size)
            tableVerticalBarNR_nonlinearsyst.setPosition(1 - tableVerticalBarNR_nonlinearsyst.size)
            close()
        }
    }

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: parent.width
        contentHeight: column.height+50
        Column {
            id:column
            width: parent.width
            anchors.margins: 10
            spacing: 10
            Row {
                width: parent.width
                spacing: 0
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Calcul_tp6.width)/2
                    orientation: Qt.Horizontal
                }
                Label {
                    id:label1_Calcul_tp6
                    width: label1_Calcul_tp6.text.width
                    text: "Given"
                    anchors.fill: parent.center
                }
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Calcul_tp6.width)/2
                    orientation: Qt.Horizontal
                }
            }
            Row {
                width:parent.width-10
                spacing: 5
                TextField {
                    id:textfxy1_nonlinearsyst
                    width: parent.width/2-image1nonlineareqt.width/2
                    placeholderText: qsTr("f1(x,y)")
                    text: settings.fxy1_nonlinearsyst
                    color: colorfxy1_nonlinearsyst=="white"?  themeofapp==="Dark"? "white":"black" :"red"
                    onTextChanged: {if (textfxy1_nonlinearsyst.text==="nan" || textfxy1_nonlinearsyst.text==="NaN") textfxy1_nonlinearsyst.text=fxy1_nonlinearsyst ;
                        fxy1_nonlinearsyst=textfxy1_nonlinearsyst.text;
                        colorfxy1_nonlinearsyst=CalculHaf.textChangedinfunctionfxy1(fxy1_nonlinearsyst)
                    }
                }
                Image {
                    id: image1nonlineareqt
                    width: 15
                    height: textfxy1_nonlinearsyst.height
                    smooth: true
                    fillMode: Image.PreserveAspectFit
                    source: "images/help.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("clicked")
                            dialogMessageErrorFparser.title="Help"
                            textfirstuseofappdialog_tp.text="The permutation of f1(x,y) by f2(x,y) can lead to find another solution of the system or to make the method convergent!"
                            dialogMessageErrorFparser.open()
                        }
                    }


                }
                TextField {
                    id:textfxy2_nonlinearsyst
                    width: parent.width/2-image1nonlineareqt.width/2
                    placeholderText: qsTr("f2(x,y)")
                    text: settings.fxy2_nonlinearsyst
                    color: colorfxy2_nonlinearsyst=="white"?  themeofapp==="Dark"? "white":"black" :"red"
                    onTextChanged: {if (textfxy2_nonlinearsyst.text==="nan" || textfxy2_nonlinearsyst.text==="NaN") textfxy2_nonlinearsyst.text=fxy2_nonlinearsyst ;
                        fxy2_nonlinearsyst=textfxy2_nonlinearsyst.text;
                        colorfxy2_nonlinearsyst=CalculHaf.textChangedinfunctionfxy2(fxy2_nonlinearsyst)
                    }
                }
            }
            StackLayout {
                id: view
                width: parent.width
                currentIndex: methodeindex_nonlinearsyst
                Column {
                    id:column1_nonlinearsyst
                    width: parent.width
                    anchors.margins: 10
                    spacing: 10
                    Row {
                        width: parent.width-10
                        spacing: 5
                        TextField {
                            id:textgxy1_nonlinearsyst
                            width: parent.width/2-image2nonlineareqt.width/2
                            placeholderText: qsTr("g1(x,y)")
                            text: settings.gxy1PF_nonlinearsyst
                            color: colorgxy1PF_nonlinearsyst=="white"?  themeofapp==="Dark"? "white":"black" :"red"
                            onTextChanged: {if (textgxy1_nonlinearsyst.text==="nan" || textgxy1_nonlinearsyst.text==="NaN") textgxy1_nonlinearsyst.text=gxy1PF_nonlinearsyst ;
                                gxy1PF_nonlinearsyst=textgxy1_nonlinearsyst.text;
                                colorgxy1PF_nonlinearsyst=CalculHaf.textChangedinfunctiongxy1PF(gxy1PF_nonlinearsyst)
                            }
                        }
                        Image {
                            id: image2nonlineareqt
                            width: 15
                            height: textgxy1_nonlinearsyst.height
                            smooth: true
                            fillMode: Image.PreserveAspectFit
                            source: "images/help.png"
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    console.log("clicked")
                                    dialogMessageErrorFparser.title="Help"
                                    textfirstuseofappdialog_tp.text="Changing g1(x,y) or/and g2(x,y) can make the method convergent!"
                                    dialogMessageErrorFparser.open()
                                }
                            }
                        }
                        TextField {
                            id:textgxy2_nonlinearsyst
                            width: parent.width/2-image2nonlineareqt.width/2
                            placeholderText: qsTr("g2(x,y)")
                            text: settings.gxy2PF_nonlinearsyst
                            color: colorgxy2PF_nonlinearsyst=="white"? themeofapp==="Dark"? "white":"black" :"red"
                            onTextChanged: {if (textgxy2_nonlinearsyst.text==="nan" || textgxy2_nonlinearsyst.text==="NaN") textgxy2_nonlinearsyst.text=gxy2PF_nonlinearsyst ;
                                gxy2PF_nonlinearsyst=textgxy2_nonlinearsyst.text;
                                colorgxy2PF_nonlinearsyst=CalculHaf.textChangedinfunctiongxy2PF(gxy2PF_nonlinearsyst)
                            }
                        }
                    }
                    Row {
                        width: parent.width-10
                        spacing: 5
                        TextField {
                            id:textx0PF_nonlinearsyst
                            width: parent.width/2-image3nonlineareqt.width/2
                            placeholderText: qsTr("x0")
                            text: settings.x0PF_nonlinearsyst
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textx0PF_nonlinearsyst.text==="nan" || textx0PF_nonlinearsyst.text==="NaN") textx0PF_nonlinearsyst.text=x0PF_nonlinearsyst ;
                                x0PF_nonlinearsyst=textx0PF_nonlinearsyst.text;
                            }
                        }
                        Image {
                            id: image3nonlineareqt
                            width: 15
                            height: textx0PF_nonlinearsyst.height
                            smooth: true
                            fillMode: Image.PreserveAspectFit
                            source: "images/help.png"
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    console.log("clicked")
                                    dialogMessageErrorFparser.title="Help"
                                    textfirstuseofappdialog_tp.text="The change of x0 or/and y0 can lead to find another solution of the system or to make the method convergent!"
                                    dialogMessageErrorFparser.open()
                                }
                            }
                        }
                        TextField {
                            id:texty0PF_nonlinearsyst
                            width: parent.width/2-image3nonlineareqt.width/2
                            placeholderText: qsTr("y0")
                            text: settings.y0PF_nonlinearsyst
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (texty0PF_nonlinearsyst.text==="nan" || texty0PF_nonlinearsyst.text==="NaN") texty0PF_nonlinearsyst.text=y0PF_nonlinearsyst ;
                                y0PF_nonlinearsyst=texty0PF_nonlinearsyst.text;
                            }
                        }
                    }

                }
                Column {
                    id:column1NR_nonlinearsyst
                    width: parent.width
                    anchors.margins: 10
                    spacing: 10
                    Row {
                        width: parent.width-5
                        spacing: 5
                        TextField {
                            id:textdf1xyNR_nonlinearsyst
                            width: parent.width/2
                            placeholderText: qsTr("df1(x,y)/dx")
                            text: settings.df1xyNR_nonlinearsyst
                            color: colordf1xyNR_nonlinearsyst=="white"?  themeofapp==="Dark"? "white":"black" :"red"
                            onTextChanged: {if (textdf1xyNR_nonlinearsyst.text==="nan" || textdf1xyNR_nonlinearsyst.text==="NaN") textdf1xyNR_nonlinearsyst.text=df1xyNR_nonlinearsyst ;
                                df1xyNR_nonlinearsyst=textdf1xyNR_nonlinearsyst.text;
                                colordf1xyNR_nonlinearsyst=CalculHaf.textChangedinfunctiondf1xyNR(df1xyNR_nonlinearsyst)
                            }
                        }
                        TextField {
                            id:textdf2xyNR_nonlinearsyst
                            width: parent.width/2
                            placeholderText: qsTr("df2(x,y)/dy")
                            text: settings.df2xyNR_nonlinearsyst
                            color: colordf2xyNR_nonlinearsyst=="white"? themeofapp==="Dark"? "white":"black" :"red"
                            onTextChanged: {if (textdf2xyNR_nonlinearsyst.text==="nan" || textdf2xyNR_nonlinearsyst.text==="NaN") textdf2xyNR_nonlinearsyst.text=df2xyNR_nonlinearsyst ;
                                df2xyNR_nonlinearsyst=textdf2xyNR_nonlinearsyst.text;
                                colordf2xyNR_nonlinearsyst=CalculHaf.textChangedinfunctiondf2xyNR(df2xyNR_nonlinearsyst)
                            }
                        }
                    }
                    Row {
                        width: parent.width-10
                        spacing: 5
                        TextField {
                            id:textx0NR_nonlinearsyst
                            width: parent.width/2-image3nonlineareqt.width/2
                            placeholderText: qsTr("x0")
                            text: settings.x0NR_nonlinearsyst
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textx0NR_nonlinearsyst.text==="nan" || textx0NR_nonlinearsyst.text==="NaN") textx0NR_nonlinearsyst.text=x0NR_nonlinearsyst ;
                                x0NR_nonlinearsyst=textx0NR_nonlinearsyst.text;
                            }
                        }
                        Image {
                            id: image3NRnonlineareqt
                            width: 15
                            height: textx0NR_nonlinearsyst.height
                            smooth: true
                            fillMode: Image.PreserveAspectFit
                            source: "images/help.png"
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    console.log("clicked")
                                    dialogMessageErrorFparser.title="Help"
                                    textfirstuseofappdialog_tp.text="The change of x0 or/and y0 can lead to find another solution of the system or to make the method convergent!"
                                    dialogMessageErrorFparser.open()
                                }
                            }
                        }
                        TextField {
                            id:texty0NR_nonlinearsyst
                            width: parent.width/2-image3NRnonlineareqt.width/2
                            placeholderText: qsTr("y0")
                            text: settings.y0NR_nonlinearsyst
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (texty0NR_nonlinearsyst.text==="nan" || texty0NR_nonlinearsyst.text==="NaN") texty0NR_nonlinearsyst.text=y0NR_nonlinearsyst ;
                                y0NR_nonlinearsyst=texty0NR_nonlinearsyst.text;
                            }
                        }
                    }
                }
            }
            Row{
                width:parent.width
                spacing: 5
                Column {
                    id:column_buttongroup1_nonlinearsyst
                    width: rowgroupbutton1_nonlinearsyst.implicitWidth
                    spacing: 1
                    ButtonGroup {
                        id:buttongroup1_nonlinearsyst
                        buttons: rowgroupbutton1_nonlinearsyst.children
                        exclusive : true
                        onClicked: fmethodeindex_nonlinearsyst()
                    }
                    Column {
                        id:rowgroupbutton1_nonlinearsyst
                        width:  parent.width
                        spacing: -10
                        RadioButton {
                            id:radiobutton1_nonlinearsyst
                            checked: true
                            text: qsTr("Fixed point")
                            ButtonGroup.group: buttongroup1_nonlinearsyst
                            onCheckedChanged: {
                                stackLayoutPF_nonlinearsyst.currentIndex=1
                                radiobutton1ischecked_nonlinearsyst=radiobutton1_nonlinearsyst.checked
                            }
                        }
                        RadioButton {
                            id:radiobutton2_nonlinearsyst
                            text: qsTr("Newton-Raphson")
                            ButtonGroup.group: buttongroup1_nonlinearsyst
                            onCheckedChanged: {
                                stackLayoutNR_nonlinearsyst.currentIndex=1
                                radiobutton2ischecked_nonlinearsyst=radiobutton2_nonlinearsyst.checked
                            }
                        }
                    }
                }

                    Row {
                        width: parent.width-column_buttongroup1_nonlinearsyst.width-15
                        spacing: 5
                        anchors.verticalCenter: column_buttongroup1_nonlinearsyst.verticalCenter
                        TextField {
                            id:textNbreMaxItera_nonlinearsyst
                            width: parent.width/3
                            placeholderText: qsTr("Max number of iterations")
                            text: settings.nbreMaxItera_nonlinearsyst
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textNbreMaxItera_nonlinearsyst.text==="nan" || textNbreMaxItera_nonlinearsyst.text==="NaN") textNbreMaxItera_nonlinearsyst.text=x0PF_nonlinearsyst ;
                                nbreMaxItera_nonlinearsyst=textNbreMaxItera_nonlinearsyst.text;
                            }
                        }
                        TextField {
                            id:textNbreNbreDecim_nonlinearsyst
                            width: parent.width/3
                            placeholderText: qsTr("Number of decimals")
                            text: settings.nbreDecim_nonlinearsyst
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textNbreNbreDecim_nonlinearsyst.text==="nan" || textNbreNbreDecim_nonlinearsyst.text==="NaN") textNbreNbreDecim_nonlinearsyst.text=nbreDecim_nonlinearsyst ;
                                nbreDecim_nonlinearsyst=textNbreNbreDecim_nonlinearsyst.text;
                            }
                        }
                        TextField {
                            id:textNbreEps_nonlinearsyst
                            width: parent.width/3
                            placeholderText: qsTr("Precision")
                            text: settings.eps_nonlinearsyst
                            inputMethodHints: Qt.ImhDigitsOnly
                            onTextChanged: {if (textNbreEps_nonlinearsyst.text==="nan" || textNbreEps_nonlinearsyst.text==="NaN") textNbreEps_nonlinearsyst.text=eps_nonlinearsyst ;
                                eps_nonlinearsyst=textNbreEps_nonlinearsyst.text;
                            }
                        }
                    }

            }

            Button {
                id: buttonCalcul1_nonlinearsyst
                width: parent.width
                text: "Solve f1(x,y)=0 and f2(x,y)=0 "
                onClicked: {
                    if (radiobutton1ischecked_nonlinearsyst){
                        stackLayoutPF_nonlinearsyst.currentIndex=0
                        tableModelxiPF_nonlinearsyst.clear()
                        CalculHaf.hafresolutionSysteqtnonlineaire_ptfixe(fxy1_nonlinearsyst, fxy2_nonlinearsyst,  gxy1PF_nonlinearsyst,  gxy2PF_nonlinearsyst, x0PF_nonlinearsyst,  y0PF_nonlinearsyst, eps_nonlinearsyst, nbreMaxItera_nonlinearsyst, nbreDecim_nonlinearsyst)
                    }
                    if (radiobutton2ischecked_nonlinearsyst){
                        stackLayoutNR_nonlinearsyst.currentIndex=0
                        tableModelxiNR_nonlinearsyst.clear()
                        CalculHaf.hafresolutionSysteqtnonlineaire_newtonraphson(fxy1_nonlinearsyst, fxy2_nonlinearsyst,  df1xyNR_nonlinearsyst,  df2xyNR_nonlinearsyst, x0NR_nonlinearsyst,  y0NR_nonlinearsyst, eps_nonlinearsyst, nbreMaxItera_nonlinearsyst, nbreDecim_nonlinearsyst)
                    }
                }
            }

            StackLayout {
                id: stackLayout_nonlinearsyst
                width: parent.width
                currentIndex: methodeindex_nonlinearsyst
                StackLayout {
                    id: stackLayoutPF_nonlinearsyst
                    width: parent.width
                    Rectangle {
                        id:rectabviewPF_nonlinearsyst
                        width: parent.width
                        color: Material.background
                        height: 175
                        HorizontalHeaderView {
                            id: horizontalHeaderPF_nonlinearsyst
                            anchors.left: tabviewPF_nonlinearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewPF_nonlinearsyst
                            clip: true
                            model: ["i","x(i)","y(i)","f1(x(i),y(i))","f2(x(i),y(i))"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderPF_nonlinearsyst
                            anchors.top: tabviewPF_nonlinearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewPF_nonlinearsyst
                            clip: true
                            visible: false
                        }
                        TableView {
                            id:tabviewPF_nonlinearsyst
                            anchors.left: verticalHeaderPF_nonlinearsyst.right
                            anchors.top: horizontalHeaderPF_nonlinearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            height: 175
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarPF_nonlinearsyst;
                                active:true
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModelxiPF_nonlinearsyst
                                TableModelColumn { display: "i" }
                                TableModelColumn { display: "xi" }
                                TableModelColumn { display: "yi" }
                                TableModelColumn { display: "f1xiyi" }
                                TableModelColumn { display: "f2xiyi" }
                            }
                            delegate:  TextInput {
                                id:textItemxiPF_nonlinearsyst
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                color: Material.foreground
                                onTextEdited: {
                                    model.display = text
                                }
                                onTextChanged: tabviewPF_nonlinearsyst.forceLayout()
                                Rectangle {
                                    id: overlay
                                    anchors.fill: parent
                                    height: textItemxiPF_nonlinearsyst.implicitHeight
                                    width: textItemxiPF_nonlinearsyst.implicitWidth
                                    color: Material.background
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                    }
                    Rectangle {
                        Layout.alignment: Qt.AlignTop
                        width: parent.width
                        height: image1_nonlineareqt.height
                        color: Material.background
                        Image {
                            id: image1_nonlineareqt
                            width: parent.width
                            smooth: true
                            fillMode: Image.PreserveAspectFit
                            source: "images/PointFixe-SystNonLineaire.bmp"
                        }
                    }
                }

                StackLayout {
                    id: stackLayoutNR_nonlinearsyst
                    width: parent.width
                    Rectangle {
                        id:rectabviewNR_nonlinearsyst
                        width: parent.width
                        color: Material.background
                        height: 175
                        HorizontalHeaderView {
                            id: horizontalHeaderNR_nonlinearsyst
                            anchors.left: tabviewNR_nonlinearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewNR_nonlinearsyst
                            clip: true
                            model: ["i","x(i)","y(i)","f1(x(i),y(i))","f2(x(i),y(i))"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderNR_nonlinearsyst
                            anchors.top: tabviewNR_nonlinearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewNR_nonlinearsyst
                            visible: false
                            clip: true
                        }
                        TableView {
                            id:tabviewNR_nonlinearsyst
                            anchors.left: verticalHeaderNR_nonlinearsyst.right
                            anchors.top: horizontalHeaderNR_nonlinearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            height: 175
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarNR_nonlinearsyst;
                                active:true
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModelxiNR_nonlinearsyst
                                TableModelColumn { display: "i" }
                                TableModelColumn { display: "xi" }
                                TableModelColumn { display: "yi" }
                                TableModelColumn { display: "f1xiyi" }
                                TableModelColumn { display: "f2xiyi" }
                            }
                            delegate:  TextInput {
                                id:textItemxiNR_nonlinearsyst
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                color: Material.foreground
                                onTextEdited: {
                                    model.display = text
                                }
                                onTextChanged: tabviewNR_nonlinearsyst.forceLayout()
                                Rectangle {
                                    id: overlay2
                                    anchors.fill: parent
                                    height: textItemxiNR_nonlinearsyst.implicitHeight
                                    width: textItemxiNR_nonlinearsyst.implicitWidth
                                    color: Material.background
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                    }
                    Rectangle {
                        Layout.alignment: Qt.AlignTop
                        width: parent.width
                        height: image2_nonlineareqt.height
                        color: Material.background
                        Image {
                            id: image2_nonlineareqt
                            width: parent.width
                            smooth: true
                            fillMode: Image.PreserveAspectFit
                            source: "images/Newton-Raphson-SystNonLineaire.bmp"
                        }
                    }
                }
            }
        }
    }
    Component.onCompleted: {
        radiobutton1_nonlinearsyst.checked=true
    }
}
