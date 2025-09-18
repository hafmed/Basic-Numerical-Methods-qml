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

    property string colorfx_linearsyst: Material.background

    function configNbreeqt(value) {
        spinBoxNbreeqtcurrentValue_linearsyst=value-2
        if (value===2) {
            nbreEqts_linearsyst=2
            nbrePtsTab_linearsyst=2
        }
        if (value===3) {
            nbreEqts_linearsyst=3
            nbrePtsTab_linearsyst=3
        }
        if (value===4) {
            nbreEqts_linearsyst=4
            nbrePtsTab_linearsyst=4
        }
        if (value===5) {
            nbreEqts_linearsyst=5
            nbrePtsTab_linearsyst=5
        }
        ///console.log("nbreEqts_linearsyst="+nbreEqts_linearsyst)
         ///savesettings()

    }
    function fmethodeindex_linearsyst()
    {
        if (radiobutton1ischecked_linearsyst) methodeindex_linearsyst= 0
        if (radiobutton2ischecked_linearsyst) methodeindex_linearsyst= 1
        if (radiobutton3ischecked_linearsyst) methodeindex_linearsyst= 2
    }

    Connections {
        target: CalculHaf
        function onRequestDialog_linearsyst(title,error){
            dialogMessageErrorFparser.title=title
            textfirstuseofappdialog_tp.text=error
            dialogMessageErrorFparser.open()
        }
        ///---------------
        function onRequesttextAffichageResultats_linearsyst(text){
            textAffichageResultats_linearsyst.text=text
        }
        function onRequestMatriTriaSupn2_linearsyst(ai1,ai2,bi){
            tableModel1MatriTriaSupn2_linearsyst.appendRow({ai1:ai1,ai2:ai2,bi:bi})
        }
        function onRequestMatriTriaSupn3_linearsyst(ai1,ai2,ai3,bi){
            tableModel1MatriTriaSupn3_linearsyst.appendRow({ai1:ai1,ai2:ai2,ai3:ai3,bi:bi})
        }
        function onRequestMatriTriaSupn4_linearsyst(ai1,ai2,ai3,ai4,bi){
            tableModel1MatriTriaSupn4_linearsyst.appendRow({ai1:ai1,ai2:ai2,ai3:ai3,ai4:ai4,bi:bi})
        }
        function onRequestMatriTriaSupn5_linearsyst(ai1,ai2,ai3,ai4,ai5,bi){
            tableModel1MatriTriaSupn5_linearsyst.appendRow({ai1:ai1,ai2:ai2,ai3:ai3,ai4:ai4,ai5:ai5,bi:bi})
        }
        ///-------------
        function onRequesttextAffichageResultatsGSJaco_linearsyst(text){
            textAffichageResultats_linearsyst.text=text
        }
        function onRequestMatriTriaSupn2GSJaco_linearsyst(x1,x2,MaxErreur){
            tableModelxiResultsGSJacon2_linearsyst.appendRow({x1:x1,x2:x2,MaxErreur:MaxErreur})
        }
        function onRequestMatriTriaSupn3GSJaco_linearsyst(x1,x2,x3,MaxErreur){
            tableModelxiResultsGSJacon3_linearsyst.appendRow({x1:x1,x2:x2,x3:x3,MaxErreur:MaxErreur})
        }
        function onRequestMatriTriaSupn4GSJaco_linearsyst(x1,x2,x3,x4,MaxErreur){
            tableModelxiResultsGSJacon4_linearsyst.appendRow({x1:x1,x2:x2,x3:x3,x4:x4,MaxErreur:MaxErreur})
        }
        function onRequestMatriTriaSupn5GSJaco_linearsyst(x1,x2,x3,x4,x5,MaxErreur){
            tableModelxiResultsGSJacon5_linearsyst.appendRow({x1:x1,x2:x2,x3:x3,x4:x4,x5:x5,MaxErreur:MaxErreur})
        }
        function onRequestSelectEndtable_linearsyst(){
            tableVerticalBarResultsGSJacon2_linearsyst.setPosition(1 - tableVerticalBarResultsGSJacon2_linearsyst.size)
            tableVerticalBarResultsGSJacon3_linearsyst.setPosition(1 - tableVerticalBarResultsGSJacon3_linearsyst.size)
            tableVerticalBarResultsGSJacon4_linearsyst.setPosition(1 - tableVerticalBarResultsGSJacon4_linearsyst.size)
            tableVerticalBarResultsGSJacon5_linearsyst.setPosition(1 - tableVerticalBarResultsGSJacon5_linearsyst.size)
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
            tableVerticalBarResultsGSJacon2_linearsyst.setPosition(1 - tableVerticalBarResultsGSJacon2_linearsyst.size)
            tableVerticalBarResultsGSJacon3_linearsyst.setPosition(1 - tableVerticalBarResultsGSJacon3_linearsyst.size)
            tableVerticalBarResultsGSJacon4_linearsyst.setPosition(1 - tableVerticalBarResultsGSJacon4_linearsyst.size)
            tableVerticalBarResultsGSJacon5_linearsyst.setPosition(1 - tableVerticalBarResultsGSJacon5_linearsyst.size)
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
            Row{
                width:parent.width
                spacing: 3
                Label {
                    id:label_nbreeqt_linearsyst
                    wrapMode: Text.Wrap
                    height: spinBoxNbreeqt_linearsyst.height
                    verticalAlignment: "AlignVCenter"
                    width: parent.width/4
                    text:"Number of equations in the system"
                }
                SpinBox {
                    id: spinBoxNbreeqt_linearsyst
                    width: parent.width-label_nbreeqt_linearsyst.width-5
                    from: 2
                    value: settings.nbreEqts_linearsyst
                    to: 5
                    editable: true
                    onValueChanged:{
                        configNbreeqt(value)
                        }
                    property string sufix: qsTr(" equations")

                    validator: RegularExpressionValidator { regularExpression: /\D*(-?\d*\.?\d*)\D*/ }

                    textFromValue: function(value, locale) {
                        return Number(value).toLocaleString(locale, 'f', 0)+sufix
                    }

                    valueFromText: function(text, locale) {
                        let re = /\D*(-?\d*\.?\d*)\D*/
                        return Number.fromLocaleString(locale, re.exec(text)[1])
                    }
                }
            }
            Row{
                width:parent.width-5
                spacing: 3
                TextField {
                    id:textToler_linearsyst
                    width: parent.width/2
                    visible: methodeindex_linearsyst!==0
                    placeholderText: qsTr("Precision")
                    text: settings.tole_linearsyst
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textToler_linearsyst.text==="nan" || textToler_linearsyst.text==="NaN") textToler_linearsyst.text=tole_linearsyst ;
                        tole_linearsyst=textToler_linearsyst.text;
                    }
                }
                TextField {
                    id:textMaxIter_linearsyst
                    width: parent.width/2
                    visible: methodeindex_linearsyst!==0
                    placeholderText: qsTr("Max number of iterations")
                    text: settings.maxiter_linearsyst
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textMaxIter_linearsyst.text==="nan" || textMaxIter_linearsyst.text==="NaN") textMaxIter_linearsyst.text=maxiter_linearsyst ;
                        maxiter_linearsyst=textMaxIter_linearsyst.text;
                    }
                }
            }
            Row{
                width:parent.width
                spacing: 3
                Column {
                    id:column_buttongroup2_linearsyst
                    width: rowgroupbutton2_linearsyst.implicitWidth
                    anchors.margins: 10
                    spacing: 1
                    ButtonGroup {
                        id:buttongroup2_linearsyst
                        buttons: rowgroupbutton2_linearsyst.children
                        exclusive : true
                        onClicked: fmethodeindex_linearsyst()
                    }
                    Column {
                        id:rowgroupbutton2_linearsyst
                        width:  parent.width
                        spacing: -10
                        RadioButton {
                            id:radiobuttonMetho1_linearsyst
                            checked: true
                            text: qsTr("Pivot de Gauss")
                            ButtonGroup.group: buttongroup2_linearsyst
                            onCheckedChanged: radiobutton1ischecked_linearsyst=radiobuttonMetho1_linearsyst.checked
                        }
                        RadioButton {
                            id:radiobuttonMetho2_linearsyst
                            text: qsTr("Gauss-Siedel")
                            ButtonGroup.group: buttongroup2_linearsyst
                            onCheckedChanged: radiobutton2ischecked_linearsyst=radiobuttonMetho2_linearsyst.checked
                        }
                        RadioButton {
                            id:radiobuttonMetho3_linearsyst
                            text: qsTr("Jacobi")
                            ButtonGroup.group: buttongroup2_linearsyst
                            onCheckedChanged: radiobutton3ischecked_linearsyst=radiobuttonMetho3_linearsyst.checked
                        }
                    }
                }
                StackLayout {
                    id: view2
                    width: parent.width-column_buttongroup2_linearsyst.width-10
                    height: rowgroupbutton2_linearsyst.height
                    currentIndex: methodeindex_linearsyst
                    Image {
                        id: image1linearsyst
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/PivotsGauss.bmp"
                    }
                    Image {
                        id: image2linearsyst
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Gauss_Seidel.png"
                    }
                    Image {
                        id: image3linearsyst
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Jacobi.png"
                    }
                }
            }
            Row{
                width:parent.width
                spacing: 3
                visible: methodeindex_linearsyst!==0
                TextField {
                    id:textXO1_linearsyst
                    width: parent.width/nbreEqts_linearsyst-3
                    visible: (nbreEqts_linearsyst==2 || nbreEqts_linearsyst==3 || nbreEqts_linearsyst==4 || nbreEqts_linearsyst==5)
                    placeholderText: qsTr("X1(0)")
                    text: settings.x01_linearsyst
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textXO1_linearsyst.text==="nan" || textXO1_linearsyst.text==="NaN") textXO1_linearsyst.text=x01_linearsyst ;
                        x01_linearsyst=textXO1_linearsyst.text;
                    }
                }
                TextField {
                    id:textXO2_linearsyst
                    width: parent.width/nbreEqts_linearsyst-3
                    visible: (nbreEqts_linearsyst==2 || nbreEqts_linearsyst==3 || nbreEqts_linearsyst==4 || nbreEqts_linearsyst==5)
                    placeholderText: qsTr("X2(0)")
                    text: settings.x02_linearsyst
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textXO2_linearsyst.text==="nan" || textXO2_linearsyst.text==="NaN") textXO2_linearsyst.text=x02_linearsyst ;
                        x02_linearsyst=textXO2_linearsyst.text;
                    }
                }
                TextField {
                    id:textXO3_linearsyst
                    width: parent.width/nbreEqts_linearsyst-3
                    visible: (nbreEqts_linearsyst==3 || nbreEqts_linearsyst==4 || nbreEqts_linearsyst==5)
                    placeholderText: qsTr("X3(0)")
                    text: settings.x03_linearsyst
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textXO3_linearsyst.text==="nan" || textXO3_linearsyst.text==="NaN") textXO3_linearsyst.text=x03_linearsyst ;
                        x03_linearsyst=textXO3_linearsyst.text;
                    }
                }
                TextField {
                    id:textXO4_linearsyst
                    width: parent.width/nbreEqts_linearsyst-3
                    visible: (nbreEqts_linearsyst==4 || nbreEqts_linearsyst==5)
                    placeholderText: qsTr("X4(0)")
                    text: settings.x04_linearsyst
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textXO4_linearsyst.text==="nan" || textXO4_linearsyst.text==="NaN") textXO4_linearsyst.text=x04_linearsyst ;
                        x04_linearsyst=textXO4_linearsyst.text;
                    }
                }
                TextField {
                    id:textXO5_linearsyst
                    width: parent.width/nbreEqts_linearsyst-3
                    visible: (nbreEqts_linearsyst==5)
                    placeholderText: qsTr("X5(0)")
                    text: settings.x05_linearsyst
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textXO5_linearsyst.text==="nan" || textXO5_linearsyst.text==="NaN") textXO5_linearsyst.text=x05_linearsyst ;
                        x05_linearsyst=textXO5_linearsyst.text;
                    }
                }
            }

            Row {
                width: parent.width
                spacing: 0
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Calcul_tp6.width)/2
                    orientation: Qt.Horizontal
                }
                Label {
                    id:label1_Calcul_liearsys
                    width: label1_Calcul_tp6.text.width
                    text: "A.X=b"
                    anchors.fill: parent.center
                }
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Calcul_tp6.width)/2
                    orientation: Qt.Horizontal
                }
            }

            StackLayout {
                id: stackLayoutrectabdata_linearsyst
                width: parent.width-15
                currentIndex: spinBoxNbreeqtcurrentValue_linearsyst

                Rectangle {
                    id:rectabdatan2_linearsyst
                    width: parent.width
                    height: 250
                    color: "transparent"
                    HorizontalHeaderView {
                        id: horizontalHeaderdatan2_linearsyst
                        anchors.left: tabviewxiyiIjdatan2_linearsyst.left
                        anchors.top: parent.top
                        syncView: tabviewxiyiIjdatan2_linearsyst
                        clip: true
                        model: ["a(i,1)","a(i,2)","b(i)"]
                    }
                    VerticalHeaderView {
                        id: verticalHeaderdatan2_linearsyst
                        anchors.top: tabviewxiyiIjdatan2_linearsyst.top
                        anchors.left: parent.left
                        syncView: tabviewxiyiIjdatan2_linearsyst
                        clip: true
                        model: ["a(1,j)","a(2,j)"]
                    }
                    TableView {
                        id:tabviewxiyiIjdatan2_linearsyst
                        anchors.left: verticalHeaderdatan2_linearsyst.right
                        anchors.top: horizontalHeaderdatan2_linearsyst.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBardatan2_linearsyst;
                            active:tabviewxiyiIjdatan2_linearsyst.implicitHeight>stackLayoutrectabdata_linearsyst.implicitHeight?
                            policy:ScrollBar.AlwaysOn
                        }
                        ScrollBar.horizontal: ScrollBar {
                            id: tablehorizontalBardatan2_linearsyst;
                            active:tabviewxiyiIjdatan2_linearsyst.implicitWidth>stackLayoutrectabdata_linearsyst.implicitWidth?
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModel1datan2_linearsyst
                            TableModelColumn { display: "ai1" }
                            TableModelColumn { display: "ai2" }
                            TableModelColumn { display: "bi" }
                        }

                        function savexiyiIjtableModel1datan2_linearsyst(){
                            ///tabArrayxiyi_linearsyst = [];
                            nbreEqts_linearsyst=2
                            ///console.log("nbreEqts_linearsyst="+nbreEqts_linearsyst)
                            var tabArrayxiyi_linearsystok = new Array(nbreEqts_linearsyst);
                            for (var i = 0; i < nbreEqts_linearsyst; i++) {
                                tabArrayxiyi_linearsystok[i] = new Array(3);
                            }
                            for (let i = 0; i < tableModel1datan2_linearsyst.rowCount; i++) {
                                tabArrayxiyi_linearsystok[i][0]=tableModel1datan2_linearsyst.rows[i].ai1
                                tabArrayxiyi_linearsystok[i][1]=tableModel1datan2_linearsyst.rows[i].ai2
                                tabArrayxiyi_linearsystok[i][2]=tableModel1datan2_linearsyst.rows[i].bi
                            }
                            tabArrayxiyidatan2_linearsyst=tabArrayxiyi_linearsystok
                        }
                        delegate: DelegateChooser {
                            DelegateChoice {
                                column: 0
                                delegate: TextField {
                                    id:textai1_linearsystn2
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display ///model.display>10**(-nbreDecim_linearsyst) ? parseFloat(model.display).toFixed(nbreDecim_linearsyst):model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan2_linearsyst.savexiyiIjtableModel1datan2_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai1_linearsystn2.implicitHeight
                                        width: textai1_linearsystn2.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 1
                                delegate: TextField {
                                    id:textai2_linearsystn2
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text:model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan2_linearsyst.savexiyiIjtableModel1datan2_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai2_linearsystn2.implicitHeight
                                        width: textai2_linearsystn2.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 2
                                delegate: TextField {
                                    id:textbi_linearsystn2
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan2_linearsyst.savexiyiIjtableModel1datan2_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textbi_linearsystn2.implicitHeight
                                        width: textbi_linearsystn2.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    id:rectabdatan3_linearsyst
                    width: parent.width
                    height: 250
                    color: "transparent"
                    HorizontalHeaderView {
                        id: horizontalHeaderdatan3_linearsyst
                        anchors.left: tabviewxiyiIjdatan3_linearsyst.left
                        anchors.top: parent.top
                        syncView: tabviewxiyiIjdatan3_linearsyst
                        clip: true
                        model: ["a(i,1)","a(i,2)","a(i,3)","b(i)"]
                    }
                    VerticalHeaderView {
                        id: verticalHeaderdatan3_linearsyst
                        anchors.top: tabviewxiyiIjdatan3_linearsyst.top
                        anchors.left: parent.left
                        syncView: tabviewxiyiIjdatan3_linearsyst
                        clip: true
                        model: ["a(1,j)","a(2,j)","a(3,j)"]
                    }
                    TableView {
                        id:tabviewxiyiIjdatan3_linearsyst
                        anchors.left: verticalHeaderdatan3_linearsyst.right
                        anchors.top: horizontalHeaderdatan3_linearsyst.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBardatan3_linearsyst;
                            active:tabviewxiyiIjdatan3_linearsyst.implicitHeight>stackLayoutrectabdata_linearsyst.implicitHeight?
                            policy:ScrollBar.AlwaysOn
                        }
                        ScrollBar.horizontal: ScrollBar {
                            id: tablehorizontalBardatan3_linearsyst;
                            active:tabviewxiyiIjdatan3_linearsyst.implicitWidth>stackLayoutrectabdata_linearsyst.implicitWidth?
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModel1datan3_linearsyst
                            TableModelColumn { display: "ai1" }
                            TableModelColumn { display: "ai2" }
                            TableModelColumn { display: "ai3" }
                            TableModelColumn { display: "bi" }
                        }

                        function savexiyiIjtableModel1datan3_linearsyst(){
                            ///tabArrayxiyi_linearsyst = [];
                            nbreEqts_linearsyst=3
                            ///console.log("nbreEqts_linearsyst="+nbreEqts_linearsyst)
                            var tabArrayxiyi_linearsystok = new Array(nbreEqts_linearsyst);
                            for (var i = 0; i < nbreEqts_linearsyst; i++) {
                                tabArrayxiyi_linearsystok[i] = new Array(4);
                            }
                            for (let i = 0; i < tableModel1datan3_linearsyst.rowCount; i++) {
                                tabArrayxiyi_linearsystok[i][0]=tableModel1datan3_linearsyst.rows[i].ai1
                                tabArrayxiyi_linearsystok[i][1]=tableModel1datan3_linearsyst.rows[i].ai2
                                tabArrayxiyi_linearsystok[i][2]=tableModel1datan3_linearsyst.rows[i].ai3
                                tabArrayxiyi_linearsystok[i][3]=tableModel1datan3_linearsyst.rows[i].bi
                            }
                            tabArrayxiyidatan3_linearsyst=tabArrayxiyi_linearsystok
                        }
                        delegate: DelegateChooser {
                            DelegateChoice {
                                column: 0
                                delegate: TextField {
                                    id:textai1_linearsystn3
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan3_linearsyst.savexiyiIjtableModel1datan3_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai1_linearsystn3.implicitHeight
                                        width: textai1_linearsystn3.implicitWidth
                                        ///width: parent.width/2
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 1
                                delegate: TextField {
                                    id:textai2_linearsystn3
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text:model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan3_linearsyst.savexiyiIjtableModel1datan3_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai2_linearsystn3.implicitHeight
                                        width: textai2_linearsystn3.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 2
                                delegate: TextField {
                                    id:textai3_linearsystn3
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan3_linearsyst.savexiyiIjtableModel1datan3_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai3_linearsystn3.implicitHeight
                                        width: textai3_linearsystn3.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 3
                                delegate: TextField {
                                    id:textbi_linearsystn3
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan3_linearsyst.savexiyiIjtableModel1datan3_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textbi_linearsystn3.implicitHeight
                                        width: textbi_linearsystn3.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    id:rectabdatan4_linearsyst
                    width: parent.width
                    height: 250
                    color: "transparent"
                    HorizontalHeaderView {
                        id: horizontalHeaderdatan4_linearsyst
                        anchors.left: tabviewxiyiIjdatan4_linearsyst.left
                        anchors.top: parent.top
                        syncView: tabviewxiyiIjdatan4_linearsyst
                        clip: true
                        model: ["a(i,1)","a(i,2)","a(i,3)","a(i,4)","b(i)"]
                    }
                    VerticalHeaderView {
                        id: verticalHeaderdatan4_linearsyst
                        anchors.top: tabviewxiyiIjdatan4_linearsyst.top
                        anchors.left: parent.left
                        syncView: tabviewxiyiIjdatan4_linearsyst
                        clip: true
                        model: ["a(1,j)","a(2,j)","a(3,j)","a(4,j)"]
                    }
                    TableView {
                        id:tabviewxiyiIjdatan4_linearsyst
                        anchors.left: verticalHeaderdatan4_linearsyst.right
                        anchors.top: horizontalHeaderdatan4_linearsyst.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBardatan4_linearsyst;
                            active:tabviewxiyiIjdatan4_linearsyst.implicitHeight>stackLayoutrectabdata_linearsyst.implicitHeight?
                            policy:ScrollBar.AlwaysOn
                        }
                        ScrollBar.horizontal: ScrollBar {
                            id: tablehorizontalBardatan4_linearsyst;
                            active:tabviewxiyiIjdatan4_linearsyst.implicitWidth>stackLayoutrectabdata_linearsyst.implicitWidth?
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModel1datan4_linearsyst
                            TableModelColumn { display: "ai1" }
                            TableModelColumn { display: "ai2" }
                            TableModelColumn { display: "ai3" }
                            TableModelColumn { display: "ai4" }
                            TableModelColumn { display: "bi" }
                        }

                        function savexiyiIjtableModel1datan4_linearsyst(){
                            ///tabArrayxiyi_linearsyst = [];
                            nbreEqts_linearsyst=4
                            ///console.log("nbreEqts_linearsyst="+nbreEqts_linearsyst)
                            var tabArrayxiyi_linearsystok = new Array(nbreEqts_linearsyst);
                            for (var i = 0; i < nbreEqts_linearsyst; i++) {
                                tabArrayxiyi_linearsystok[i] = new Array(5);
                            }
                            for (let i = 0; i < tableModel1datan4_linearsyst.rowCount; i++) {
                                tabArrayxiyi_linearsystok[i][0]=tableModel1datan4_linearsyst.rows[i].ai1
                                tabArrayxiyi_linearsystok[i][1]=tableModel1datan4_linearsyst.rows[i].ai2
                                tabArrayxiyi_linearsystok[i][2]=tableModel1datan4_linearsyst.rows[i].ai3
                                tabArrayxiyi_linearsystok[i][3]=tableModel1datan4_linearsyst.rows[i].ai4
                                tabArrayxiyi_linearsystok[i][4]=tableModel1datan4_linearsyst.rows[i].bi
                            }
                            tabArrayxiyidatan4_linearsyst=tabArrayxiyi_linearsystok
                        }
                        delegate: DelegateChooser {
                            DelegateChoice {
                                column: 0
                                delegate: TextField {
                                    id:textai1_linearsystn4
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan4_linearsyst.savexiyiIjtableModel1datan4_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai1_linearsystn4.implicitHeight
                                        width: textai1_linearsystn4.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 1
                                delegate: TextField {
                                    id:textai2_linearsystn4
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text:model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan4_linearsyst.savexiyiIjtableModel1datan4_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai2_linearsystn4.implicitHeight
                                        width: textai2_linearsystn4.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 2
                                delegate: TextField {
                                    id:textai3_linearsystn4
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text:model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan4_linearsyst.savexiyiIjtableModel1datan4_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai3_linearsystn4.implicitHeight
                                        width: textai3_linearsystn4.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 3
                                delegate: TextField {
                                    id:textai4_linearsystn4
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text:model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan4_linearsyst.savexiyiIjtableModel1datan4_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai4_linearsystn4.implicitHeight
                                        width: textai4_linearsystn4.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 4
                                delegate: TextField {
                                    id:textbi_linearsystn4
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan4_linearsyst.savexiyiIjtableModel1datan4_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textbi_linearsystn4.implicitHeight
                                        width: textbi_linearsystn4.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    id:rectabdatan5_linearsyst
                    width: parent.width
                    height: 250
                    color: "transparent"
                    HorizontalHeaderView {
                        id: horizontalHeaderdatan5_linearsyst
                        anchors.left: tabviewxiyiIjdatan5_linearsyst.left
                        anchors.top: parent.top
                        syncView: tabviewxiyiIjdatan5_linearsyst
                        clip: true
                        model: ["a(i,1)","a(i,2)","a(i,3)","a(i,4)","a(i,5)","b(i)"]
                    }
                    VerticalHeaderView {
                        id: verticalHeaderdatan5_linearsyst
                        anchors.top: tabviewxiyiIjdatan5_linearsyst.top
                        anchors.left: parent.left
                        syncView: tabviewxiyiIjdatan5_linearsyst
                        clip: true
                        model: ["a(1,j)","a(2,j)","a(3,j)","a(4,j)","a(5,j)"]
                    }
                    TableView {
                        id:tabviewxiyiIjdatan5_linearsyst
                        anchors.left: verticalHeaderdatan5_linearsyst.right
                        anchors.top: horizontalHeaderdatan5_linearsyst.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBardatan5_linearsyst;
                            active:tabviewxiyiIjdatan5_linearsyst.implicitHeight>stackLayoutrectabdata_linearsyst.implicitHeight?
                            policy:ScrollBar.AlwaysOn
                        }
                        ScrollBar.horizontal: ScrollBar {
                            id: tablehorizontalBardatan5_linearsyst;
                            active:tabviewxiyiIjdatan5_linearsyst.implicitWidth>stackLayoutrectabdata_linearsyst.implicitWidth?
                            policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModel1datan5_linearsyst
                            TableModelColumn { display: "ai1" }
                            TableModelColumn { display: "ai2" }
                            TableModelColumn { display: "ai3" }
                            TableModelColumn { display: "ai4" }
                            TableModelColumn { display: "ai5" }
                            TableModelColumn { display: "bi" }
                        }

                        function savexiyiIjtableModel1datan5_linearsyst(){
                            ///tabArrayxiyi_linearsyst = [];
                            nbreEqts_linearsyst=5
                            ///console.log("nbreEqts_linearsyst="+nbreEqts_linearsyst)
                            var tabArrayxiyi_linearsystok = new Array(nbreEqts_linearsyst);
                            for (var i = 0; i < nbreEqts_linearsyst; i++) {
                                tabArrayxiyi_linearsystok[i] = new Array(6);
                            }
                            for (let i = 0; i < tableModel1datan5_linearsyst.rowCount; i++) {
                                tabArrayxiyi_linearsystok[i][0]=tableModel1datan5_linearsyst.rows[i].ai1
                                tabArrayxiyi_linearsystok[i][1]=tableModel1datan5_linearsyst.rows[i].ai2
                                tabArrayxiyi_linearsystok[i][2]=tableModel1datan5_linearsyst.rows[i].ai3
                                tabArrayxiyi_linearsystok[i][3]=tableModel1datan5_linearsyst.rows[i].ai4
                                tabArrayxiyi_linearsystok[i][4]=tableModel1datan5_linearsyst.rows[i].ai5
                                tabArrayxiyi_linearsystok[i][5]=tableModel1datan5_linearsyst.rows[i].bi

                            }
                            tabArrayxiyidatan5_linearsyst=tabArrayxiyi_linearsystok
                        }
                        delegate: DelegateChooser {
                            DelegateChoice {
                                column: 0
                                delegate: TextField {
                                    id:textai1_linearsystn5
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan5_linearsyst.savexiyiIjtableModel1datan5_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai1_linearsystn5.implicitHeight
                                        width: textai1_linearsystn5.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 1
                                delegate: TextField {
                                    id:textai2_linearsystn5
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text:model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan5_linearsyst.savexiyiIjtableModel1datan5_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai2_linearsystn5.implicitHeight
                                        width: textai2_linearsystn5.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 2
                                delegate: TextField {
                                    id:textai3_linearsystn5
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan5_linearsyst.savexiyiIjtableModel1datan5_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai3_linearsystn5.implicitHeight
                                        width: textai3_linearsystn5.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 3
                                delegate: TextField {
                                    id:textai4_linearsystn5
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan5_linearsyst.savexiyiIjtableModel1datan5_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai4_linearsystn5.implicitHeight
                                        width: textai4_linearsystn5.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 4
                                delegate: TextField {
                                    id:textai5_linearsystn5
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan5_linearsyst.savexiyiIjtableModel1datan5_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textai5_linearsystn5.implicitHeight
                                        width: textai5_linearsystn5.implicitWidth
                                        color: Material.background
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 5
                                delegate: TextField {
                                    id:textbi_linearsystn5
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    color: Material.foreground
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIjdatan5_linearsyst.savexiyiIjtableModel1datan5_linearsyst()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textbi_linearsystn5.implicitHeight
                                        width: textbi_linearsystn5.implicitWidth
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

            Button {
                width: parent.width
                text: "Resolve"
                onClicked: {
                    if (methodeindex_linearsyst==0) {
                        nbreEqts_linearsyst=spinBoxNbreeqt_linearsyst.value///comboxNbreeqt_linearsyst.currentIndex+2
                        ///console.log(nbreEqts_linearsyst)
                        ///console.log(tabArrayxiyidatan4_linearsyst)
                        if (nbreEqts_linearsyst==2) {
                            tableModel1MatriTriaSupn2_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Gauss(tabArrayxiyidatan2_linearsyst, nbreEqts_linearsyst)
                        }
                        if (nbreEqts_linearsyst==3) {
                            tableModel1MatriTriaSupn3_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Gauss(tabArrayxiyidatan3_linearsyst, nbreEqts_linearsyst)
                        }
                        if (nbreEqts_linearsyst==4) {
                            tableModel1MatriTriaSupn4_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Gauss(tabArrayxiyidatan4_linearsyst, nbreEqts_linearsyst)
                        }
                        if (nbreEqts_linearsyst==5) {
                            tableModel1MatriTriaSupn5_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Gauss(tabArrayxiyidatan5_linearsyst, nbreEqts_linearsyst)
                        }
                    }
                    var tabArrayxo_linearsyst= new Array(nbreEqts_linearsyst);
                    for (var i = 0; i < nbrePtsTab_inteqt; i++) {
                        tabArrayxo_linearsyst[i] = new Array(3);
                    }
                    if (methodeindex_linearsyst==1) {
                        nbreEqts_linearsyst=spinBoxNbreeqt_linearsyst.value///comboxNbreeqt_linearsyst.currentIndex+2
                        tabArrayxo_linearsyst[0][0]=x01_linearsyst
                        tabArrayxo_linearsyst[0][1]=x02_linearsyst
                        tabArrayxo_linearsyst[0][2]=x03_linearsyst
                        tabArrayxo_linearsyst[0][3]=x04_linearsyst
                        tabArrayxo_linearsyst[0][4]=x05_linearsyst
                        console.log("tabArrayxo_linearsyst="+tabArrayxo_linearsyst)
                        if (nbreEqts_linearsyst==2) {
                            tableModelxiResultsGSJacon2_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Gauss_Seidel(tabArrayxiyidatan2_linearsyst,tabArrayxo_linearsyst,nbreEqts_linearsyst,maxiter_linearsyst,tole_linearsyst)
                        }
                        if (nbreEqts_linearsyst==3) {
                            tableModelxiResultsGSJacon3_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Gauss_Seidel(tabArrayxiyidatan3_linearsyst,tabArrayxo_linearsyst,nbreEqts_linearsyst,maxiter_linearsyst,tole_linearsyst)
                        }
                        if (nbreEqts_linearsyst==4) {
                            tableModelxiResultsGSJacon4_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Gauss_Seidel(tabArrayxiyidatan4_linearsyst,tabArrayxo_linearsyst,nbreEqts_linearsyst,maxiter_linearsyst,tole_linearsyst)
                        }
                        if (nbreEqts_linearsyst==5) {
                            tableModelxiResultsGSJacon5_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Gauss_Seidel(tabArrayxiyidatan5_linearsyst,tabArrayxo_linearsyst,nbreEqts_linearsyst,maxiter_linearsyst,tole_linearsyst)
                        }
                    }
                    if (methodeindex_linearsyst==2) {
                        nbreEqts_linearsyst=spinBoxNbreeqt_linearsyst.value///comboxNbreeqt_linearsyst.currentIndex+2
                        tabArrayxo_linearsyst[0][0]=x01_linearsyst
                        tabArrayxo_linearsyst[0][1]=x02_linearsyst
                        tabArrayxo_linearsyst[0][2]=x03_linearsyst
                        tabArrayxo_linearsyst[0][3]=x04_linearsyst
                        tabArrayxo_linearsyst[0][4]=x05_linearsyst
                        console.log("tabArrayxo_linearsyst="+tabArrayxo_linearsyst)
                        if (nbreEqts_linearsyst==2) {
                            tableModelxiResultsGSJacon2_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Jacobi(tabArrayxiyidatan2_linearsyst,tabArrayxo_linearsyst,nbreEqts_linearsyst,maxiter_linearsyst,tole_linearsyst)
                        }
                        if (nbreEqts_linearsyst==3) {
                            tableModelxiResultsGSJacon3_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Jacobi(tabArrayxiyidatan3_linearsyst,tabArrayxo_linearsyst,nbreEqts_linearsyst,maxiter_linearsyst,tole_linearsyst)
                        }
                        if (nbreEqts_linearsyst==4) {
                            tableModelxiResultsGSJacon4_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Jacobi(tabArrayxiyidatan4_linearsyst,tabArrayxo_linearsyst,nbreEqts_linearsyst,maxiter_linearsyst,tole_linearsyst)
                        }
                        if (nbreEqts_linearsyst==5) {
                            tableModelxiResultsGSJacon5_linearsyst.clear()
                            CalculHaf.hafresolutionsysteqtlineaire_Jacobi(tabArrayxiyidatan5_linearsyst,tabArrayxo_linearsyst,nbreEqts_linearsyst,maxiter_linearsyst,tole_linearsyst)
                        }
                    }



                }
            }
            Row {
                width: parent.width
                spacing: 0
                ToolSeparator {
                    height: 25
                    width: (parent.width-label2_Calcul_liearsys.width)/2
                    orientation: Qt.Horizontal
                }
                Label {
                    id:label2_Calcul_liearsys
                    text: methodeindex_linearsyst==0? "The equivalent upper triangular matrix":"Results"
                    anchors.fill: parent.center
                }
                ToolSeparator {
                    height: 25
                    width: (parent.width-label2_Calcul_liearsys.width)/2
                    orientation: Qt.Horizontal
                }
            }
            Row {
                width: parent.width
                visible: methodeindex_linearsyst!==0
                spacing: 0
                ToolSeparator {
                    height: 25
                    width: (parent.width-label5_Calcul_liearsys.width)/2
                    orientation: Qt.Horizontal
                }
                Label {
                    id:label5_Calcul_liearsys
                    text: "(MaxErreur=max(abs(x(i,k)-x(i,k-1))) ; k: iteration number)"
                    anchors.fill: parent.center
                }
                ToolSeparator {
                    height: 25
                    width: (parent.width-label5_Calcul_liearsys.width)/2
                    orientation: Qt.Horizontal
                }
            }
            StackLayout {
                id: stackLayoutrectabMatriTriaSupResultsGSJaco_linearsyst
                width: parent.width-15
                currentIndex: methodeindex_linearsyst==0? 0:1

                StackLayout {
                    id: stackLayoutrectabMatriTriaSup_linearsyst
                    width: parent.width
                    currentIndex: spinBoxNbreeqtcurrentValue_linearsyst

                    Rectangle {
                        id:rectabMatriTriaSupn2_linearsyst
                        width: parent.width
                        height: 250
                        color: "transparent"
                        HorizontalHeaderView {
                            id: horizontalHeaderMatriTriaSupn2_linearsyst
                            anchors.left: tabviewxiyiIjMatriTriaSupn2_linearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewxiyiIjMatriTriaSupn2_linearsyst
                            clip: true
                            model: ["a(i,1)","a(i,2)","b(i)"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderMatriTriaSupn2_linearsyst
                            anchors.top: tabviewxiyiIjMatriTriaSupn2_linearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewxiyiIjMatriTriaSupn2_linearsyst
                            clip: true
                            model: ["a(1,j)","a(2,j)"]
                        }
                        TableView {
                            id:tabviewxiyiIjMatriTriaSupn2_linearsyst
                            anchors.left: verticalHeaderMatriTriaSupn2_linearsyst.right
                            anchors.top: horizontalHeaderMatriTriaSupn2_linearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarMatriTriaSupn2_linearsyst;
                                active:tabviewxiyiIjMatriTriaSupn2_linearsyst.implicitHeight>stackLayoutrectabMatriTriaSup_linearsyst.implicitHeight?
                                policy:ScrollBar.AlwaysOn
                            }
                            ScrollBar.horizontal: ScrollBar {
                                id: tablehorizontalBarMatriTriaSupn2_linearsyst;
                                active:tabviewxiyiIjMatriTriaSupn2_linearsyst.implicitWidth>stackLayoutrectabMatriTriaSup_linearsyst.implicitWidth?
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModel1MatriTriaSupn2_linearsyst
                                TableModelColumn { display: "ai1" }
                                TableModelColumn { display: "ai2" }
                                TableModelColumn { display: "bi" }
                            }
                            delegate: DelegateChooser {
                                DelegateChoice {
                                    column: 0
                                    delegate: TextField {
                                        id:textai1MatriTriaSup_linearsystn2
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display ///model.display>10**(-nbreDecim_linearsyst) ? parseFloat(model.display).toFixed(nbreDecim_linearsyst):model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai1MatriTriaSup_linearsystn2.implicitHeight
                                            width: textai1MatriTriaSup_linearsystn2.implicitWidth
                                            ///width: parent.width/2
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 1
                                    delegate: TextField {
                                        id:textai2MatriTriaSup_linearsystn2
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text:model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai2MatriTriaSup_linearsystn2.implicitHeight
                                            width: textai2MatriTriaSup_linearsystn2.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 2
                                    delegate: TextField {
                                        id:textbiMatriTriaSup_linearsystn2
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textbiMatriTriaSup_linearsystn2.implicitHeight
                                            width: textbiMatriTriaSup_linearsystn2.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        id:rectabMatriTriaSupn3_linearsyst
                        width: parent.width
                        height: 250
                        color: "transparent"
                        HorizontalHeaderView {
                            id: horizontalHeaderMatriTriaSupn3_linearsyst
                            anchors.left: tabviewxiyiIjMatriTriaSupn3_linearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewxiyiIjMatriTriaSupn3_linearsyst
                            clip: true
                            model: ["a(i,1)","a(i,2)","a(i,3)","b(i)"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderMatriTriaSupn3_linearsyst
                            anchors.top: tabviewxiyiIjMatriTriaSupn3_linearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewxiyiIjMatriTriaSupn3_linearsyst
                            clip: true
                            model: ["a(1,j)","a(2,j)","a(3,j)"]
                        }
                        TableView {
                            id:tabviewxiyiIjMatriTriaSupn3_linearsyst
                            anchors.left: verticalHeaderMatriTriaSupn3_linearsyst.right
                            anchors.top: horizontalHeaderMatriTriaSupn3_linearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarMatriTriaSupn3_linearsyst;
                                active:tabviewxiyiIjMatriTriaSupn3_linearsyst.implicitHeight>stackLayoutrectabMatriTriaSup_linearsyst.implicitHeight?
                                policy:ScrollBar.AlwaysOn
                            }
                            ScrollBar.horizontal: ScrollBar {
                                id: tablehorizontalBarMatriTriaSupn3_linearsyst;
                                active:tabviewxiyiIjMatriTriaSupn3_linearsyst.implicitWidth>stackLayoutrectabMatriTriaSup_linearsyst.implicitWidth?
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModel1MatriTriaSupn3_linearsyst
                                TableModelColumn { display: "ai1" }
                                TableModelColumn { display: "ai2" }
                                TableModelColumn { display: "ai3" }
                                TableModelColumn { display: "bi" }
                            }
                            delegate: DelegateChooser {
                                DelegateChoice {
                                    column: 0
                                    delegate: TextField {
                                        id:textai1MatriTriaSup_linearsystn3
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai1MatriTriaSup_linearsystn3.implicitHeight
                                            width: textai1MatriTriaSup_linearsystn3.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 1
                                    delegate: TextField {
                                        id:textai2MatriTriaSup_linearsystn3
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text:model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai2MatriTriaSup_linearsystn3.implicitHeight
                                            width: textai2MatriTriaSup_linearsystn3.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 2
                                    delegate: TextField {
                                        id:textai3MatriTriaSup_linearsystn3
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai3MatriTriaSup_linearsystn3.implicitHeight
                                            width: textai3MatriTriaSup_linearsystn3.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 3
                                    delegate: TextField {
                                        id:textbiMatriTriaSup_linearsystn3
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textbiMatriTriaSup_linearsystn3.implicitHeight
                                            width: textbiMatriTriaSup_linearsystn3.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        id:rectabMatriTriaSupn4_linearsyst
                        width: parent.width
                        height: 250
                        color: "transparent"
                        HorizontalHeaderView {
                            id: horizontalHeaderMatriTriaSupn4_linearsyst
                            anchors.left: tabviewxiyiIjMatriTriaSupn4_linearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewxiyiIjMatriTriaSupn4_linearsyst
                            clip: true
                            model: ["a(i,1)","a(i,2)","a(i,3)","a(i,4)","b(i)"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderMatriTriaSupn4_linearsyst
                            anchors.top: tabviewxiyiIjMatriTriaSupn4_linearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewxiyiIjMatriTriaSupn4_linearsyst
                            clip: true
                            model: ["a(1,j)","a(2,j)","a(3,j)","a(4,j)"]
                        }
                        TableView {
                            id:tabviewxiyiIjMatriTriaSupn4_linearsyst
                            anchors.left: verticalHeaderMatriTriaSupn4_linearsyst.right
                            anchors.top: horizontalHeaderMatriTriaSupn4_linearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarMatriTriaSupn4_linearsyst;
                                active:tabviewxiyiIjMatriTriaSupn4_linearsyst.implicitHeight>stackLayoutrectabMatriTriaSup_linearsyst.implicitHeight?
                                policy:ScrollBar.AlwaysOn
                            }
                            ScrollBar.horizontal: ScrollBar {
                                id: tablehorizontalBarMatriTriaSupn4_linearsyst;
                                active:tabviewxiyiIjMatriTriaSupn4_linearsyst.implicitWidth>stackLayoutrectabMatriTriaSup_linearsyst.implicitWidth?
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModel1MatriTriaSupn4_linearsyst
                                TableModelColumn { display: "ai1" }
                                TableModelColumn { display: "ai2" }
                                TableModelColumn { display: "ai3" }
                                TableModelColumn { display: "ai4" }
                                TableModelColumn { display: "bi" }
                            }
                            delegate: DelegateChooser {
                                DelegateChoice {
                                    column: 0
                                    delegate: TextField {
                                        id:textai1MatriTriaSup_linearsystn4
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai1MatriTriaSup_linearsystn4.implicitHeight
                                            width: textai1MatriTriaSup_linearsystn4.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 1
                                    delegate: TextField {
                                        id:textai2MatriTriaSup_linearsystn4
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text:model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai2MatriTriaSup_linearsystn4.implicitHeight
                                            width: textai2MatriTriaSup_linearsystn4.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 2
                                    delegate: TextField {
                                        id:textai3MatriTriaSup_linearsystn4
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text:model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai3MatriTriaSup_linearsystn4.implicitHeight
                                            width: textai3MatriTriaSup_linearsystn4.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 3
                                    delegate: TextField {
                                        id:textai4MatriTriaSup_linearsystn4
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text:model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai4MatriTriaSup_linearsystn4.implicitHeight
                                            width: textai4MatriTriaSup_linearsystn4.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 4
                                    delegate: TextField {
                                        id:textbiMatriTriaSup_linearsystn4
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textbiMatriTriaSup_linearsystn4.implicitHeight
                                            width: textbiMatriTriaSup_linearsystn4.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        id:rectabMatriTriaSupn5_linearsyst
                        width: parent.width
                        height: 250
                        color: "transparent"
                        HorizontalHeaderView {
                            id: horizontalHeaderMatriTriaSupn5_linearsyst
                            anchors.left: tabviewxiyiIjMatriTriaSupn5_linearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewxiyiIjMatriTriaSupn5_linearsyst
                            clip: true
                            model: ["a(i,1)","a(i,2)","a(i,3)","a(i,4)","a(i,5)","b(i)"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderMatriTriaSupn5_linearsyst
                            anchors.top: tabviewxiyiIjMatriTriaSupn5_linearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewxiyiIjMatriTriaSupn5_linearsyst
                            clip: true
                            model: ["a(1,j)","a(2,j)","a(3,j)","a(4,j)","a(5,j)"]
                        }
                        TableView {
                            id:tabviewxiyiIjMatriTriaSupn5_linearsyst
                            anchors.left: verticalHeaderMatriTriaSupn5_linearsyst.right
                            anchors.top: horizontalHeaderMatriTriaSupn5_linearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarMatriTriaSupn5_linearsyst;
                                active:tabviewxiyiIjMatriTriaSupn5_linearsyst.implicitHeight>stackLayoutrectabMatriTriaSup_linearsyst.implicitHeight?
                                policy:ScrollBar.AlwaysOn
                            }
                            ScrollBar.horizontal: ScrollBar {
                                id: tablehorizontalBarMatriTriaSupn5_linearsyst;
                                active:tabviewxiyiIjMatriTriaSupn5_linearsyst.implicitWidth>stackLayoutrectabMatriTriaSup_linearsyst.implicitWidth?
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModel1MatriTriaSupn5_linearsyst
                                TableModelColumn { display: "ai1" }
                                TableModelColumn { display: "ai2" }
                                TableModelColumn { display: "ai3" }
                                TableModelColumn { display: "ai4" }
                                TableModelColumn { display: "ai5" }
                                TableModelColumn { display: "bi" }
                            }
                            delegate: DelegateChooser {
                                DelegateChoice {
                                    column: 0
                                    delegate: TextField {
                                        id:textai1MatriTriaSup_linearsystn5
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai1MatriTriaSup_linearsystn5.implicitHeight
                                            width: textai1MatriTriaSup_linearsystn5.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 1
                                    delegate: TextField {
                                        id:textai2MatriTriaSup_linearsystn5
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text:model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai2MatriTriaSup_linearsystn5.implicitHeight
                                            width: textai2MatriTriaSup_linearsystn5.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 2
                                    delegate: TextField {
                                        id:textai3MatriTriaSup_linearsystn5
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai3MatriTriaSup_linearsystn5.implicitHeight
                                            width: textai3MatriTriaSup_linearsystn5.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 3
                                    delegate: TextField {
                                        id:textai4MatriTriaSup_linearsystn5
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai4MatriTriaSup_linearsystn5.implicitHeight
                                            width: textai4MatriTriaSup_linearsystn5.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 4
                                    delegate: TextField {
                                        id:textai5MatriTriaSup_linearsystn5
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textai5MatriTriaSup_linearsystn5.implicitHeight
                                            width: textai5MatriTriaSup_linearsystn5.implicitWidth
                                            color: Material.background
                                            z: -1
                                            border.color: "steelblue"
                                        }
                                    }
                                }
                                DelegateChoice {
                                    column: 5
                                    delegate: TextField {
                                        id:textbiMatriTriaSup_linearsystn5
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: Text.AlignHCenter
                                        inputMethodHints: Qt.ImhDigitsOnly
                                        text: model.display
                                        padding: 9
                                        readOnly : true
                                        selectByMouse: true
                                        renderType: Text.NativeRendering
                                        color: Material.foreground
                                        Rectangle {
                                            anchors.fill: parent
                                            height: textbiMatriTriaSup_linearsystn5.implicitHeight
                                            width: textbiMatriTriaSup_linearsystn5.implicitWidth
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

                StackLayout {
                    id: stackLayoutrectabResultsGSJaco_linearsyst
                    width: parent.width
                    currentIndex: spinBoxNbreeqtcurrentValue_linearsyst

                    Rectangle {
                        id:rectabResultsGSJacon2_linearsyst
                        width: parent.width
                        height: 250
                        color: "transparent"
                        HorizontalHeaderView {
                            id: horizontalHeaderResultsGSJacon2_linearsyst
                            anchors.left: tabviewxiyiIjResultsGSJacon2_linearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewxiyiIjResultsGSJacon2_linearsyst
                            clip: true
                            model: ["x(1)","x(2)","MaxErreur"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderResultsGSJacon2_linearsyst
                            anchors.top: tabviewxiyiIjResultsGSJacon2_linearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewxiyiIjResultsGSJacon2_linearsyst
                            visible: true
                            clip: true
                        }
                        TableView {
                            id:tabviewxiyiIjResultsGSJacon2_linearsyst
                            anchors.left: verticalHeaderResultsGSJacon2_linearsyst.right
                            anchors.top: horizontalHeaderResultsGSJacon2_linearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            height: 175
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarResultsGSJacon2_linearsyst;
                                active:tabviewxiyiIjResultsGSJacon2_linearsyst.implicitHeight>stackLayoutrectabResultsGSJaco_linearsyst.implicitHeight?
                                policy:ScrollBar.AlwaysOn
                            }
                            ScrollBar.horizontal: ScrollBar {
                                id: tablehorizontalBarResultsGSJacon2_linearsyst;
                                active:tabviewxiyiIjResultsGSJacon2_linearsyst.implicitWidth>stackLayoutrectabResultsGSJaco_linearsyst.implicitWidth?
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModelxiResultsGSJacon2_linearsyst
                                TableModelColumn { display: "x1" }
                                TableModelColumn { display: "x2" }
                                TableModelColumn { display: "MaxErreur" }
                            }
                            delegate:  TextInput {
                                id:textai1ResultsGSJaco_linearsystn2
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                color: Material.foreground
                                onTextChanged: tabviewxiyiIjResultsGSJacon2_linearsyst.forceLayout()
                                Rectangle {
                                    id: overlayResultsGSJaco_linearsystn2
                                    anchors.fill: parent
                                    height: textai1ResultsGSJaco_linearsystn2.implicitHeight
                                    width: textai1ResultsGSJaco_linearsystn2.implicitWidth
                                    ///color: Material.background
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                    }

                    Rectangle {
                        id:rectabResultsGSJacon3_linearsyst
                        width: parent.width
                        height: 250
                        color: "transparent"
                        HorizontalHeaderView {
                            id: horizontalHeaderResultsGSJacon3_linearsyst
                            anchors.left: tabviewxiyiIjResultsGSJacon3_linearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewxiyiIjResultsGSJacon3_linearsyst
                            clip: true
                            model: ["x(1)","x(2)","x(3)","MaxErreur"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderResultsGSJacon3_linearsyst
                            anchors.top: tabviewxiyiIjResultsGSJacon3_linearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewxiyiIjResultsGSJacon3_linearsyst
                            visible: true
                            clip: true
                        }
                        TableView {
                            id:tabviewxiyiIjResultsGSJacon3_linearsyst
                            anchors.left: verticalHeaderResultsGSJacon3_linearsyst.right
                            anchors.top: horizontalHeaderResultsGSJacon3_linearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            height: 175
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarResultsGSJacon3_linearsyst;
                                active:tabviewxiyiIjResultsGSJacon3_linearsyst.implicitHeight>stackLayoutrectabResultsGSJaco_linearsyst.implicitHeight?
                                policy:ScrollBar.AlwaysOn
                            }
                            ScrollBar.horizontal: ScrollBar {
                                id: tablehorizontalBarResultsGSJacon3_linearsyst;
                                active:tabviewxiyiIjResultsGSJacon3_linearsyst.implicitWidth>stackLayoutrectabResultsGSJaco_linearsyst.implicitWidth?
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModelxiResultsGSJacon3_linearsyst
                                TableModelColumn { display: "x1" }
                                TableModelColumn { display: "x2" }
                                TableModelColumn { display: "x3" }
                                TableModelColumn { display: "MaxErreur" }
                            }
                            delegate:  TextInput {
                                id:textai1ResultsGSJaco_linearsystn3
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                color: Material.foreground
                                onTextChanged: tabviewxiyiIjResultsGSJacon3_linearsyst.forceLayout()
                                Rectangle {
                                    id: overlayResultsGSJaco_linearsystn3
                                    anchors.fill: parent
                                    height: textai1ResultsGSJaco_linearsystn3.implicitHeight
                                    width: textai1ResultsGSJaco_linearsystn3.implicitWidth
                                    ///color: Material.background
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                    }

                    Rectangle {
                        id:rectabResultsGSJacon4_linearsyst
                        width: parent.width
                        height: 250
                        color: "transparent"
                        HorizontalHeaderView {
                            id: horizontalHeaderResultsGSJacon4_linearsyst
                            anchors.left: tabviewxiyiIjResultsGSJacon4_linearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewxiyiIjResultsGSJacon4_linearsyst
                            clip: true
                            model: ["x(1)","x(2)","x(3)","x(4)","MaxErreur"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderResultsGSJacon4_linearsyst
                            anchors.top: tabviewxiyiIjResultsGSJacon4_linearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewxiyiIjResultsGSJacon4_linearsyst
                            visible: true
                            clip: true
                        }
                        TableView {
                            id:tabviewxiyiIjResultsGSJacon4_linearsyst
                            anchors.left: verticalHeaderResultsGSJacon4_linearsyst.right
                            anchors.top: horizontalHeaderResultsGSJacon4_linearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            height: 175
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarResultsGSJacon4_linearsyst;
                                active:tabviewxiyiIjResultsGSJacon4_linearsyst.implicitHeight>stackLayoutrectabResultsGSJaco_linearsyst.implicitHeight?
                                policy:ScrollBar.AlwaysOn
                            }
                            ScrollBar.horizontal: ScrollBar {
                                id: tablehorizontalBarResultsGSJacon4_linearsyst;
                                active:tabviewxiyiIjResultsGSJacon4_linearsyst.implicitWidth>stackLayoutrectabResultsGSJaco_linearsyst.implicitWidth?
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModelxiResultsGSJacon4_linearsyst
                                TableModelColumn { display: "x1" }
                                TableModelColumn { display: "x2" }
                                TableModelColumn { display: "x3" }
                                TableModelColumn { display: "x4" }
                                TableModelColumn { display: "MaxErreur" }
                            }
                            delegate:  TextInput {
                                id:textai1ResultsGSJaco_linearsystn4
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                color: Material.foreground
                                onTextChanged: tabviewxiyiIjResultsGSJacon4_linearsyst.forceLayout()
                                Rectangle {
                                    id: overlayResultsGSJaco_linearsystn4
                                    anchors.fill: parent
                                    height: textai1ResultsGSJaco_linearsystn4.implicitHeight
                                    width: textai1ResultsGSJaco_linearsystn4.implicitWidth
                                    ///color: Material.background
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                    }

                    Rectangle {
                        id:rectabResultsGSJacon5_linearsyst
                        width: parent.width
                        height: 250
                        color: "transparent"
                        HorizontalHeaderView {
                            id: horizontalHeaderResultsGSJacon5_linearsyst
                            anchors.left: tabviewxiyiIjResultsGSJacon5_linearsyst.left
                            anchors.top: parent.top
                            syncView: tabviewxiyiIjResultsGSJacon5_linearsyst
                            clip: true
                            model: ["x(1)","x(2)","x(3)","x(4)","x(5)","MaxErreur"]
                        }
                        VerticalHeaderView {
                            id: verticalHeaderResultsGSJacon5_linearsyst
                            anchors.top: tabviewxiyiIjResultsGSJacon5_linearsyst.top
                            anchors.left: parent.left
                            syncView: tabviewxiyiIjResultsGSJacon5_linearsyst
                            visible: true
                            clip: true
                        }
                        TableView {
                            id:tabviewxiyiIjResultsGSJacon5_linearsyst
                            anchors.left: verticalHeaderResultsGSJacon5_linearsyst.right
                            anchors.top: horizontalHeaderResultsGSJacon5_linearsyst.bottom
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            height: 175
                            clip: true
                            columnSpacing: 1
                            rowSpacing: 1
                            ScrollBar.vertical: ScrollBar {
                                id: tableVerticalBarResultsGSJacon5_linearsyst;
                                active:tabviewxiyiIjResultsGSJacon5_linearsyst.implicitHeight>stackLayoutrectabResultsGSJaco_linearsyst.implicitHeight?
                                policy:ScrollBar.AlwaysOn
                            }
                            ScrollBar.horizontal: ScrollBar {
                                id: tablehorizontalBarResultsGSJacon5_linearsyst;
                                active:tabviewxiyiIjResultsGSJacon5_linearsyst.implicitWidth>stackLayoutrectabResultsGSJaco_linearsyst.implicitWidth?
                                policy:ScrollBar.AlwaysOn
                            }
                            boundsBehavior: Flickable.StopAtBounds
                            model: TableModel {
                                id:tableModelxiResultsGSJacon5_linearsyst
                                TableModelColumn { display: "x1" }
                                TableModelColumn { display: "x2" }
                                TableModelColumn { display: "x3" }
                                TableModelColumn { display: "x4" }
                                TableModelColumn { display: "x5" }
                                TableModelColumn { display: "MaxErreur" }
                            }
                            delegate:  TextInput {
                                id:textai1ResultsGSJaco_linearsystn5
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                color: Material.foreground
                                onTextChanged: tabviewxiyiIjResultsGSJacon5_linearsyst.forceLayout()
                                Rectangle {
                                    id: overlayResultsGSJaco_linearsystn5
                                    anchors.fill: parent
                                    height: textai1ResultsGSJaco_linearsystn5.implicitHeight
                                    width: textai1ResultsGSJaco_linearsystn5.implicitWidth
                                    ///color: Material.background
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                    }
                }
            }

            TextField {
                id:textAffichageResultats_linearsyst
                width: parent.width
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                padding: 9
                wrapMode: Text.Wrap
                readOnly : true
                selectByMouse: true
                renderType: Text.NativeRendering
                color: Material.foreground
                placeholderText: qsTr("Results")
            }
        }
    }

    Component.onCompleted: {
        var i
        radiobuttonMetho1_linearsyst.checked=true
        function hafparseFloat(x){
            if (isNaN(parseFloat(x))){
                return "..."
            }else{
                return parseFloat(x)
            }
        }
        for (i = 0; i < 2; i++) {
            tableModel1datan2_linearsyst.appendRow({ai1:parseFloat(tabArrayxiyidatan2_linearsyst[i][0]),ai2:parseFloat(tabArrayxiyidatan2_linearsyst[i][1]),bi:hafparseFloat(tabArrayxiyidatan2_linearsyst[i][2])})
        }
        for (i = 0; i < 3; i++) {
            tableModel1datan3_linearsyst.appendRow({ai1:parseFloat(tabArrayxiyidatan3_linearsyst[i][0]),ai2:parseFloat(tabArrayxiyidatan3_linearsyst[i][1]),ai3:parseFloat(tabArrayxiyidatan3_linearsyst[i][2]),bi:hafparseFloat(tabArrayxiyidatan3_linearsyst[i][3])})
        }
        for (i = 0; i < 4; i++) {
            tableModel1datan4_linearsyst.appendRow({ai1:parseFloat(tabArrayxiyidatan4_linearsyst[i][0]),ai2:parseFloat(tabArrayxiyidatan4_linearsyst[i][1]),ai3:parseFloat(tabArrayxiyidatan4_linearsyst[i][2]),ai4:parseFloat(tabArrayxiyidatan4_linearsyst[i][3]),bi:hafparseFloat(tabArrayxiyidatan4_linearsyst[i][4])})
        }
        for (i = 0; i < 5; i++) {
            tableModel1datan5_linearsyst.appendRow({ai1:parseFloat(tabArrayxiyidatan5_linearsyst[i][0]),ai2:parseFloat(tabArrayxiyidatan5_linearsyst[i][1]),ai3:parseFloat(tabArrayxiyidatan5_linearsyst[i][2]),ai4:parseFloat(tabArrayxiyidatan5_linearsyst[i][3]),ai5:parseFloat(tabArrayxiyidatan5_linearsyst[i][4]),bi:hafparseFloat(tabArrayxiyidatan5_linearsyst[i][5])})
        }

    }
}
