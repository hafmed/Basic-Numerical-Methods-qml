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

    property string colorfx_inteqt: "white"

    function fmethodeindex_inteqt()
    {
        if (radiobutton1ischecked_inteqt) methodeindex_inteqt= 0
        if (radiobutton2ischecked_inteqt) methodeindex_inteqt= 1
        if (radiobutton3ischecked_inteqt) methodeindex_inteqt= 2
        CalculHaf.nselonmethodechoisie(spinBoxNbrePtsfx_inteqt.value, methodeindex_inteqt)
    }
    Connections {
        target: CalculHaf
        function onRequestDialog_inteqt(title,error){
            dialogMessageErrorFparser.title=title
            textfirstuseofappdialog_tp.text=error
            dialogMessageErrorFparser.open()
        }
        function onRequestCleartable_inteqt(){
            tableModel1_inteqt.clear()
        }
        function onRequesttextAffichageResultats_inteqt(text){
            textAffichageResultats_inteqt.text=text
        }
        function onRequestXinteqt(xi,yi,Ij){
            tableModel1_inteqt.appendRow({xi:xi,yi:yi,Ij:Ij})
            tableVerticalBar_inteqt.setPosition(1 - tableVerticalBar_inteqt.size)
        }
        function onRequestIjSimpinteqt(rowi,Ij){
            tableModel1_inteqt.setRow(rowi, {xi:tableModel1_inteqt.rows[rowi].xi,yi:tableModel1_inteqt.rows[rowi].yi,Ij:Ij})
            tableVerticalBar_inteqt.setPosition(1 - tableVerticalBar_inteqt.size)
        }
        function onRequestSelectEndtable_inteqt(){
            tableVerticalBar_inteqt.setPosition(1 - tableVerticalBar_inteqt.size)
        }
        function onRequestndxint(n,stepn,nmini){
            spinBoxNbrePtsfx_inteqt.value=n
            spinBoxNbrePtsfx_inteqt.stepSize=stepn
            spinBoxNbrePtsfx_inteqt.from=nmini
            spinBoxNbrePtsTab_inteqt.value=n
            spinBoxNbrePtsTab_inteqt.stepSize=stepn
            spinBoxNbrePtsTab_inteqt.from=nmini
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
            ButtonGroup {
                id:buttongroup1_inteqt
                ///  buttons: rowgroupbutton1_inteqt.children
                exclusive : true
                onClicked: fmethodeindex_inteqt()
            }
            Column {
                id:rowgroupbutton1_inteqt
                width: parent.width-5
                anchors.margins: 10
                spacing: 10
                Row {
                    id:rowgroupbutton_inteqt
                    width:  parent.width
                    spacing: 1
                    RadioButton {
                        id:radiobuttontab_inteqt
                        checked: true
                        text: qsTr("Table (x(i),y(i)):")
                        ButtonGroup.group: buttongroup1_inteqt
                        onCheckedChanged:{
                            radiobuttontableischecked_inteqt=radiobuttontab_inteqt.checked
                        }
                    }
                    SpinBox {
                        id: spinBoxNbrePtsTab_inteqt
                        width: parent.width-radiobuttontab_inteqt.implicitWidth
                        from: 2
                        value: settings.nbrePtsTab_inteqt
                        to: 100
                        editable: true
                        onValueChanged:{
                            spinBoxNbrePtsfx_inteqt.value=spinBoxNbrePtsTab_inteqt.value
                            for (let i = 0; i < 10 ; i++) {
                                nbrePtsTab_inteqt=spinBoxNbrePtsTab_inteqt.value;
                                if (nbrePtsTab_inteqt!=="" && nbrePtsTab_inteqt!==0 ){
                                    if (nbrePtsTab_inteqt > tableModel1_inteqt.rowCount) {
                                        for (let i = 0; i < Math.abs(nbrePtsTab_inteqt-tableModel1_inteqt.rowCount) ; i++) {
                                            tableModel1_inteqt.appendRow({xi:"0",yi:"0",Ij:"0"})
                                        }
                                    }
                                    if (nbrePtsTab_inteqt < tableModel1_inteqt.rowCount) {
                                        tableModel1_inteqt.removeRow(nbrePtsTab_inteqt,Math.abs(tableModel1_inteqt.rowCount-nbrePtsTab_inteqt))
                                    }
                                }
                            }

                            tabviewxiyiIj_inteqt.savexiyiIjtableModel1_inteqt()
                            tabviewxiyiIj_inteqt.fullxitableModel1_inteqt()

                        }
                        property string prefix: qsTr("Number of points=")

                        validator: RegularExpressionValidator { regularExpression: /\D*(-?\d*\.?\d*)\D*/ }

                        textFromValue: function(value, locale) {
                            return prefix + Number(value).toLocaleString(locale, 'f', 0)
                        }

                        valueFromText: function(text, locale) {
                            let re = /\D*(-?\d*\.?\d*)\D*/
                            return Number.fromLocaleString(locale, re.exec(text)[1])
                        }
                    }
                }

                Rectangle {
                    id:rectabview1_inteqt
                    width: parent.width-10
                    height: 250
                    color: "transparent"
                    HorizontalHeaderView {
                        id: horizontalHeader2_tp5
                        anchors.left: tabviewxiyiIj_inteqt.left
                        anchors.top: parent.top
                        syncView: tabviewxiyiIj_inteqt
                        clip: true
                        model: ["x(i)" , "y(i)","I(J)"]
                    }
                    VerticalHeaderView {
                        id: verticalHeader2_tp5
                        anchors.top: tabviewxiyiIj_inteqt.top
                        anchors.left: parent.left
                        syncView: tabviewxiyiIj_inteqt
                        clip: true
                    }
                    TableView {
                        id:tabviewxiyiIj_inteqt
                        anchors.left: verticalHeader2_tp5.right
                        anchors.top: horizontalHeader2_tp5.bottom
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        clip: true
                        columnSpacing: 1
                        rowSpacing: 1
                        ScrollBar.vertical: ScrollBar {
                            id: tableVerticalBar_inteqt;
                            active:tabviewxiyiIj_inteqt.implicitHeight>rectabview1_inteqt.implicitHeight?
                                       policy:ScrollBar.AlwaysOn
                        }
                        boundsBehavior: Flickable.StopAtBounds
                        model: TableModel {
                            id:tableModel1_inteqt
                            TableModelColumn { display: "xi" }
                            TableModelColumn { display: "yi" }
                            TableModelColumn { display: "Ij" }
                        }
                        function fullxitableModel1_inteqt(){
                            tableModel1_inteqt.clear()
                            for(var i=0; i<nbrePtsTab_inteqt; i++)
                            {
                                tableModel1_inteqt.appendRow({xi:parseFloat(a_inteqt+i*dx_inteqt).toFixed(3),yi:"",Ij:""})
                            }
                        }
                        function savexiyiIjtableModel1_inteqt(){
                            ///tabArrayxiyi_inteqt = [];
                            var tabArrayxiyi_inteqtok = new Array(nbrePtsTab_inteqt);
                            for (var i = 0; i < nbrePtsTab_inteqt; i++) {
                                tabArrayxiyi_inteqtok[i] = new Array(3);
                            }
                            for (let i = 0; i < tableModel1_inteqt.rowCount; i++) {
                                tabArrayxiyi_inteqtok[i][0]=tableModel1_inteqt.rows[i].xi
                                tabArrayxiyi_inteqtok[i][1]=tableModel1_inteqt.rows[i].yi
                                tabArrayxiyi_inteqtok[i][2]=tableModel1_inteqt.rows[i].Ij
                            }
                            tabArrayxiyi_inteqt=tabArrayxiyi_inteqtok
                        }
                        delegate: DelegateChooser {
                            DelegateChoice {
                                column: 0
                                delegate: TextField {
                                    id:textxi_inteqt
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display ///model.display>10**(-nbreDecim_inteqt) ? parseFloat(model.display).toFixed(nbreDecim_inteqt):model.display
                                    padding: 9
                                    readOnly : true
                                    selectByMouse: true
                                    ///renderType: Text.NativeRendering
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIj_inteqt.savexiyiIjtableModel1_inteqt()
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textxi_inteqt.implicitHeight
                                        width: textxi_inteqt.implicitWidth
                                        ///width: parent.width/2
                                        color:"transparent"
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 1
                                delegate: TextField {
                                    id:textyi_inteqt
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    inputMethodHints: Qt.ImhDigitsOnly
                                    text:model.display ///model.display>10**(-nbreDecim_inteqt) ? parseFloat(model.display).toFixed(nbreDecim_inteqt):model.display
                                    padding: 9
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    onEditingFinished: {
                                        model.display = text
                                        tabviewxiyiIj_inteqt.savexiyiIjtableModel1_inteqt()
                                        radiobuttontab_inteqt.checked=true
                                    }
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textyi_inteqt.implicitHeight
                                        width: textyi_inteqt.implicitWidth
                                        ///width: parent.width/2
                                        color:"transparent"
                                        z: -1
                                        border.color: "steelblue"
                                    }
                                }
                            }
                            DelegateChoice {
                                column: 2
                                delegate: TextField {
                                    id:textIj_inteqt
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    ///inputMethodHints: Qt.ImhDigitsOnly
                                    text: model.display///model.display>10**(-nbreDecim_inteqt) ? parseFloat(model.display).toFixed(nbreDecim_inteqt):model.display
                                    padding: 9
                                    readOnly : true
                                    selectByMouse: true
                                    renderType: Text.NativeRendering
                                    Rectangle {
                                        anchors.fill: parent
                                        height: textIj_inteqt.implicitHeight
                                        width: textIj_inteqt.implicitWidth
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
                Row {
                    RadioButton {
                        id:radiobuttonfx_inteqt
                        text: qsTr("f(x) :")
                        ButtonGroup.group: buttongroup1_inteqt
                        /// onDoubleClicked:  radiobuttonfx_inteqt.checked=!radiobuttonfx_inteqt.checked
                        onCheckedChanged: {
                            radiobuttonfxischecked_inteqt=radiobuttonfx_inteqt.checked
                        }
                    }
                    CheckBox {
                        id:checkBoxremplirtab_inteqt
                        text: qsTr("Fill Table")
                        onCheckedChanged: {
                            checkBoxremplirtabischecked_inteqt=checkBoxremplirtab_inteqt.checked
                        }
                    }
                }
            }
            TextField {
                id:textfx_inteqt
                width: parent.width-5
                placeholderText: qsTr("y=f(x)")
                text: settings.fx_inteqt
                color: colorfx_inteqt
                onTextChanged: {if (textfx_inteqt.text==="nan" || textfx_inteqt.text==="NaN") textfx_inteqt.text=fx_inteqt ;
                    fx_inteqt=textfx_inteqt.text;
                    colorfx_inteqt=CalculHaf.textChangedinfx_integ(fx_inteqt)
                }
            }
            Row{
                width:parent.width-10
                spacing: 3
                TextField {
                    id:texta_inteqt
                    width: parent.width/3
                    placeholderText: qsTr("a")
                    text: settings.a_inteqt
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (texta_inteqt.text==="nan" || texta_inteqt.text==="NaN") texta_inteqt.text=a_inteqt ;
                        a_inteqt=texta_inteqt.text;
                        dx_inteqt=(b_inteqt-a_inteqt)/(nbrePtsfx_inteqt-1);
                        textdx_inteqt.text=parseFloat(dx_inteqt).toFixed(3);
                    }
                }
                TextField {
                    id:textb_inteqt
                    width: parent.width/3
                    placeholderText: qsTr("b")
                    text: settings.b_inteqt
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textb_inteqt.text==="nan" || textb_inteqt.text==="NaN") textb_inteqt.text=b_inteqt ;
                        b_inteqt=textb_inteqt.text;
                        dx_inteqt=(b_inteqt-a_inteqt)/(nbrePtsfx_inteqt-1);
                        textdx_inteqt.text=parseFloat(dx_inteqt).toFixed(3);
                    }
                }
                TextField {
                    id:textdx_inteqt
                    width: parent.width/3
                    placeholderText: qsTr("dx")
                    text: settings.dx_inteqt
                    readOnly : true
                    selectByMouse: true
                    inputMethodHints: Qt.ImhDigitsOnly
                    onTextChanged: {if (textdx_inteqt.text==="nan" || textdx_inteqt.text==="NaN") textdx_inteqt.text=dx_inteqt ;
                        dx_inteqt=textdx_inteqt.text;
                    }
                }
            }
            Row{
                width:parent.width-5
                spacing: 3
                Column {
                    id:column_buttongroup2_inteqt
                    width: rowgroupbutton2_inteqt.implicitWidth
                    anchors.margins: 10
                    spacing: 1
                    ButtonGroup {
                        id:buttongroup2_inteqt
                        buttons: rowgroupbutton2_inteqt.children
                        exclusive : true
                        onClicked: fmethodeindex_inteqt()
                    }
                    Column {
                        id:rowgroupbutton2_inteqt
                        width:  parent.width
                        spacing: -10
                        RadioButton {
                            id:radiobuttonMetho1_inteqt
                            checked: true
                            text: qsTr("Trapezoidal")
                            ButtonGroup.group: buttongroup2_inteqt
                            onCheckedChanged: radiobutton1ischecked_inteqt=radiobuttonMetho1_inteqt.checked
                        }
                        RadioButton {
                            id:radiobuttonMetho2_inteqt
                            text: qsTr("Simpson 1/3")
                            ButtonGroup.group: buttongroup2_inteqt
                            onCheckedChanged: radiobutton2ischecked_inteqt=radiobuttonMetho2_inteqt.checked
                        }
                        RadioButton {
                            id:radiobuttonMetho3_inteqt
                            text: qsTr("Simpson 3/8")
                            ButtonGroup.group: buttongroup2_inteqt
                            onCheckedChanged: radiobutton3ischecked_inteqt=radiobuttonMetho3_inteqt.checked
                        }
                    }
                }
                Column {
                    id:column282
                    width: parent.width-column_buttongroup2_inteqt.width-3
                    anchors.margins: 10
                    spacing: 10
                    SpinBox {
                        id: spinBoxNbrePtsfx_inteqt
                        width: parent.width
                        from: 2
                        value: settings.nbrePtsfx_inteqt
                        to: 100
                        editable: true
                        onValueChanged:{
                            if (spinBoxNbrePtsfx_inteqt.value==="nan" || spinBoxNbrePtsfx_inteqt.value==="NaN") textNbrePtsfx_inteqt.text=nbrePtsfx_inteqt ;
                            nbrePtsfx_inteqt=spinBoxNbrePtsfx_inteqt.value;
                            dx_inteqt=(b_inteqt-a_inteqt)/(nbrePtsfx_inteqt-1);
                            textdx_inteqt.text=parseFloat(dx_inteqt).toFixed(3);
                        }
                        property string prefix: qsTr("Number of points=")

                        validator: RegularExpressionValidator { regularExpression: /\D*(-?\d*\.?\d*)\D*/ }

                        textFromValue: function(value, locale) {
                            return prefix + Number(value).toLocaleString(locale, 'f', 0)
                        }

                        valueFromText: function(text, locale) {
                            let re = /\D*(-?\d*\.?\d*)\D*/
                            return Number.fromLocaleString(locale, re.exec(text)[1])
                        }
                    }
                    Image {
                        id: image1inteqt
                        width: parent.width
                        height: spinBoxNbrePtsfx_inteqt.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Integ.bmp"
                    }
                }
            }
            Button {
                width: parent.width
                text: "Calculate the integral"
                onClicked: {
                    if (checkBoxremplirtabischecked_inteqt && radiobuttonfxischecked_inteqt) spinBoxNbrePtsTab_inteqt.value=nbrePtsfx_inteqt

                    tabviewxiyiIj_inteqt.savexiyiIjtableModel1_inteqt()
                    if (radiobutton1ischecked_inteqt){
                        CalculHaf.hafafficherIntegration(fx_inteqt,tabArrayxiyi_inteqt,a_inteqt, b_inteqt, nbrePtsTab_inteqt,nbrePtsfx_inteqt, radiobuttonfxischecked_inteqt, checkBoxremplirtabischecked_inteqt, nbreDecim_inteqt,0)
                    }
                    if (radiobutton2ischecked_inteqt){
                        CalculHaf.hafafficherIntegration(fx_inteqt,tabArrayxiyi_inteqt,a_inteqt, b_inteqt, nbrePtsTab_inteqt,nbrePtsfx_inteqt, radiobuttonfxischecked_inteqt, checkBoxremplirtabischecked_inteqt, nbreDecim_inteqt,1)
                    }
                    if (radiobutton3ischecked_inteqt){
                        CalculHaf.hafafficherIntegration(fx_inteqt,tabArrayxiyi_inteqt,a_inteqt, b_inteqt, nbrePtsTab_inteqt,nbrePtsfx_inteqt, radiobuttonfxischecked_inteqt, checkBoxremplirtabischecked_inteqt, nbreDecim_inteqt,2)
                    }

                    tabviewxiyiIj_inteqt.savexiyiIjtableModel1_inteqt()
                }
            }
            TextField {
                id:textAffichageResultats_inteqt
                width: parent.width
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                padding: 9
                wrapMode: Text.Wrap
                readOnly : true
                selectByMouse: true
                renderType: Text.NativeRendering
                placeholderText: qsTr("Results")
                ///text: settings.nbrePtsfx_inteqt
            }



        }


    }

    Component.onCompleted: {
        radiobuttonMetho1_inteqt.checked=true
        radiobuttonfx_inteqt.checked=true
        checkBoxremplirtab_inteqt.checked=true
        tableModel1_inteqt.clear();
        function hafparseFloat(x){
            if (isNaN(parseFloat(x))){
                return "..."
            }else{
                return parseFloat(x)
            }
        }

        for (let i = 0; i < nbrePtsTab_inteqt; i++) {
            tableModel1_inteqt.appendRow({xi:parseFloat(tabArrayxiyi_inteqt[i][0]),yi:parseFloat(tabArrayxiyi_inteqt[i][1]),Ij:hafparseFloat(tabArrayxiyi_inteqt[i][2])})
        }

    }
}
