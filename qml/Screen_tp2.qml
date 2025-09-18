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
    property string colorfxy_edoeqt: Material.background

    function fmethodeindex_edoeqt()
    {
        stackLayoutIndex_edoeqt=0
        if (radiobutton1ischecked_edoeqt) methodeindex_edoeqt= 0
        if (radiobutton2ischecked_edoeqt) methodeindex_edoeqt= 1
        if (radiobutton3ischecked_edoeqt) methodeindex_edoeqt= 2
    }
    Connections {
        target: CalculHaf
        function onRequestDialog_edoeqt(title,error){
            dialogMessageErrorFparser.title=title
            textfirstuseofappdialog_tp.text=error
            dialogMessageErrorFparser.open()
        }

        function onRequestXiodeeqt(i,xi,yi){
            tableModelxi_edoeqt.appendRow({i:i,xi:(xi).toFixed(nbreDecim_edoeqt),yi:(yi).toFixed(nbreDecim_edoeqt)})
        }

    }
    Dialog {
        id: dialogMessageErrorFparser
        title: "Basic Numerical Methods ver "+appVer
        anchors.centerIn: Overlay.overlay
        width: parent.width
        Material.theme: themeofapp==="Dark"? Material.Dark:Material.Light
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
            TextField {
                id:textfxy_edoeqt
                width: parent.width
                placeholderText: qsTr("y'=f(x,y)")
                text: settings.fxy_edoeqt
                color: colorfxy_edoeqt=="white"?  themeofapp==="Dark"? "white":"black" :"red"
                onTextChanged: {if (textfxy_edoeqt.text==="nan" || textfxy_edoeqt.text==="NaN") textfxy_edoeqt.text=fxy_edoeqt ;
                    fxy_edoeqt=textfxy_edoeqt.text;
                    colorfxy_edoeqt=CalculHaf.textChangedinfunctionyprime(fxy_edoeqt)
                }
            }


            Row{
                width:parent.width-5
                spacing: 3
                TextField {
                    id:texta_edoeqt
                    width: parent.width/2
                    placeholderText: qsTr("a")
                    text: settings.a_edoeqt
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (texta_edoeqt.text==="nan" || texta_edoeqt.text==="NaN") texta_edoeqt.text=a_edoeqt ;
                        a_edoeqt=texta_edoeqt.text;
                        dx_edoeqt=(b_edoeqt-a_edoeqt)/(nbrePts_edoeqt-1);
                        textdx_edoeqt.text=parseFloat(dx_edoeqt).toFixed(nbreDecim_edoeqt);
                    }
                }
                TextField {
                    id:textb_edoeqt
                    width: parent.width/2
                    placeholderText: qsTr("b")
                    text: settings.b_edoeqt
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textb_edoeqt.text==="nan" || textb_edoeqt.text==="NaN") textb_edoeqt.text=b_edoeqt ;
                        b_edoeqt=textb_edoeqt.text;
                        dx_edoeqt=(b_edoeqt-a_edoeqt)/(nbrePts_edoeqt-1);
                        textdx_edoeqt.text=parseFloat(dx_edoeqt).toFixed(nbreDecim_edoeqt);
                    }
                }
            }

            Row{
                width:parent.width-5
                spacing: 3
                TextField {
                    id:textdx_edoeqt
                    width: parent.width/2
                    placeholderText: qsTr("dx")
                    text: settings.dx_edoeqt
                    readOnly : true
                    selectByMouse: true
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textdx_edoeqt.text==="nan" || textdx_edoeqt.text==="NaN") textdx_edoeqt.text=dx_edoeqt ;
                        dx_edoeqt=textdx_edoeqt.text;
                    }
                }
                TextField {
                    id:textya_edoeqt
                    width: parent.width/2
                    placeholderText: qsTr("y(a)")
                    text: settings.ya_edoeqt
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textya_edoeqt.text==="nan" || textya_edoeqt.text==="NaN") textya_edoeqt.text=ya_edoeqt ;
                        ya_edoeqt=textya_edoeqt.text;
                    }
                }
            }


            Row{
                width:parent.width
                spacing: 3
                Column {
                    id:column_buttongroup1_edoeqt
                    width: rowgroupbutton1_edoeqt.implicitWidth
                    anchors.margins: 10
                    spacing: 1
                    ButtonGroup {
                        id:buttongroup1_edoeqt
                        buttons: rowgroupbutton1_edoeqt.children
                        exclusive : true
                        onClicked: fmethodeindex_edoeqt()
                    }
                    Column {
                        id:rowgroupbutton1_edoeqt
                        width:  parent.width
                        spacing: -10
                        RadioButton {
                            id:radiobutton1_edoeqt
                            checked: true
                            text: qsTr("Euler explicit")
                            ButtonGroup.group: buttongroup1_edoeqt
                            onCheckedChanged: radiobutton1ischecked_edoeqt=radiobutton1_edoeqt.checked
                        }
                        RadioButton {
                            id:radiobutton2_edoeqt
                            text: qsTr("Runge-Kutta 4")
                            ButtonGroup.group: buttongroup1_edoeqt
                            onCheckedChanged: radiobutton2ischecked_edoeqt=radiobutton2_edoeqt.checked
                        }
                        RadioButton {
                            id:radiobutton3_edoeqt
                            text: qsTr("Kutta-Merson")
                            ButtonGroup.group: buttongroup1_edoeqt
                            onCheckedChanged: radiobutton3ischecked_edoeqt=radiobutton3_edoeqt.checked
                        }
                    }
                }
                Column {
                    id:column282
                    width: parent.width-column_buttongroup1_edoeqt.width-10
                    anchors.margins: 10
                    spacing: 10
                    TextField {
                        id:textNbrePts_edoeqt
                        width: parent.width
                        placeholderText: qsTr("Number of points")
                        text: settings.nbrePts_edoeqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textNbrePts_edoeqt.text==="nan" || textNbrePts_edoeqt.text==="NaN") textNbrePts_edoeqt.text=nbrePts_edoeqt ;
                            nbrePts_edoeqt=textNbrePts_edoeqt.text;
                            dx_edoeqt=(b_edoeqt-a_edoeqt)/(nbrePts_edoeqt-1);
                            textdx_edoeqt.text=parseFloat(dx_edoeqt).toFixed(nbreDecim_edoeqt);
                        }
                    }
                    TextField {
                        id:textNbreNbreDecim_edoeqt
                        width: parent.width
                        placeholderText: qsTr("Number of decimals")
                        text: settings.nbreDecim_edoeqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textNbreNbreDecim_edoeqt.text==="nan" || textNbreNbreDecim_edoeqt.text==="NaN") textNbreNbreDecim_edoeqt.text=nbreDecim_edoeqt ;
                            nbreDecim_edoeqt=textNbreNbreDecim_edoeqt.text;
                        }
                    }
                }
            }
            Button {
                id: buttonCalculate_edoeqt
                width: parent.width
                text: "Calculate"
                onClicked: {
                    if (radiobutton1ischecked_edoeqt){
                        tableModelxi_edoeqt.clear()
                        stackLayoutIndex_edoeqt=1
                        CalculHaf.hafresolutioneqtdifferentielle_Euler_explicite(fxy_edoeqt, a_edoeqt, b_edoeqt,dx_edoeqt,ya_edoeqt,nbrePts_edoeqt,nbreDecim_edoeqt)
                    }
                    if (radiobutton2ischecked_edoeqt){
                        tableModelxi_edoeqt.clear()
                        stackLayoutIndex_edoeqt=1
                        CalculHaf.hafresolutioneqtdifferentielle_Runge_Kutta(fxy_edoeqt, a_edoeqt, b_edoeqt,dx_edoeqt,ya_edoeqt,nbrePts_edoeqt,nbreDecim_edoeqt)
                    }
                    if (radiobutton3ischecked_edoeqt){
                        tableModelxi_edoeqt.clear()
                        stackLayoutIndex_edoeqt=1
                        CalculHaf.hafresolutioneqtdifferentielle_Kutta_Merson(fxy_edoeqt, a_edoeqt, b_edoeqt,dx_edoeqt,ya_edoeqt,nbrePts_edoeqt,nbreDecim_edoeqt)
                    }
                }
            }

            StackLayout {
                id: stackLayoutimageresultats_edoeqt
                width: parent.width
                currentIndex: stackLayoutIndex_edoeqt
                StackLayout {
                    id: viewimagemethode_edoeqt
                    currentIndex: methodeindex_edoeqt
                    Column {
                        Layout.alignment: Qt.AlignTop
                        width: parent.width
                        height: image1linearsyst.height
                    Image {
                        id: image1linearsyst
                        width: parent.width
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Euleur_explicite.bmp"
                    }
                    }
                    Column {
                        Layout.alignment: Qt.AlignTop
                        width: parent.width
                        height: image2linearsyst.height
                    Image {
                        id: image2linearsyst
                        width: parent.width
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Rung_Kutta4.bmp"
                    }
                    }
                    Column {
                        Layout.alignment: Qt.AlignTop
                        width: parent.width
                        height: image3linearsyst.height
                    Image {
                        id: image3linearsyst
                        width: parent.width
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Kutta_Merson.bmp"
                    }
                    }
                }
            Rectangle {
                id:rectabview_edoeqt
                width: parent.width
                height: nbrePts_edoeqt*45
                color: Material.background
                HorizontalHeaderView {
                    id: horizontalHeader_edoeqt
                    anchors.left: tabview_edoeqt.left
                    anchors.top: parent.top
                    syncView: tabview_edoeqt
                    clip: true
                    model: ["i" , "x[i]", "y[i]"]
                }
                VerticalHeaderView {
                    id: verticalHeader_edoeqt
                    anchors.top: tabview_edoeqt.top
                    anchors.left: parent.left
                    syncView: tabview_edoeqt
                    clip: true
                    visible: false
                }
                TableView {
                    id:tabview_edoeqt
                    anchors.left: verticalHeader_edoeqt.right
                    anchors.top: horizontalHeader_edoeqt.bottom
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    height: nbrePts_edoeqt*37
                    clip: true
                    columnSpacing: 1
                    rowSpacing: 1
                    ScrollBar.vertical: ScrollBar {
                        id: tableVerticalBar_edoeqt;
                        active:true
                        policy:ScrollBar.AlwaysOn
                    }
                    boundsBehavior: Flickable.StopAtBounds
                    model: TableModel {
                        id:tableModelxi_edoeqt
                        TableModelColumn { display: "i" }
                        TableModelColumn { display: "xi" }
                        TableModelColumn { display: "yi" }
                    }
                    delegate:  TextInput {
                        id:textItemxi_edoeqt
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
                        Rectangle {
                            id: overlay
                            anchors.fill: parent
                            height: textItemxi_edoeqt.implicitHeight
                            width: textItemxi_edoeqt.implicitWidth
                            color: Material.background
                            z: -1
                            border.color: "steelblue"
                        }
                    }
                }
            }
            }
            }
    }

    Component.onCompleted: {
        radiobutton1_edoeqt.checked=true
    }
}
