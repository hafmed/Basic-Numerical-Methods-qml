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
    color:"transparent"
    Material.theme: Material.Dark
    Material.accent: Material.Pink
    Plotfx{
        id:plotfx
    }
    property string colorfx_nonlineareqt: "white"
    property string colorgxPF_nonlineareqt: "white"
    property string colorfprimNR_nonlineareqt: "white"

    function fmethodeindex_nonlineareqt()
    {
        if (radiobutton1ischecked_nonlineareqt) methodeindex_nonlineareqt= 0
        if (radiobutton2ischecked_nonlineareqt) methodeindex_nonlineareqt= 1
        if (radiobutton3ischecked_nonlineareqt) methodeindex_nonlineareqt= 2
        if (radiobutton4ischecked_nonlineareqt) methodeindex_nonlineareqt= 3
        if (radiobutton5ischecked_nonlineareqt) methodeindex_nonlineareqt= 4
    }
    Connections {
        target: CalculHaf
        function onRequestDialog_nonlineareqt(title,error){
            dialogMessageErrorFparser.title=title
            textfirstuseofappdialog_tp.text=error
            dialogMessageErrorFparser.open()
        }
        function onRequestSelectEndtable_nonlineareqt(){
            tableVerticalBarPF_nonlineareqt.setPosition(1 - tableVerticalBarPF_nonlineareqt.size)
            tableVerticalBarNR_nonlineareqt.setPosition(1 - tableVerticalBarNR_nonlineareqt.size)
            tableVerticalBarSEC_nonlineareqt.setPosition(1 - tableVerticalBarSEC_nonlineareqt.size)
            tableVerticalBarBS_nonlineareqt.setPosition(1 - tableVerticalBarBS_nonlineareqt.size)
            tableVerticalBarRF_nonlineareqt.setPosition(1 - tableVerticalBarRF_nonlineareqt.size)
        }
        function onRequestXiPF(i,xi,gxi,fxi){
            tableModelxiPF_nonlineareqt.appendRow({i:i,xi:(xi).toFixed(nbreDecim_nonlineareqt),gxi:(gxi).toFixed(nbreDecim_nonlineareqt),fxi:(fxi).toFixed(nbreDecim_nonlineareqt)})
        }
        function onRequestXiNR(i,xi,fprimxi,fxi){
            tableModelxiNR_nonlineareqt.appendRow({i:i,xi:(xi).toFixed(nbreDecim_nonlineareqt),fprimxi:(fprimxi).toFixed(nbreDecim_nonlineareqt),fxi:(fxi).toFixed(nbreDecim_nonlineareqt)})
        }
        function onRequestXiSEC(i,xi,fxi){
            tableModelxiSEC_nonlineareqt.appendRow({i:i,xi:(xi).toFixed(nbreDecim_nonlineareqt),fxi:(fxi).toFixed(nbreDecim_nonlineareqt)})
        }
        function onRequestXiBS(i,a,b,xm,fxmxfxa){
            tableModelxiBS_nonlineareqt.appendRow({i:i,a:(a).toFixed(nbreDecim_nonlineareqt),b:(b).toFixed(nbreDecim_nonlineareqt),xm:(xm).toFixed(nbreDecim_nonlineareqt),fxmxfxa:(fxmxfxa).toFixed(nbreDecim_nonlineareqt)})
        }
        function onRequestXiRF(i,a,b,r,fxaxfxr,fxbxfxr){
            tableModelxiRF_nonlineareqt.appendRow({i:i,a:(a).toFixed(nbreDecim_nonlineareqt),b:(b).toFixed(nbreDecim_nonlineareqt),r:(r).toFixed(nbreDecim_nonlineareqt),fxaxfxr:(fxaxfxr).toFixed(nbreDecim_nonlineareqt),fxbxfxr:(fxbxfxr).toFixed(nbreDecim_nonlineareqt)})
        }
    }
    Dialog {
        id: dialogMessageErrorFparser
        title: "Basic Numerical Methods ver "+appVer
        anchors.centerIn: Overlay.overlay
        width: parent.width
        Text {
            id:textfirstuseofappdialog_tp
            width: parent.width
            text: "Error"
            wrapMode: Text.Wrap
            font.bold : true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        standardButtons: Dialog.Ok
        onAccepted: {
            tableVerticalBarPF_nonlineareqt.setPosition(1 - tableVerticalBarPF_nonlineareqt.size)
            tableVerticalBarNR_nonlineareqt.setPosition(1 - tableVerticalBarNR_nonlineareqt.size)
            tableVerticalBarSEC_nonlineareqt.setPosition(1 - tableVerticalBarSEC_nonlineareqt.size)
            tableVerticalBarBS_nonlineareqt.setPosition(1 - tableVerticalBarBS_nonlineareqt.size)
            tableVerticalBarRF_nonlineareqt.setPosition(1 - tableVerticalBarRF_nonlineareqt.size)
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
                width: parent.width-15
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
                Image {
                    id: image1help_nonlineareqt
                    width: 15
                    height: label1_Calcul_tp6.height
                    smooth: true
                    fillMode: Image.PreserveAspectFit
                    source: "images/help.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("clicked")
                            dialogMessageErrorFparser.title="Help"
                            textfirstuseofappdialog_tp.text="Function can contain:
                            ^ * / + -
                            pow(x,3)
                            pi
                            sqrt()
                            sin() cos() tan() cot()
                            asin() acos() atan()
                            sinh() cosh() tanh()
                            asinh() acosh() atanh()
                            log() log10() exp()
                            abs() ; ....."
                            dialogMessageErrorFparser.open()
                        }
                    }
                }
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Calcul_tp6.width)/2
                    orientation: Qt.Horizontal
                }
            }
            Row {
                width:parent.width
                spacing: 5
                TextField {
                    id:textfx_nonlineareqt
                    width: parent.width/3*2
                    placeholderText: qsTr("f(x)")
                    text: settings.fx_nonlineareqt
                    color: colorfx_nonlineareqt
                    onTextChanged: {if (textfx_nonlineareqt.text==="nan" || textfx_nonlineareqt.text==="NaN") textfx_nonlineareqt.text=fx_nonlineareqt ;
                        fx_nonlineareqt=textfx_nonlineareqt.text;
                        colorfx_nonlineareqt=CalculHaf.textChangedinfunctionfx(fx_nonlineareqt)
                    }
                }
                Button {
                    id: buttonplotfx_nonlineareqt
                    width: parent.width/3
                    text: "plot f(x)"
                    onClicked: {
                        fx_plot=fx_nonlineareqt
                        plotfx.open()
                    }
                }
            }
            TabBar {
                id: tabbar1_nonlineareqt
                width: parent.width
                visible: false
                TabButton {
                    text: qsTr("Point fixe")
                    width: implicitWidth
                }
                TabButton {
                    text: qsTr("Newton-Raphson")
                    width: implicitWidth
                }
                TabButton {
                    text: qsTr("Sécante")
                    width: implicitWidth
                }
                TabButton {
                    text: qsTr("Dichotomie")
                    width: implicitWidth
                }
                TabButton {
                    text: qsTr("Regula Falsi")
                    width: implicitWidth
                }
                currentIndex: methodeindex_nonlineareqt
            }
            StackLayout {
                id: view
                width: parent.width
                currentIndex: tabbar1_nonlineareqt.currentIndex
                Column {
                    id:column1_nonlineareqt
                    width: parent.width
                    anchors.margins: 10
                    spacing: 10
                    TextField {
                        id:textgxPF_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("g(x)")
                        text: settings.gxPF_nonlineareqt
                        color: colorgxPF_nonlineareqt
                        onTextChanged: {if (textgxPF_nonlineareqt.text==="nan" || textgxPF_nonlineareqt.text==="NaN") textgxPF_nonlineareqt.text=gxPF_nonlineareqt ;
                            gxPF_nonlineareqt=textgxPF_nonlineareqt.text;
                            colorgxPF_nonlineareqt=CalculHaf.textChangedinfunctiongxPF(gxPF_nonlineareqt)
                        }
                    }
                    TextField {
                        id:textx0PF_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("x0")
                        text: settings.x0PF_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textx0PF_nonlineareqt.text==="nan" || textx0PF_nonlineareqt.text==="NaN") textx0PF_nonlineareqt.text=x0PF_nonlineareqt ;
                            x0PF_nonlineareqt=textx0PF_nonlineareqt.text;
                        }
                    }
                }
                /////
                Column {
                    id:columnNR_nonlineareqt
                    width: parent.width
                    anchors.margins: 10
                    spacing: 10
                    TextField {
                        id:textfprimNR_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("f'(x)")
                        text: settings.fprimNR_nonlineareqt
                        color: colorfprimNR_nonlineareqt
                        onTextChanged: {if (textfprimNR_nonlineareqt.text==="nan" || textfprimNR_nonlineareqt.text==="NaN") textfprimNR_nonlineareqt.text=fprimNR_nonlineareqt ;
                            fprimNR_nonlineareqt=textfprimNR_nonlineareqt.text;
                            colorfprimNR_nonlineareqt=CalculHaf.textChangedinfunctionfprimNR(fprimNR_nonlineareqt)
                        }
                    }
                    TextField {
                        id:textx0NR_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("x0")
                        text: settings.x0NR_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textx0NR_nonlineareqt.text==="nan" || textx0NR_nonlineareqt.text==="NaN") textx0NR_nonlineareqt.text=x0NR_nonlineareqt ;
                            x0NR_nonlineareqt=textx0NR_nonlineareqt.text;
                        }
                    }
                }

                Column {
                    id:columnSEC_nonlineareqt
                    width: parent.width
                    anchors.margins: 10
                    spacing: 10
                    TextField {
                        id:textx0SEC_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("x0")
                        text: settings.x0SEC_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textx0SEC_nonlineareqt.text==="nan" || textx0SEC_nonlineareqt.text==="NaN") textx0SEC_nonlineareqt.text=x0SEC_nonlineareqt ;
                            x0SEC_nonlineareqt=textx0SEC_nonlineareqt.text;
                        }
                    }
                    TextField {
                        id:textx1SEC_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("x1")
                        text: settings.x1SEC_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textx1SEC_nonlineareqt.text==="nan" || textx1SEC_nonlineareqt.text==="NaN") textx1SEC_nonlineareqt.text=x1SEC_nonlineareqt ;
                            x1SEC_nonlineareqt=textx1SEC_nonlineareqt.text;
                        }
                    }
                }

                Column {
                    id:columnBS_nonlineareqt
                    width: parent.width
                    anchors.margins: 10
                    spacing: 10
                    TextField {
                        id:textaBS_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("a")
                        text: settings.aBS_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textaBS_nonlineareqt.text==="nan" || textaBS_nonlineareqt.text==="NaN") textaBS_nonlineareqt.text=aBS_nonlineareqt ;
                            aBS_nonlineareqt=textaBS_nonlineareqt.text;
                        }
                    }
                    TextField {
                        id:textbBS_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("b")
                        text: settings.bBS_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textbBS_nonlineareqt.text==="nan" || textbBS_nonlineareqt.text==="NaN") textbBS_nonlineareqt.text=bBS_nonlineareqt ;
                            bBS_nonlineareqt=textbBS_nonlineareqt.text;
                        }
                    }
                }

                Column {
                    id:columnRF_nonlineareqt
                    width: parent.width
                    anchors.margins: 10
                    spacing: 10
                    TextField {
                        id:textaRF_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("a")
                        text: settings.aRF_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textaRF_nonlineareqt.text==="nan" || textaRF_nonlineareqt.text==="NaN") textaRF_nonlineareqt.text=aRF_nonlineareqt ;
                            aRF_nonlineareqt=textaRF_nonlineareqt.text;
                        }
                    }
                    TextField {
                        id:textbRF_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("b")
                        text: settings.bRF_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textbRF_nonlineareqt.text==="nan" || textbRF_nonlineareqt.text==="NaN") textbRF_nonlineareqt.text=bRF_nonlineareqt ;
                            bRF_nonlineareqt=textbRF_nonlineareqt.text;
                        }
                    }
                }

            }
            Row{
                width:parent.width
                spacing: 21
                Column {
                    id:column_buttongroup1_nonlineareqt
                    width: rowgroupbutton1_nonlineareqt.implicitWidth
                    anchors.margins: 10
                    spacing: 1
                    ButtonGroup {
                        id:buttongroup1_nonlineareqt
                        buttons: rowgroupbutton1_nonlineareqt.children
                        exclusive : true
                        onClicked: fmethodeindex_nonlineareqt()
                    }
                    Column {
                        id:rowgroupbutton1_nonlineareqt
                        width:  parent.width
                        spacing: -10
                        RadioButton {
                            id:radiobutton1_nonlineareqt
                            checked: true
                            text: qsTr("Fixed point")
                            ButtonGroup.group: buttongroup1_nonlineareqt
                            onCheckedChanged: radiobutton1ischecked_nonlineareqt=radiobutton1_nonlineareqt.checked
                        }
                        RadioButton {
                            id:radiobutton2_nonlineareqt
                            text: qsTr("Newton-Raphson")
                            ButtonGroup.group: buttongroup1_nonlineareqt
                            onCheckedChanged: radiobutton2ischecked_nonlineareqt=radiobutton2_nonlineareqt.checked
                        }
                        RadioButton {
                            id:radiobutton3_nonlineareqt
                            text: qsTr("Secant")
                            ButtonGroup.group: buttongroup1_nonlineareqt
                            onCheckedChanged: radiobutton3ischecked_nonlineareqt=radiobutton3_nonlineareqt.checked
                        }
                        RadioButton {
                            id:radiobutton4_nonlineareqt
                            text: qsTr("Bisection")
                            ButtonGroup.group: buttongroup1_nonlineareqt
                            onCheckedChanged: radiobutton4ischecked_nonlineareqt=radiobutton4_nonlineareqt.checked
                        }
                        RadioButton {
                            id:radiobutton5_nonlineareqt
                            text: qsTr("Regula Falsi")
                            ButtonGroup.group: buttongroup1_nonlineareqt
                            onCheckedChanged: radiobutton5ischecked_nonlineareqt=radiobutton5_nonlineareqt.checked
                        }
                    }
                }
                Column {
                    id:column282
                    width: parent.width-column_buttongroup1_nonlineareqt.width-25
                    anchors.margins: 10
                    spacing: 10
                    TextField {
                        id:textNbreMaxItera_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("Max number of iterations")
                        text: settings.nbreMaxItera_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textNbreMaxItera_nonlineareqt.text==="nan" || textNbreMaxItera_nonlineareqt.text==="NaN") textNbreMaxItera_nonlineareqt.text=x0PF_nonlineareqt ;
                            nbreMaxItera_nonlineareqt=textNbreMaxItera_nonlineareqt.text;
                        }
                    }
                    TextField {
                        id:textNbreNbreDecim_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("Number of decimals")
                        text: settings.nbreDecim_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textNbreNbreDecim_nonlineareqt.text==="nan" || textNbreNbreDecim_nonlineareqt.text==="NaN") textNbreNbreDecim_nonlineareqt.text=nbreDecim_nonlineareqt ;
                            nbreDecim_nonlineareqt=textNbreNbreDecim_nonlineareqt.text;
                        }
                    }
                    TextField {
                        id:textNbreEps_nonlineareqt
                        width: parent.width
                        placeholderText: qsTr("Precision")
                        text: settings.eps_nonlineareqt
                        inputMethodHints: Qt.ImhDigitsOnly
                        onTextChanged: {if (textNbreEps_nonlineareqt.text==="nan" || textNbreEps_nonlineareqt.text==="NaN") textNbreEps_nonlineareqt.text=eps_nonlineareqt ;
                            eps_nonlineareqt=textNbreEps_nonlineareqt.text;
                        }
                    }
                }
            }
            Row{
                width:parent.width
                spacing: 5
                Button {
                    id: buttonCalcul1_nonlineareqt
                    width: parent.width/2
                    text: "Solve f(x)=0"
                    onClicked: {
                        if (radiobutton1ischecked_nonlineareqt){
                            tableModelxiPF_nonlineareqt.clear()
                            CalculHaf.hafresolutioneqtnonlineaire_pointfixe(fx_nonlineareqt,gxPF_nonlineareqt,x0PF_nonlineareqt,eps_nonlineareqt,nbreMaxItera_nonlineareqt,nbreDecim_nonlineareqt)
                        }
                        if (radiobutton2ischecked_nonlineareqt){
                            tableModelxiNR_nonlineareqt.clear()
                            CalculHaf.hafresolutioneqtnonlineaire_newtonraphson(fx_nonlineareqt,fprimNR_nonlineareqt,x0NR_nonlineareqt,eps_nonlineareqt,nbreMaxItera_nonlineareqt,nbreDecim_nonlineareqt)
                        }
                        if (radiobutton3ischecked_nonlineareqt){
                            tableModelxiSEC_nonlineareqt.clear()
                            CalculHaf.hafresolutioneqtnonlineaire_secante(fx_nonlineareqt,x0SEC_nonlineareqt,x1SEC_nonlineareqt,eps_nonlineareqt,nbreMaxItera_nonlineareqt,nbreDecim_nonlineareqt)
                        }
                        if (radiobutton4ischecked_nonlineareqt){
                            tableModelxiBS_nonlineareqt.clear()
                            CalculHaf.hafresolutioneqtnonlineaire_dichotomie(fx_nonlineareqt,aBS_nonlineareqt,bBS_nonlineareqt,eps_nonlineareqt,nbreMaxItera_nonlineareqt,nbreDecim_nonlineareqt)
                        }
                        if (radiobutton5ischecked_nonlineareqt){
                            tableModelxiRF_nonlineareqt.clear()
                            CalculHaf.hafresolutioneqtnonlineaire_fausseposition(fx_nonlineareqt,aRF_nonlineareqt,bRF_nonlineareqt,eps_nonlineareqt,nbreMaxItera_nonlineareqt,nbreDecim_nonlineareqt)
                        }
                    }
                }
                StackLayout {
                    id: view2
                    width: parent.width/2
                    height: buttonCalcul1_nonlineareqt.height
                    currentIndex: methodeindex_nonlineareqt
                    Image {
                        id: image1nonlineareqt
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/PointFixe.bmp"
                    }
                    Image {
                        id: image2nonlineareqt
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Newton-Raphson.bmp"
                    }
                    Image {
                        id: image3nonlineareqt
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/secante.bmp"
                    }
                    Image {
                        id: image4nonlineareqt
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Dicotomie.bmp"
                    }
                    Image {
                        id: image5nonlineareqt
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Fausse-Position.bmp"
                    }
                }
            }
            StackLayout {
                id: view3
                width: parent.width
                currentIndex: tabbar1_nonlineareqt.currentIndex
                Rectangle {
                    id:rectabviewPF_nonlineareqt
                    width: parent.width
                    height: 175
                    HorizontalHeaderView {
                        id: horizontalHeaderPF_nonlineareqt
                        anchors.left: tabviewPF_nonlineareqt.left
                        anchors.top: parent.top
                        syncView: tabviewPF_nonlineareqt
                        clip: true
                        model: ["i" , "x(i)", "g(x(i))", "f(x(i))"]
                    }
                    VerticalHeaderView {
                        id: verticalHeaderPF_nonlineareqt
                        anchors.top: tabviewPF_nonlineareqt.top
                        anchors.left: parent.left
                        syncView: tabviewPF_nonlineareqt
                        clip: true
                        visible: false
                    }
                    TableView {
                        id:tabviewPF_nonlineareqt
                        anchors.left: verticalHeaderPF_nonlineareqt.right
                        anchors.top: horizontalHeaderPF_nonlineareqt.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: 175
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBarPF_nonlineareqt;
                            active:true
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModelxiPF_nonlineareqt
                            TableModelColumn { display: "i" }
                            TableModelColumn { display: "xi" }
                            TableModelColumn { display: "gxi" }
                            TableModelColumn { display: "fxi" }
                        }
                        delegate:  TextInput {
                            id:textItemxiPF_nonlineareqt
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            inputMethodHints: Qt.ImhDigitsOnly
                            text: model.display
                            padding: 9
                            readOnly : true
                            selectByMouse: true
                            renderType: Text.NativeRendering
                            onTextEdited: {
                                model.display = text
                            }
                            onAccepted:  {
                                ///  tableModelxi_tp6.calculxi_tp6();
                            }
                            Rectangle {
                                id: overlay
                                anchors.fill: parent
                                height: textItemxiPF_nonlineareqt.implicitHeight
                                width: textItemxiPF_nonlineareqt.implicitWidth
                                ///width: parent.width/2
                                color:"transparent"
                                z: -1
                                border.color: "steelblue"

                            }
                        }
                    }
                }

                Rectangle {
                    id:rectabviewNR_nonlineareqt
                    width: parent.width
                    height: 175
                    HorizontalHeaderView {
                        id: horizontalHeaderNR_nonlineareqt
                        anchors.left: tabviewNR_nonlineareqt.left
                        anchors.top: parent.top
                        syncView: tabviewNR_nonlineareqt
                        clip: true
                        model: ["i" , "x(i)", "f'(x(i))", "f(x(i))"]
                    }
                    VerticalHeaderView {
                        id: verticalHeaderNR_nonlineareqt
                        anchors.top: tabviewNR_nonlineareqt.top
                        anchors.left: parent.left
                        syncView: tabviewNR_nonlineareqt
                        visible: false
                        clip: true
                    }
                    TableView {
                        id:tabviewNR_nonlineareqt
                        anchors.left: verticalHeaderNR_nonlineareqt.right
                        anchors.top: horizontalHeaderNR_nonlineareqt.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: 175
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBarNR_nonlineareqt;
                            active:true
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModelxiNR_nonlineareqt
                            TableModelColumn { display: "i" }
                            TableModelColumn { display: "xi" }
                            TableModelColumn { display: "fprimxi" }
                            TableModelColumn { display: "fxi" }
                        }
                        delegate:  TextInput {
                            id:textItemxiNR_nonlineareqt
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            inputMethodHints: Qt.ImhDigitsOnly
                            text: model.display
                            padding: 9
                            readOnly : true
                            selectByMouse: true
                            renderType: Text.NativeRendering
                            onTextEdited: {
                                model.display = text
                            }
                            onAccepted:  {
                                ///  tableModelxi_tp6.calculxi_tp6();
                            }
                            Rectangle {
                                id: overlay2
                                anchors.fill: parent
                                height: textItemxiNR_nonlineareqt.implicitHeight
                                width: textItemxiNR_nonlineareqt.implicitWidth
                                ///width: parent.width/2
                                color:"transparent"
                                z: -1
                                border.color: "steelblue"

                            }
                        }
                    }
                }

                Rectangle {
                    id:rectabviewSEC_nonlineareqt
                    width: parent.width
                    height: 175
                    HorizontalHeaderView {
                        id: horizontalHeaderSEC_nonlineareqt
                        anchors.left: tabviewSEC_nonlineareqt.left
                        anchors.top: parent.top
                        syncView: tabviewSEC_nonlineareqt
                        clip: true
                        model: ["i" , "x(i)", "f(x(i))"]
                    }
                    VerticalHeaderView {
                        id: verticalHeaderSEC_nonlineareqt
                        anchors.top: tabviewSEC_nonlineareqt.top
                        anchors.left: parent.left
                        syncView: tabviewSEC_nonlineareqt
                        visible: false
                        clip: true
                    }
                    TableView {
                        id:tabviewSEC_nonlineareqt
                        anchors.left: verticalHeaderSEC_nonlineareqt.right
                        anchors.top: horizontalHeaderSEC_nonlineareqt.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: 175
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBarSEC_nonlineareqt;
                            active:true
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModelxiSEC_nonlineareqt
                            TableModelColumn { display: "i" }
                            TableModelColumn { display: "xi" }
                            TableModelColumn { display: "fxi" }
                        }
                        delegate:  TextInput {
                            id:textItemxiSEC_nonlineareqt
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            inputMethodHints: Qt.ImhDigitsOnly
                            text: model.display
                            padding: 9
                            readOnly : true
                            selectByMouse: true
                            renderType: Text.NativeRendering
                            onTextEdited: {
                                model.display = text
                            }
                            onAccepted:  {
                                ///  tableModelxi_tp6.calculxi_tp6();
                            }
                            Rectangle {
                                id: overlay2SEC
                                anchors.fill: parent
                                height: textItemxiSEC_nonlineareqt.implicitHeight
                                width: textItemxiSEC_nonlineareqt.implicitWidth
                                ///width: parent.width/2
                                color:"transparent"
                                z: -1
                                border.color: "steelblue"

                            }
                        }
                    }
                }

                Rectangle {
                    id:rectabviewBS_nonlineareqt
                    width: parent.width
                    height: 175
                    HorizontalHeaderView {
                        id: horizontalHeaderBS_nonlineareqt
                        anchors.left: tabviewBS_nonlineareqt.left
                        anchors.top: parent.top
                        syncView: tabviewBS_nonlineareqt
                        clip: true
                        model: ["i","a","b","xm=(a+b)/2","f(xm)*f(a)"]
                    }
                    VerticalHeaderView {
                        id: verticalHeaderBS_nonlineareqt
                        anchors.top: tabviewBS_nonlineareqt.top
                        anchors.left: parent.left
                        syncView: tabviewBS_nonlineareqt
                        visible: false
                        clip: true
                    }
                    TableView {
                        id:tabviewBS_nonlineareqt
                        anchors.left: verticalHeaderBS_nonlineareqt.right
                        anchors.top: horizontalHeaderBS_nonlineareqt.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: 175
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBarBS_nonlineareqt;
                            active:true
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModelxiBS_nonlineareqt
                            TableModelColumn { display: "i" }
                            TableModelColumn { display: "a" }
                            TableModelColumn { display: "b" }
                            TableModelColumn { display: "xm" }
                            TableModelColumn { display: "fxmxfxa" }
                        }
                        delegate:  TextInput {
                            id:textItemxiBS_nonlineareqt
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            inputMethodHints: Qt.ImhDigitsOnly
                            text: model.display
                            padding: 9
                            readOnly : true
                            selectByMouse: true
                            renderType: Text.NativeRendering
                            onTextEdited: {
                                model.display = text
                            }
                            onAccepted:  {
                                ///  tableModelxi_tp6.calculxi_tp6();
                            }
                            Rectangle {
                                id: overlay2BS
                                anchors.fill: parent
                                height: textItemxiBS_nonlineareqt.implicitHeight
                                width: textItemxiBS_nonlineareqt.implicitWidth
                                ///width: parent.width/2
                                color:"transparent"
                                z: -1
                                border.color: "steelblue"

                            }
                        }
                    }
                }

                Rectangle {
                    id:rectabviewRF_nonlineareqt
                    width: parent.width
                    height: 175
                    HorizontalHeaderView {
                        id: horizontalHeaderRF_nonlineareqt
                        anchors.left: tabviewRF_nonlineareqt.left
                        anchors.top: parent.top
                        syncView: tabviewRF_nonlineareqt
                        clip: true
                        model: ["i","a","b","r","f(a)*f(r)","f(b)*f(r)"]
                    }
                    VerticalHeaderView {
                        id: verticalHeaderRF_nonlineareqt
                        anchors.top: tabviewRF_nonlineareqt.top
                        anchors.left: parent.left
                        syncView: tabviewRF_nonlineareqt
                        visible: false
                        clip: true
                    }
                    TableView {
                        id:tabviewRF_nonlineareqt
                        anchors.left: verticalHeaderRF_nonlineareqt.right
                        anchors.top: horizontalHeaderRF_nonlineareqt.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: 175
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBarRF_nonlineareqt;
                            active:true
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModelxiRF_nonlineareqt
                            TableModelColumn { display: "i" }
                            TableModelColumn { display: "a" }
                            TableModelColumn { display: "b" }
                            TableModelColumn { display: "r" }
                            TableModelColumn { display: "fxaxfxr" }
                            TableModelColumn { display: "fxbxfxr" }
                        }
                        delegate:  TextInput {
                            id:textItemxiRF_nonlineareqt
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            inputMethodHints: Qt.ImhDigitsOnly
                            text: model.display
                            padding: 9
                            readOnly : true
                            selectByMouse: true
                            renderType: Text.NativeRendering
                            onTextEdited: {
                                model.display = text
                            }
                            onAccepted:  {
                                ///  tableModelxi_tp6.calculxi_tp6();
                            }
                            Rectangle {
                                id: overlay2RF
                                anchors.fill: parent
                                height: textItemxiRF_nonlineareqt.implicitHeight
                                width: textItemxiRF_nonlineareqt.implicitWidth
                                ///width: parent.width/2
                                color:"transparent"
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
        radiobutton1_nonlineareqt.checked=true
        // tableModel1_tp1.appendRow({Temperature:settings.temperatableModel1_tp1,Viscodynamique:settings.viscodynamesurtableModel1_tp1})
        // tableModel1_tp1.appendRow({Temperature:settings.temperatableModel2_tp1,Viscodynamique:settings.viscodynamesurtableModel2_tp1})
        // tableModel1_tp1.appendRow({Temperature:settings.temperatableModel3_tp1,Viscodynamique:settings.viscodynamesurtableModel3_tp1})

        // tableModel1_tp1.updatechart();
    }
}
