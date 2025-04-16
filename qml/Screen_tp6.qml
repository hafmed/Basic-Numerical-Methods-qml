import QtQuick
import QtQuick.Controls
import QtCore
import QtQuick.Controls.Material 2.12
import Qt.labs.qmlmodels 1.0
import QtCharts
import QtQuick.Layouts

Rectangle {
    id:root
    width: app.width
    height: app.height-rect.height
    color:"transparent"
    Material.theme: Material.Dark
    Material.accent: Material.Pink

    property string colorfx_polynoapproxi: "white"

    function columnWidth(column) {
        if (column >= nbrePts_polynoapproxi+2)
            return 0;
    }
    function hafparseFloat(x){
        if (isNaN(parseFloat(x))){
            return "..."
        }else{
            return parseFloat(x)
        }
    }
    property var columnWidths: [125,125,0,0,0,0,0,0,0,0,0]

    function configNbrepts() {
        textAffichageResultats_polynoapproxi.text=""
        if (comboxNbrepts_polynoapproxi.currentIndex===0) {
            if (radiobutton1ischecked_polynoapproxi){
                columnWidths=[125,125,0,0,0,0,0,0,0,0,0]
            }else{
                columnWidths=[125,125,125,0,0,0,0,0,0,0,0]
            }
            tableModel1data_polynoapproxi.clear()
            for (let i = 0; i < 2; i++) {
                tableModel1data_polynoapproxi.appendRow({xi:"",yi:"",fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
            }
            verticalHeaderdata_polynoapproxi.model=["Point(0)","Point(1)"]
            nbrePts_polynoapproxi=2
        }
        if (comboxNbrepts_polynoapproxi.currentIndex===1) {
            if (radiobutton1ischecked_polynoapproxi){
                columnWidths=[125,125,0,0,0,0,0,0,0,0,0]
            }else{
                columnWidths=[125,125,125,125,0,0,0,0,0,0,0]
            }
            tableModel1data_polynoapproxi.clear()
            for (let i = 0; i < 3; i++) {
                tableModel1data_polynoapproxi.appendRow({xi:"",yi:"",fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
            }
            verticalHeaderdata_polynoapproxi.model=["Point(0)","Point(1)","Point(2)"]
            nbrePts_polynoapproxi=3
        }
        if (comboxNbrepts_polynoapproxi.currentIndex===2) {
            if (radiobutton1ischecked_polynoapproxi){
                columnWidths=[125,125,0,0,0,0,0,0,0,0,0]
            }else{
                columnWidths=[125,125,125,125,125,0,0,0,0,0,0]
            }
            tableModel1data_polynoapproxi.clear()
            for (let i = 0; i < 4; i++) {
                tableModel1data_polynoapproxi.appendRow({xi:"",yi:"",fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
            }
            verticalHeaderdata_polynoapproxi.model=["Point(0)","Point(1)","Point(2)","Point(3)"]
            nbrePts_polynoapproxi=4
        }
        if (comboxNbrepts_polynoapproxi.currentIndex===3) {
            if (radiobutton1ischecked_polynoapproxi){
                columnWidths=[125,125,0,0,0,0,0,0,0,0,0]
            }else{
                columnWidths=[125,125,125,125,125,125,0,0,0,0,0]
            }
            tableModel1data_polynoapproxi.clear()
            for (let i = 0; i < 5; i++) {
                tableModel1data_polynoapproxi.appendRow({xi:"",yi:"",fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
            }
            verticalHeaderdata_polynoapproxi.model=["Point(0)","Point(1)","Point(2)","Point(3)","Point(4)"]
            nbrePts_polynoapproxi=5
        }
        if (comboxNbrepts_polynoapproxi.currentIndex===4) {
            if (radiobutton1ischecked_polynoapproxi){
                columnWidths=[125,125,0,0,0,0,0,0,0,0,0]
            }else{
                columnWidths=[125,125,125,125,125,125,135,0,0,0,0]
            }
            tableModel1data_polynoapproxi.clear()
            for (let i = 0; i < 6; i++) {
                tableModel1data_polynoapproxi.appendRow({xi:"",yi:"",fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
            }
            verticalHeaderdata_polynoapproxi.model=["Point(0)","Point(1)","Point(2)","Point(3)","Point(4)","Point(5)"]
            nbrePts_polynoapproxi=6
        }
        if (comboxNbrepts_polynoapproxi.currentIndex===5) {
            if (radiobutton1ischecked_polynoapproxi){
                columnWidths=[125,125,0,0,0,0,0,0,0,0,0]
            }else{
                columnWidths=[125,125,125,125,125,125,135,135,0,0,0]
            }
            tableModel1data_polynoapproxi.clear()
            for (let i = 0; i < 7; i++) {
                tableModel1data_polynoapproxi.appendRow({xi:"",yi:"",fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
            }
            verticalHeaderdata_polynoapproxi.model=["Point(0)","Point(1)","Point(2)","Point(3)","Point(4)","Point(5)","Point(6)"]
            nbrePts_polynoapproxi=7
        }
        if (comboxNbrepts_polynoapproxi.currentIndex===6) {
            if (radiobutton1ischecked_polynoapproxi){
                columnWidths=[125,125,0,0,0,0,0,0,0,0,0]
            }else{
                columnWidths=[125,125,125,125,125,125,135,135,185,0,0]
            }
            tableModel1data_polynoapproxi.clear()
            for (let i = 0; i < 8; i++) {
                tableModel1data_polynoapproxi.appendRow({xi:"",yi:"",fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
            }
            verticalHeaderdata_polynoapproxi.model=["Point(0)","Point(1)","Point(2)","Point(3)","Point(4)","Point(5)","Point(6)","Point(7)"]
            nbrePts_polynoapproxi=8
        }
        if (comboxNbrepts_polynoapproxi.currentIndex===7) {
            if (radiobutton1ischecked_polynoapproxi){
                columnWidths=[125,125,0,0,0,0,0,0,0,0,0]
            }else{
                columnWidths=[125,125,125,125,125,125,135,135,185,185,0]
            }
            tableModel1data_polynoapproxi.clear()
            for (let i = 0; i < 9; i++) {
                tableModel1data_polynoapproxi.appendRow({xi:"",yi:"",fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
            }
            verticalHeaderdata_polynoapproxi.model=["Point(0)","Point(1)","Point(2)","Point(3)","Point(4)","Point(5)","Point(6)","Point(7)","Point(8)"]
            nbrePts_polynoapproxi=9
        }
        if (comboxNbrepts_polynoapproxi.currentIndex===8) {
            if (radiobutton1ischecked_polynoapproxi){
                columnWidths=[125,125,0,0,0,0,0,0,0,0,0]
            }else{
                columnWidths=[125,125,125,125,125,125,135,135,185,185,185]
            }
            tableModel1data_polynoapproxi.clear()
            for (let i = 0; i < 10; i++) {
                tableModel1data_polynoapproxi.appendRow({xi:"",yi:"",fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
            }
            verticalHeaderdata_polynoapproxi.model=["Point(0)","Point(1)","Point(2)","Point(3)","Point(4)","Point(5)","Point(6)","Point(7)","Point(8)","Point(9)"]
            nbrePts_polynoapproxi=10
        }
        loadtableModel1data_polynoapproxi();
        tabviewxiyidata_polynoapproxi.forceLayout();
        /// savesettings()
    }
    function fmethodeindex_polynoapproxi()
    {
        configNbrepts()
        textAffichageResultats_polynoapproxi.text=""
        if (radiobutton1ischecked_polynoapproxi) methodeindex_polynoapproxi= 0
        if (radiobutton2ischecked_polynoapproxi) methodeindex_polynoapproxi= 1
    }
    function loadtableModel1data_polynoapproxi() {
        tableModel1data_polynoapproxi.clear();
        for (var i = 0; i < nbrePts_polynoapproxi; i++) {
            tableModel1data_polynoapproxi.appendRow({xi:parseFloat(tabArrayxiyi_polynoapproxi[i][0]),yi:parseFloat(tabArrayxiyi_polynoapproxi[i][1]),fx0x1:"",fx0x1x2:"",fx0x1x2x3:"",fx0x1x2x3x4:"",fx0x1x2x3x4x5:"",fx0x1x2x3x4x5x6:"",fx0x1x2x3x4x5x6x7:"",fx0x1x2x3x4x5x6x7x8:"",fx0x1x2x3x4x5x6x7x8x9:""})
        }
    }
    Connections {
        target: CalculHaf
        function onRequestDialog_polynoapproxi(title,error){
            dialogMessageErrorFparser.title=title
            textfirstuseofappdialog_tp.text=error
            dialogMessageErrorFparser.open()
        }
        ///---------------
        function onRequesttextAffichageResultats_polynoapproxi(text){
            textAffichageResultats_polynoapproxi.text=text
        }
        function onRequest_polynoapproxi(xi,yi,fx0x1,fx0x1x2,fx0x1x2x3,fx0x1x2x3x4,fx0x1x2x3x4x5,fx0x1x2x3x4x5x6,fx0x1x2x3x4x5x6x7,fx0x1x2x3x4x5x6x7x8,fx0x1x2x3x4x5x6x7x8x9){
            tableModel1data_polynoapproxi.appendRow({xi:xi,yi:yi,fx0x1:fx0x1,fx0x1x2:fx0x1x2,fx0x1x2x3:fx0x1x2x3,fx0x1x2x3x4:fx0x1x2x3x4,fx0x1x2x3x4x5:fx0x1x2x3x4x5,fx0x1x2x3x4x5x6:fx0x1x2x3x4x5x6,fx0x1x2x3x4x5x6x7:fx0x1x2x3x4x5x6x7,fx0x1x2x3x4x5x6x7x8:fx0x1x2x3x4x5x6x7x8,fx0x1x2x3x4x5x6x7x8x9:fx0x1x2x3x4x5x6x7x8x9})
            tabviewxiyidata_polynoapproxi.forceLayout();
        }
        // function onRequestSelectEndtable_polynoapproxi(){
        //     tableVerticalBarResultsGSJacon2_polynoapproxi.setPosition(1 - tableVerticalBarResultsGSJacon2_polynoapproxi.size)
        //     }
    }
    // Dialog {
    //     id: dialogMessageErrorFparser
    //     title: "Basic Numerical Methods ver "+appVer
    //     anchors.centerIn: Overlay.overlay
    //     width: parent.width
    //     Text {
    //         id:textfirstuseofappdialog_tp
    //         width: parent.width
    //         text: "Error"
    //         wrapMode: Text.Wrap
    //         font.bold : true
    //         horizontalAlignment: Text.AlignHCenter
    //         verticalAlignment: Text.AlignVCenter
    //     }
    //     standardButtons: Dialog.Ok
    //     onAccepted: {
    //         // tableVerticalBarResultsGSJacon2_polynoapproxi.setPosition(1 - tableVerticalBarResultsGSJacon2_polynoapproxi.size)
    //         // tableVerticalBarResultsGSJacon3_polynoapproxi.setPosition(1 - tableVerticalBarResultsGSJacon3_polynoapproxi.size)
    //         // tableVerticalBarResultsGSJacon4_polynoapproxi.setPosition(1 - tableVerticalBarResultsGSJacon4_polynoapproxi.size)
    //         // tableVerticalBarResultsGSJacon5_polynoapproxi.setPosition(1 - tableVerticalBarResultsGSJacon5_polynoapproxi.size)
    //         close()
    //     }
    // }

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
                    id:label_Nbrepts_polynoapproxi
                    wrapMode: Text.Wrap
                    height: comboxNbrepts_polynoapproxi.height
                    verticalAlignment: "AlignVCenter"
                    text:"Number of points: "
                }
                ComboBox {
                    id:comboxNbrepts_polynoapproxi
                    width: parent.width-label_Nbrepts_polynoapproxi.implicitWidth-10
                    model: ["2 Points","3 Points","4 Points","5 Points","6 Points","7 Points","8 Points","9 Points","10 Points"]
                    currentIndex: settings.configNbreptscurrentIndex
                    onCurrentIndexChanged: {
                        configNbreptscurrentIndex=comboxNbrepts_polynoapproxi.currentIndex
                        configNbrepts()
                    }
                }
            }
            Row{
                width:parent.width
                spacing: 3
                Column {
                    id:column_buttongroup_polynoapproxi
                    width: rowgroupbutton_polynoapproxi.implicitWidth
                    anchors.margins: 10
                    spacing: 1
                    ButtonGroup {
                        id:buttongroup_polynoapproxi
                        buttons: rowgroupbutton_polynoapproxi.children
                        exclusive : true
                        onClicked: fmethodeindex_polynoapproxi()
                    }
                    Column {
                        id:rowgroupbutton_polynoapproxi
                        width:  parent.width
                        spacing: -10
                        RadioButton {
                            id:radiobuttonMetho1_polynoapproxi
                            checked: true
                            text: qsTr("Lagrange")
                            ButtonGroup.group: buttongroup_polynoapproxi
                            onCheckedChanged: radiobutton1ischecked_polynoapproxi=radiobuttonMetho1_polynoapproxi.checked
                        }
                        RadioButton {
                            id:radiobuttonMetho2_polynoapproxi
                            text: qsTr("Newton's Divided Differences")
                            ButtonGroup.group: buttongroup_polynoapproxi
                            onCheckedChanged: radiobutton2ischecked_polynoapproxi=radiobuttonMetho2_polynoapproxi.checked
                        }
                    }
                }
                StackLayout {
                    id: view2
                    width: parent.width-column_buttongroup_polynoapproxi.width-10
                    height: rowgroupbutton_polynoapproxi.height
                    currentIndex: methodeindex_polynoapproxi
                    Image {
                        id: image1_polynoapproxi
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Lagrange.png"
                    }
                    Image {
                        id: image2_polynoapproxi
                        width: parent.width
                        height: parent.height
                        smooth: true
                        fillMode: Image.PreserveAspectFit
                        source: "images/Newton.bmp"
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
                    text: "Points"
                    anchors.fill: parent.center
                }
                ToolSeparator {
                    height: 25
                    width: (parent.width-label1_Calcul_tp6.width)/2
                    orientation: Qt.Horizontal
                }
            }
            Rectangle {
                id:rectabdatan_polynoapproxi
                width: parent.width-17
                height: 250
                color: "transparent"
                HorizontalHeaderView {
                    id: horizontalHeaderdata_polynoapproxi
                    anchors.left: tabviewxiyidata_polynoapproxi.left
                    anchors.top: parent.top
                    syncView: tabviewxiyidata_polynoapproxi
                    clip: true
                    model: ["x(i)","y(i)","f[x0,x1]","f[x0,x1,x2]","f[x0,x1,x3]","f[x0,x1,x2,x3,x4]","f[x0,x1,x2,x3,x4,x5]","f[x0,x1,x2,x3,x4,x5,x6]","f[x0,x1,x2,x3,x4,x5,x6,x7]","f[x0,x1,x2,x3,x4,x5,x6,x7,x8]","f[x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]"]
                }
                VerticalHeaderView {
                    id: verticalHeaderdata_polynoapproxi
                    anchors.top: tabviewxiyidata_polynoapproxi.top
                    anchors.left: parent.left
                    syncView: tabviewxiyidata_polynoapproxi
                    clip: true
                    model: ["Point(0)","Point(1)","Point(2)","Point(3)","Point(4)","Point(5)","Point(6)","Point(7)","Point(8)","Point(9)"]
                }
                TableView {
                    id:tabviewxiyidata_polynoapproxi
                    anchors.left: verticalHeaderdata_polynoapproxi.right
                    anchors.top: horizontalHeaderdata_polynoapproxi.bottom
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    clip: true
                    columnSpacing: 1
                    rowSpacing: 1
                    columnWidthProvider: function (column) { return columnWidths[column] }
                    ScrollBar.vertical: ScrollBar {
                        id: tableVerticalBardata_polynoapproxi;
                        active:tabviewxiyidata_polynoapproxi.implicitHeight>rectabdatan_polynoapproxi.implicitHeight?
                                   policy:ScrollBar.AlwaysOn
                    }
                    ScrollBar.horizontal: ScrollBar {
                        id: tablehorizontalBardata_polynoapproxi;
                        active:tabviewxiyidata_polynoapproxi.implicitWidth>rectabdatan_polynoapproxi.implicitWidth?
                                   policy:ScrollBar.AlwaysOn
                    }
                    boundsBehavior: Flickable.StopAtBounds
                    model: TableModel {
                        id:tableModel1data_polynoapproxi
                        TableModelColumn { display: "xi" }
                        TableModelColumn { display: "yi" }
                        TableModelColumn { display: "fx0x1" }
                        TableModelColumn { display: "fx0x1x2" }
                        TableModelColumn { display: "fx0x1x2x3" }
                        TableModelColumn { display: "fx0x1x2x3x4" }
                        TableModelColumn { display: "fx0x1x2x3x4x5" }
                        TableModelColumn { display: "fx0x1x2x3x4x5x6" }
                        TableModelColumn { display: "fx0x1x2x3x4x5x6x7" }
                        TableModelColumn { display: "fx0x1x2x3x4x5x6x7x8" }
                        TableModelColumn { display: "fx0x1x2x3x4x5x6x7x8x9" }
                    }
                    function savexiyitableModel1data_polynoapproxi(){
                        for (let i = 0; i < tableModel1data_polynoapproxi.rowCount; i++) {
                            tabArrayxiyi_polynoapproxi[i][0]=tableModel1data_polynoapproxi.rows[i].xi
                            tabArrayxiyi_polynoapproxi[i][1]=tableModel1data_polynoapproxi.rows[i].yi
                        }
                    }
                    delegate: DelegateChooser {
                        DelegateChoice {
                            column: 0
                            delegate: TextField {
                                id:textxi_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                onEditingFinished: {
                                    model.display = text
                                    tabviewxiyidata_polynoapproxi.savexiyitableModel1data_polynoapproxi()
                                }
                                Rectangle {
                                    anchors.fill: parent
                                    height: textxi_polynoapproxi.implicitHeight
                                    width: textxi_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 1
                            delegate: TextField {
                                id:textyi_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text:model.display
                                padding: 9
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                onEditingFinished: {
                                    model.display = text
                                    tabviewxiyidata_polynoapproxi.savexiyitableModel1data_polynoapproxi()
                                }
                                Rectangle {
                                    anchors.fill: parent
                                    height: textyi_polynoapproxi.implicitHeight
                                    width: textyi_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 2
                            delegate: TextField {
                                id:textdfxi1_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                Rectangle {
                                    anchors.fill: parent
                                    height: textdfxi1_polynoapproxi.implicitHeight
                                    width: textdfxi1_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 3
                            delegate: TextField {
                                id:textdfxi2_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                Rectangle {
                                    anchors.fill: parent
                                    height: textdfxi2_polynoapproxi.implicitHeight
                                    width: textdfxi2_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 4
                            delegate: TextField {
                                id:textdfxi3_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                Rectangle {
                                    anchors.fill: parent
                                    height: textdfxi3_polynoapproxi.implicitHeight
                                    width: textdfxi3_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 5
                            delegate: TextField {
                                id:textdfxi4_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                Rectangle {
                                    anchors.fill: parent
                                    height: textdfxi4_polynoapproxi.implicitHeight
                                    width: textdfxi4_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 6
                            delegate: TextField {
                                id:textdfxi5_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                Rectangle {
                                    anchors.fill: parent
                                    height: textdfxi5_polynoapproxi.implicitHeight
                                    width: textdfxi5_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 7
                            delegate: TextField {
                                id:textdfxi6_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text:model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                Rectangle {
                                    anchors.fill: parent
                                    height: textdfxi6_polynoapproxi.implicitHeight
                                    width: textdfxi6_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 8
                            delegate: TextField {
                                id:textdfxi7_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                Rectangle {
                                    anchors.fill: parent
                                    height: textdfxi7_polynoapproxi.implicitHeight
                                    width: textdfxi7_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 9
                            delegate: TextField {
                                id:textdfxi8_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                Rectangle {
                                    anchors.fill: parent
                                    height: textdfxi8_polynoapproxi.implicitHeight
                                    width: textdfxi8_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
                                }
                            }
                        }
                        DelegateChoice {
                            column: 10
                            delegate: TextField {
                                id:textdfxi9_polynoapproxi
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                                inputMethodHints: Qt.ImhDigitsOnly
                                text: model.display
                                padding: 9
                                readOnly : true
                                selectByMouse: true
                                renderType: Text.NativeRendering
                                onTextChanged: tabviewxiyidata_polynoapproxi.forceLayout()
                                Rectangle {
                                    anchors.fill: parent
                                    height: textdfxi9_polynoapproxi.implicitHeight
                                    width: textdfxi9_polynoapproxi.implicitWidth
                                    color:"transparent"
                                    z: -1
                                    border.color: "steelblue"
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
                    if (radiobutton1ischecked_polynoapproxi){
                        ///tableModel1data_polynoapproxi.clear()
                        columnWidths=[125,125,0,0,0,0,0,0,0,0,0,0]
                        tabviewxiyidata_polynoapproxi.forceLayout();
                        CalculHaf.hafcalculApproximationPolynomiale_Lagrange(tabArrayxiyi_polynoapproxi, nbrePts_polynoapproxi, 0)
                    }
                    if (radiobutton2ischecked_polynoapproxi){
                        tableModel1data_polynoapproxi.clear()
                        CalculHaf.hafcalculApproximationPolynomiale_Newton(tabArrayxiyi_polynoapproxi, nbrePts_polynoapproxi, 1)
                    }

                }
            }

            TextField {
                id:textAffichageResultats_polynoapproxi
                width: parent.width
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                padding: 9
                wrapMode: Text.Wrap
                readOnly : true
                selectByMouse: true
                renderType: Text.NativeRendering
                placeholderText: qsTr("Results")
            }
        }
    }

    Component.onCompleted: {
        radiobuttonMetho1_polynoapproxi.checked=true
        configNbrepts()
        loadtableModel1data_polynoapproxi()
    }
}
