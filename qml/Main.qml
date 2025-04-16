import QtQuick
import QtQuick.Controls
import QtCore
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts
///------------------HAF 27-3-2025-----------------------
/// use parseFloat if use .toFixed i.e:
/// parseFloat(model.display).toFixed(nbreDecim_inteqt)
/// don't use /usr/lib/jvm/java-24-openjdk but use
/// https://adoptium.net/temurin/releases/?package=jdk&version=17
/// to delete settings
/// /home/hafmed/.config/softhafdz/
///------------------------------------------------------
Item {
    id: app
    width: 750
    height: 750
    LayoutMirroring.enabled: false
    LayoutMirroring.childrenInherit: false
    Material.theme: Material.Dark
    Material.accent: Material.Purple

    Connections {
        target: Qt.application
        function onActiveChanged() {
            savesettings();
        }
        function onStateChanged() {
            if (settings.firstuseofapp) loaddefaultsettings()
            ///console.log("state application is="+Qt.application.state)
            savesettings();
        }
    }

    Connections {
        target: CalculHaf
        function onRequestDialog(title,error){
            dialogMessageErrorFparserMain.title=title
            textfirstuseofappdialog_tpMain.text=error
            dialogMessageErrorFparserMain.open()
        }
    }
    Dialog {
        id: dialogMessageErrorFparserMain
        title: "Basic Numerical Methods ver "+appVer
        anchors.centerIn: Overlay.overlay
        width: parent.width
        Text {
            id:textfirstuseofappdialog_tpMain
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

    Settings {
        id: settings
        property bool firstuseofapp:true
        property int scopeViewcount
        property int comboxballcurrentIndex_tp1
        ///---nonlineareqt---
        property string fx_nonlineareqt
        property string gxPF_nonlineareqt
        property real x0PF_nonlineareqt
        property string fprimNR_nonlineareqt
        property real x0NR_nonlineareqt

        property real nbreMaxItera_nonlineareqt
        property real nbreDecim_nonlineareqt
        property real eps_nonlineareqt

        property real x0SEC_nonlineareqt
        property real x1SEC_nonlineareqt

        property real aBS_nonlineareqt
        property real bBS_nonlineareqt

        property real aRF_nonlineareqt
        property real bRF_nonlineareqt
        ///-----edoeqt------------------
        property string fxy_edoeqt
        property real a_edoeqt
        property real b_edoeqt
        property real dx_edoeqt
        property real ya_edoeqt

        property real nbrePts_edoeqt
        property real nbreDecim_edoeqt
        ///-----inteqt--------------------
        property string fx_inteqt
        property real a_inteqt
        property real b_inteqt
        property real nbrePtsTab_inteqt
        property real nbrePtsfx_inteqt
        property real dx_inteqt
        property var tabArrayxiyi_inteqt
        ///--------plot---------------
        property string fx_plot
        property real a_plot
        property real b_plot
        property real nbrePts_plot
        property real dx_plot
        ///--------linearsyst--------------
        // property real nbreEqts_linearsyst
        // property real nbrePtsTab_linearsyst
        property real maxiter_linearsyst
        property real tole_linearsyst

        property var tabArrayxiyidatan2_linearsyst
        property var tabArrayxiyidatan3_linearsyst
        property var tabArrayxiyidatan4_linearsyst
        property var tabArrayxiyidatan5_linearsyst

        property real x01_linearsyst
        property real x02_linearsyst
        property real x03_linearsyst
        property real x04_linearsyst
        property real x05_linearsyst
        //-------nonlinearsyst--------------
        property string fxy1_nonlinearsyst
        property string fxy2_nonlinearsyst
        property string gxy1PF_nonlinearsyst
        property string gxy2PF_nonlinearsyst
        property string df1xyNR_nonlinearsyst
        property string df2xyNR_nonlinearsyst
        property real x0PF_nonlinearsyst
        property real y0PF_nonlinearsyst
        property real x0NR_nonlinearsyst
        property real y0NR_nonlinearsyst
        property real nbreMaxItera_nonlinearsyst
        property real nbreDecim_nonlinearsyst
        property real eps_nonlinearsyst
        ///------polynoapproxi----------------
        property real nbrePts_polynoapproxi
        property var tabArrayxiyi_polynoapproxi

        property int configNbreptscurrentIndex



    }
    property string appVer:"1.5.7"
    ///property bool firstuseofapp
    property int scopeViewcount:scopeView.count
    property int tabBarcurrentIndex: 0
    property int comboxballcurrentIndex_tp1: 1

    ///---nonlineareqt---
    property int methodeindex_nonlineareqt:0
    property string fx_nonlineareqt
    property string gxPF_nonlineareqt
    property real x0PF_nonlineareqt
    property string fprimNR_nonlineareqt
    property real x0NR_nonlineareqt

    property real nbreMaxItera_nonlineareqt
    property real nbreDecim_nonlineareqt
    property real eps_nonlineareqt

    property bool radiobutton1ischecked_nonlineareqt
    property bool radiobutton2ischecked_nonlineareqt
    property bool radiobutton3ischecked_nonlineareqt
    property bool radiobutton4ischecked_nonlineareqt
    property bool radiobutton5ischecked_nonlineareqt

    property real x0SEC_nonlineareqt
    property real x1SEC_nonlineareqt

    property real aBS_nonlineareqt
    property real bBS_nonlineareqt

    property real aRF_nonlineareqt
    property real bRF_nonlineareqt
    ///-----edoeqt------------------
    property int stackLayoutIndex_edoeqt:0
    property int methodeindex_edoeqt:0
    property bool radiobutton1ischecked_edoeqt
    property bool radiobutton2ischecked_edoeqt
    property bool radiobutton3ischecked_edoeqt

    property string fxy_edoeqt
    property real a_edoeqt
    property real b_edoeqt
    property real dx_edoeqt
    property real ya_edoeqt

    property real nbrePts_edoeqt
    property real nbreDecim_edoeqt
    ///--------inteqt---------------
    property real nbreDecim_inteqt: 5
    property int methodeindex_inteqt:0
    property bool radiobutton1ischecked_inteqt
    property bool radiobutton2ischecked_inteqt
    property bool radiobutton3ischecked_inteqt
    property bool checkBoxremplirtabischecked_inteqt

    property bool radiobuttontableischecked_inteqt
    property bool radiobuttonfxischecked_inteqt

    property string fx_inteqt
    property real a_inteqt
    property real b_inteqt
    property real nbrePtsTab_inteqt
    property real nbrePtsfx_inteqt
    property real dx_inteqt
    property var tabArrayxiyi_inteqt
    ///--------plot---------------
    property string fx_plot
    property real a_plot
    property real b_plot
    property real nbrePts_plot
    property real dx_plot

    property real xitableModel1_plot
    property real yitableModel1_plot
    ///---linearsyst---
    property int methodeindex_linearsyst:0
    property bool radiobutton1ischecked_linearsyst
    property bool radiobutton2ischecked_linearsyst
    property bool radiobutton3ischecked_linearsyst

    property real nbreEqts_linearsyst
    property real nbrePtsTab_linearsyst
    property real maxiter_linearsyst
    property real tole_linearsyst
    property var tabArrayxiyidatan2_linearsyst
    property var tabArrayxiyidatan3_linearsyst
    property var tabArrayxiyidatan4_linearsyst
    property var tabArrayxiyidatan5_linearsyst

    property int comboxNbreeqtcurrentIndex_linearsyst

    property real x01_linearsyst
    property real x02_linearsyst
    property real x03_linearsyst
    property real x04_linearsyst
    property real x05_linearsyst
    ///---nonlinearsyst----------
    property int methodeindex_nonlinearsyst:0

    property bool radiobutton1ischecked_nonlinearsyst
    property bool radiobutton2ischecked_nonlinearsyst
    property string fxy1_nonlinearsyst
    property string fxy2_nonlinearsyst
    property string gxy1PF_nonlinearsyst
    property string gxy2PF_nonlinearsyst
    property string df1xyNR_nonlinearsyst
    property string df2xyNR_nonlinearsyst
    property real x0PF_nonlinearsyst
    property real y0PF_nonlinearsyst
    property real x0NR_nonlinearsyst
    property real y0NR_nonlinearsyst
    property real nbreMaxItera_nonlinearsyst
    property real nbreDecim_nonlinearsyst
    property real eps_nonlinearsyst
    ///------polynoapproxi----------------
    property int methodeindex_polynoapproxi:0
    property int configNbreptscurrentIndex

    property real nbrePts_polynoapproxi
    property var tabArrayxiyi_polynoapproxi
    property bool radiobutton1ischecked_polynoapproxi
    property bool radiobutton2ischecked_polynoapproxi



    function savesettings() {
        ///settings.firstuseofapp=firstuseofapp
        settings.comboxballcurrentIndex_tp1=comboxballcurrentIndex_tp1
        ///---nonlineareqt---
        settings.fx_nonlineareqt=fx_nonlineareqt
        settings.gxPF_nonlineareqt=gxPF_nonlineareqt
        settings.x0PF_nonlineareqt=x0PF_nonlineareqt

        settings.fprimNR_nonlineareqt=fprimNR_nonlineareqt
        settings.x0NR_nonlineareqt=x0NR_nonlineareqt

        settings.nbreMaxItera_nonlineareqt=nbreMaxItera_nonlineareqt
        settings.nbreDecim_nonlineareqt=nbreDecim_nonlineareqt
        settings.eps_nonlineareqt=eps_nonlineareqt

        settings.x0SEC_nonlineareqt=x0SEC_nonlineareqt
        settings.x1SEC_nonlineareqt=x1SEC_nonlineareqt

        settings.aBS_nonlineareqt=aBS_nonlineareqt
        settings.bBS_nonlineareqt=bBS_nonlineareqt

        settings.aRF_nonlineareqt=aRF_nonlineareqt
        settings.bRF_nonlineareqt=bRF_nonlineareqt
        ///-----edoeqt------------------
        settings.fxy_edoeqt=fxy_edoeqt
        settings.a_edoeqt=a_edoeqt
        settings.b_edoeqt=b_edoeqt
        settings.dx_edoeqt=dx_edoeqt
        settings.ya_edoeqt=ya_edoeqt

        settings.nbrePts_edoeqt=nbrePts_edoeqt
        settings.nbreDecim_edoeqt=nbreDecim_edoeqt
        ///-----inteqt------------------
        settings.fx_inteqt=fx_inteqt
        settings.a_inteqt=a_inteqt
        settings.b_inteqt=b_inteqt
        settings.nbrePtsTab_inteqt=nbrePtsTab_inteqt
        settings.nbrePtsfx_inteqt=nbrePtsfx_inteqt
        settings.dx_inteqt=dx_inteqt
        settings.tabArrayxiyi_inteqt=tabArrayxiyi_inteqt
        ///--------plot---------------
        settings.fx_plot=fx_plot
        settings.a_plot=a_plot
        settings.b_plot=b_plot
        settings.nbrePts_plot=nbrePts_plot
        settings.dx_plot=dx_plot
        ///-----------linearsyst------------
        settings.maxiter_linearsyst=maxiter_linearsyst
        settings.tole_linearsyst=tole_linearsyst
        settings.tabArrayxiyidatan2_linearsyst=tabArrayxiyidatan2_linearsyst
        settings.tabArrayxiyidatan3_linearsyst=tabArrayxiyidatan3_linearsyst
        settings.tabArrayxiyidatan4_linearsyst=tabArrayxiyidatan4_linearsyst
        settings.tabArrayxiyidatan5_linearsyst=tabArrayxiyidatan5_linearsyst

        settings.x01_linearsyst=x01_linearsyst
        settings.x02_linearsyst=x02_linearsyst
        settings.x03_linearsyst=x03_linearsyst
        settings.x04_linearsyst=x04_linearsyst
        settings.x05_linearsyst=x05_linearsyst
        ///-----------linearsyst------------
        settings.fxy1_nonlinearsyst=fxy1_nonlinearsyst
        settings.fxy2_nonlinearsyst=fxy2_nonlinearsyst
        settings.gxy1PF_nonlinearsyst=gxy1PF_nonlinearsyst
        settings.gxy2PF_nonlinearsyst=gxy2PF_nonlinearsyst
        settings.df1xyNR_nonlinearsyst=df1xyNR_nonlinearsyst
        settings.df2xyNR_nonlinearsyst=df2xyNR_nonlinearsyst
        settings.x0PF_nonlinearsyst=x0PF_nonlinearsyst
        settings.y0PF_nonlinearsyst=y0PF_nonlinearsyst
        settings.x0NR_nonlinearsyst=x0NR_nonlinearsyst
        settings.y0NR_nonlinearsyst=y0NR_nonlinearsyst
        settings.nbreMaxItera_nonlinearsyst=nbreMaxItera_nonlinearsyst
        settings.nbreDecim_nonlinearsyst=nbreDecim_nonlinearsyst
        settings.eps_nonlinearsyst=eps_nonlinearsyst
        ///------polynoapproxi----------------
        settings.configNbreptscurrentIndex=configNbreptscurrentIndex
        settings.nbrePts_polynoapproxi=nbrePts_polynoapproxi
        settings.tabArrayxiyi_polynoapproxi=tabArrayxiyi_polynoapproxi

    }
    function loadsettings() {
        ///firstuseofapp=settings.firstuseofapp
        comboxballcurrentIndex_tp1=settings.comboxballcurrentIndex_tp1

        ///---nonlineareqt---
        fx_nonlineareqt=settings.fx_nonlineareqt
        gxPF_nonlineareqt=settings.gxPF_nonlineareqt
        x0PF_nonlineareqt=settings.x0PF_nonlineareqt

        fprimNR_nonlineareqt=settings.fprimNR_nonlineareqt
        x0NR_nonlineareqt=settings.x0NR_nonlineareqt

        nbreMaxItera_nonlineareqt=settings.nbreMaxItera_nonlineareqt
        nbreDecim_nonlineareqt=settings.nbreDecim_nonlineareqt
        eps_nonlineareqt=settings.eps_nonlineareqt

        x0SEC_nonlineareqt=settings.x0SEC_nonlineareqt
        x1SEC_nonlineareqt=settings.x1SEC_nonlineareqt

        aBS_nonlineareqt=settings.aBS_nonlineareqt
        bBS_nonlineareqt=settings.bBS_nonlineareqt

        aRF_nonlineareqt=settings.aRF_nonlineareqt
        bRF_nonlineareqt=settings.bRF_nonlineareqt
        ///-----edoeqt------------------
        fxy_edoeqt=settings.fxy_edoeqt
        a_edoeqt=settings.a_edoeqt
        b_edoeqt=settings.b_edoeqt
        dx_edoeqt=settings.dx_edoeqt
        ya_edoeqt=settings.ya_edoeqt

        nbrePts_edoeqt=settings.nbrePts_edoeqt
        nbreDecim_edoeqt=settings.nbreDecim_edoeqt
        ///-----inteqt------------------
        fx_inteqt=settings.fx_inteqt
        a_inteqt=settings.a_inteqt
        b_inteqt=settings.b_inteqt
        nbrePtsTab_inteqt=settings.nbrePtsTab_inteqt
        nbrePtsfx_inteqt=settings.nbrePtsfx_inteqt
        dx_inteqt=settings.dx_inteqt
        tabArrayxiyi_inteqt=settings.tabArrayxiyi_inteqt
        ///--------plot---------------
        fx_plot=settings.fx_plot
        a_plot=settings.a_plot
        b_plot=settings.b_plot
        nbrePts_plot=settings.nbrePts_plot
        dx_plot=settings.dx_plot
        ///-----------linearsyst------------
        maxiter_linearsyst=settings.maxiter_linearsyst
        tole_linearsyst=settings.tole_linearsyst
        tabArrayxiyidatan2_linearsyst=settings.tabArrayxiyidatan2_linearsyst
        tabArrayxiyidatan3_linearsyst=settings.tabArrayxiyidatan3_linearsyst
        tabArrayxiyidatan4_linearsyst=settings.tabArrayxiyidatan4_linearsyst
        tabArrayxiyidatan5_linearsyst=settings.tabArrayxiyidatan5_linearsyst

        x01_linearsyst=settings.x01_linearsyst
        x02_linearsyst=settings.x02_linearsyst
        x03_linearsyst=settings.x03_linearsyst
        x04_linearsyst=settings.x04_linearsyst
        x05_linearsyst=settings.x05_linearsyst
        ///-----------linearsyst------------
        fxy1_nonlinearsyst=settings.fxy1_nonlinearsyst
        fxy2_nonlinearsyst=settings.fxy2_nonlinearsyst
        gxy1PF_nonlinearsyst=settings.gxy1PF_nonlinearsyst
        gxy2PF_nonlinearsyst=settings.gxy2PF_nonlinearsyst
        df1xyNR_nonlinearsyst=settings.df1xyNR_nonlinearsyst
        df2xyNR_nonlinearsyst=settings.df2xyNR_nonlinearsyst
        x0PF_nonlinearsyst=settings.x0PF_nonlinearsyst
        y0PF_nonlinearsyst=settings.y0PF_nonlinearsyst
        x0NR_nonlinearsyst=settings.x0NR_nonlinearsyst
        y0NR_nonlinearsyst=settings.y0NR_nonlinearsyst
        nbreMaxItera_nonlinearsyst=settings.nbreMaxItera_nonlinearsyst
        nbreDecim_nonlinearsyst=settings.nbreDecim_nonlinearsyst
        eps_nonlinearsyst=settings.eps_nonlinearsyst
        ///------polynoapproxi----------------
        configNbreptscurrentIndex=settings.configNbreptscurrentIndex
        nbrePts_polynoapproxi=settings.nbrePts_polynoapproxi
        tabArrayxiyi_polynoapproxi=settings.tabArrayxiyi_polynoapproxi

    }
    function loaddefaultsettings() {
        /// firstuseofapp=true
        tabBarcurrentIndex= 0
        ///---nonlineareqt---
        fx_nonlineareqt="x^2+1+log(x+2)-20*x"
        gxPF_nonlineareqt="sqrt(-1-log(x+2)+20*x)"
        x0PF_nonlineareqt=15
        fprimNR_nonlineareqt="2*x+1/(x+2)-20"
        x0NR_nonlineareqt=15
        nbreMaxItera_nonlineareqt=150
        nbreDecim_nonlineareqt=9
        eps_nonlineareqt=1e-9
        x0SEC_nonlineareqt=15
        x1SEC_nonlineareqt=21
        aBS_nonlineareqt=15
        bBS_nonlineareqt=21
        aRF_nonlineareqt=15
        bRF_nonlineareqt=21
        ///-----edoeqt------------------
        fxy_edoeqt="-y+x+1"
        a_edoeqt=0
        b_edoeqt=1
        dx_edoeqt=0.1
        ya_edoeqt=1
        nbrePts_edoeqt=11
        nbreDecim_edoeqt=9
        ///-----inteqt------------------
        fx_inteqt="x^2+1"
        a_inteqt=0
        b_inteqt=1
        nbrePtsTab_inteqt=7
        nbrePtsfx_inteqt=7
        dx_inteqt=0.166667
        tabArrayxiyi_inteqt= [[0, 10e3, 0],[0.4, 10.1e3, 0],[0.8, 10.2e3, 0],[1.2, 10.6e3, 0],[1.6, 11.3e3, 0],[2, 12.3e3, 0],[2.4, 12.7e3, 0] ]
        ///--------plot---------------
        fx_plot="x^2+1+log(x+2)-20*x"
        a_plot=15
        b_plot=25
        nbrePts_plot=101
        dx_plot=0.1
        ///------------linearsyst----------------
        maxiter_linearsyst=100
        tole_linearsyst=1e-7
        tabArrayxiyidatan2_linearsyst= [[3, 1, -1],[1, 5, 2]]
        tabArrayxiyidatan3_linearsyst= [[3, 1, -1, 2],[1, 5, 2, 17],[2, -1, -6, -18]]
        tabArrayxiyidatan4_linearsyst= [[1, 0,1, 2,6],[0,1, -2,0,-3],[1,2, -1,0,-2],[2,1, 3,-2,0]]
        tabArrayxiyidatan5_linearsyst= [[2,1, 1,1, 1,4],[1,2,1, 1,1, 5],[1,1,2, 1,1,6],[1,1,1, 2,1,7],[1,1,1, 1,2,8]]

        x01_linearsyst=0
        x02_linearsyst=0
        x03_linearsyst=0
        x04_linearsyst=0
        x05_linearsyst=0
        ///-----------linearsyst------------
        fxy1_nonlinearsyst="-5*x+2*sin(x)+2*cos(y)"
        fxy2_nonlinearsyst="2*cos(x)+2*sin(y)-5*y"
        gxy1PF_nonlinearsyst="(2*sin(x)+2*cos(y))/5"
        gxy2PF_nonlinearsyst="(2*cos(x)+2*sin(y))/5"
        df1xyNR_nonlinearsyst="-5+2*cos(x)"
        df2xyNR_nonlinearsyst="2*cos(y)-5"
        x0PF_nonlinearsyst=0
        y0PF_nonlinearsyst=0
        x0NR_nonlinearsyst=0
        y0NR_nonlinearsyst=0

        nbreMaxItera_nonlinearsyst=150
        nbreDecim_nonlinearsyst=9
        eps_nonlinearsyst=1e-5
        ///------polynoapproxi----------------
        configNbreptscurrentIndex=2
        nbrePts_polynoapproxi=4
        tabArrayxiyi_polynoapproxi=[[1, 0], [2, 7],[3, 26],[4, 63],[5, 124], [6, 215],[7, 342],[8, 511],[9, 728],[10, 999]]

    }

    ToolBar {
        id: toolBar
        width: parent.width
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("⋮")///+settings.firstuseofapp
                onClicked: contextMenu.open()
            }
            ToolButton {
                text: qsTr("Exit")
                onClicked: {Qt.callLater(Qt.quit) ;savesettings()}
            }
            Label {
                text: qsTr("Basic Numerical Methods")
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
        }
    }

    Menu {
        id: contextMenu
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        MenuItem {
            text: qsTr("About")
            onTriggered: aboutappDialog.open()
        }
        MenuSeparator {}
        MenuItem {
            property string linkhelp: "https://sites.google.com/site/courshaf";
            text: qsTr("Help")
            onTriggered:{
                Qt.openUrlExternally(linkhelp);
            }
        }
        MenuSeparator {}
        MenuItem {
            text: qsTr("Load default settings")
            onTriggered: loaddefaultsettingsDialog.open()
        }
    }

    Dialog {
        id: aboutappDialog
        title: "Basic Numerical Methods ver "+appVer
        anchors.centerIn: Overlay.overlay
        Text {
            id:textaboutdialog_tp
            width: parent.width
            text: "M. HAFIANE Mohamed; e-mail for feedback: <a href=\"mailto:thakir.dz@gmail.com?subject=About%20Basic%20Numerical%20Methods%20(Ver: "+appVer+")%20 On " +Qt.platform.os+" \">thakir.dz@gmail.com</a>"
            wrapMode: Text.Wrap
            font.bold : true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            onLinkActivated: function (link) { return Qt.openUrlExternally(link)
            }
        }
        standardButtons: Dialog.Ok
        onAccepted: close()
    }
    Dialog {
        id: firstuseofappDialog
        title: "Basic Numerical Methods ver "+appVer
        anchors.centerIn: Overlay.overlay
        Text {
            id:textfirstuseofappdialog_tp
            width: parent.width
            text: "Hopefully this application will help you. "+
                  "If you found any bug, please contact me in e-mail: <a href=\"mailto:thakir.dz@gmail.com?subject=About%20Basic%20Numerical%20Methods%20(Ver: "+appVer+")%20 On " +Qt.platform.os+" \">thakir.dz@gmail.com</a>"
            wrapMode: Text.Wrap
            font.bold : true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            /// linkColor: "#ffffff"
            onLinkActivated: function (link) { return Qt.openUrlExternally(link)
            }
        }
        standardButtons: Dialog.Ok
        onAccepted: {
            /// firstuseofapp=false;
            settings.firstuseofapp=false
            savesettings();
            close()
        }
    }
    Connections {
        target: textfirstuseofappdialog_tp
        function onLinkActivated() {
            Qt.openUrlExternally(firstuseofapp)
        }
    }

    Connections {
        target: textaboutdialog_tp
        function onLinkActivated() {
            Qt.openUrlExternally(link)
        }
    }

    Dialog {
        id: loaddefaultsettingsDialog
        title: "Basic Numerical Methods ver "+appVer
        anchors.centerIn: Overlay.overlay
        Text {
            id:textdialog_tp
            width: parent.width
            text:  qsTr("You must close and re-open the application to load default settings")
            wrapMode: Text.Wrap
            font.bold : true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {Qt.callLater(Qt.quit);loaddefaultsettings();close()}
        onRejected: console.log("Cancel clicked")
    }
    ////////////
    Row {
        id:rowtp1
        width: parent.width
        anchors.top: toolBar.bottom
        height: 150
        Rectangle {
            id:rect
            width: parent.width-imagelogouniv_tp1.width
            height: 150
            color:"transparent"
            ListModel {
                id: nameModel
                ListElement { file: "images/fig_Tab1.jpg"
                    name: "Non-linear equation solver"}
                ListElement { file: "images/fig_Tab2.jpg"
                    name: "Ordinary differential equations solver"}
                ListElement { file: "images/fig_Tab3.jpg"
                    name: "Numerical integration solver"}
                ListElement { file: "images/fig_Tab4.jpg"
                    name: "linear system solver"}
                ListElement { file: "images/fig_Tab5.jpg"
                    name: "Non-linear system solver"}
                ListElement { file: "images/fig_Tab6.jpg"
                    name: "Polynomial approximation"}
            }
            //--> slide
            Component {
                id: nameDelegate
                Column {
                    opacity: PathView.opacity
                    z: PathView.z
                    scale: PathView.scale
                    Image { //--> collapse
                        anchors.horizontalCenter: delegateText.horizontalCenter
                        source: model.file; width: 250; height: 250; smooth: true
                        fillMode: Image.PreserveAspectFit
                    }//<-- collapse
                    Text {//--> collapse
                        id: delegateText
                        //     text: model.name; font.pixelSize: 24
                    }//<-- collapse
                }
            }
            //<-- slide
            PathView {
                anchors.fill: parent
                model: nameModel
                delegate: nameDelegate
                focus: true
                id: pathView
                onCurrentIndexChanged: tabBarcurrentIndex=pathView.currentIndex
                path: Path {
                    // Front
                    startX: 250; startY: 90
                    PathAttribute { name: "opacity"; value: 1.0 }
                    PathAttribute { name: "scale"; value: 1.0 }
                    PathAttribute { name: "z"; value: 0 }

                    // Left
                    PathCubic { x: 50; y: 50; control1X: 100; control1Y: 100
                        control2X: 50; control2Y: 75 }
                    PathAttribute { name: "opacity"; value: 0.5 }
                    PathAttribute { name: "scale"; value: 0.5 }
                    PathAttribute { name: "z"; value: -1 }

                    // Top
                    PathCubic { x: 150; y: 20; control1X: 50; control1Y: 35
                        control2X: 100; control2Y: 20 }
                    PathAttribute { name: "opacity"; value: 0.25 }
                    PathAttribute { name: "scale"; value: 0.25 }
                    PathAttribute { name: "z"; value: -2 }

                    // Right
                    PathCubic { x: 350; y: 50; control1X: 200; control1Y: 20
                        control2X: 250; control2Y: 35 }
                    PathAttribute { name: "opacity"; value: 0.5 }
                    PathAttribute { name: "scale"; value: 0.5 }
                    PathAttribute { name: "z"; value: -1 }

                    PathCubic { x: 150; y: 100; control1X: 250; control1Y: 75
                        control2X: 200; control2Y: 100 }
                }
                Keys.onLeftPressed: decrementCurrentIndex()
                Keys.onRightPressed: incrementCurrentIndex()
            }
        }
        Column {
            width: parent.width/4
            height: 750
            Image {
                id: imagelogouniv_tp1
                width: parent.width
                smooth: true
                fillMode: Image.PreserveAspectFit
                source: "images/log_universite_SAIDA.png"
            }
            Text {
                id: delegateText5
                width: parent.width
                text: nameModel.get(tabBarcurrentIndex).name
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "white"
                wrapMode: Text.Wrap
            }
        }
    }
    ScopeView {
        id: scopeView
        anchors.top: rowtp1.bottom
        width: parent.width
        height: app.height
        currentIndex: tabBarcurrentIndex
    }

    Component.onCompleted: {
        if (settings.firstuseofapp || settings.scopeViewcount!==scopeViewcount) {
            // ... first run
            firstuseofappDialog.open()
            settings.firstuseofapp = false
            settings.scopeViewcount=scopeViewcount
            loaddefaultsettings()
        } else {
            // ... not first run
            loadsettings();
        }
        ///scopeView.currentIndex=5; ///temp
    }
    Component.onDestruction: {
        savesettings();
        // firstuseofapp=false;
        // settings.firstuseofapp=firstuseofapp
    }
}
