import QtQuick
import QtQuick.Controls
import QtCore
import QtQuick.Controls.Material 2.12
import Qt.labs.qmlmodels 1.0
import QtGraphs
import QtQuick.Layouts

Dialog {
    id: plotfx_Dialog1
    title: "Plot y=f(x)"
    anchors.centerIn: Overlay.overlay
    width:app.width
    height: app.height/5*4.9
    Material.theme: themeofapp==="Dark"? Material.Dark:Material.Light

    property string colorfx_plot:  Material.background

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: app.width
        contentHeight: column.height+50
        Column {
            width: app.width-150
            Rectangle {
                width: app.width-25
                height: app.height*1.5
                color: Material.background
                Material.theme: themeofapp==="Dark"? Material.Dark:Material.Light
                Connections {
                    target: CalculHaf
                    function onRequestDialog_plot(title,error){
                        dialogMessageErrorFparser.title=title
                        textfirstuseofappdialog_tp.text=error
                        dialogMessageErrorFparser.open()
                    }
                    function onRequestCleartable_plot(){
                        tableModel1_plot.clear()
                    }
                    function onRequestXY_plot(xi,yi,dx){
                        tableModel1_plot.appendRow({xi:xi,yi:yi})
                        textdx_plot.text=dx
                    }
                }
                Dialog {
                    id: dialogMessageErrorFparser
                    title: "Basic Numerical Methods ("+appVer+")"
                    anchors.centerIn: Overlay.overlay
                    width: parent.width
                    Material.theme: themeofapp==="Dark"? Material.Dark:Material.Light
                    Text {
                        id:textfirstuseofappdialog_tp
                        width: parent.width
                        text: "Error"
                        wrapMode: Text.Wrap
                        font.bold : true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: Material.foreground
                    }
                    standardButtons: Dialog.Ok
                    onAccepted: {
                        close()
                    }
                }

                ScrollView {
                    anchors.fill: parent
                    clip: true
                    contentWidth: app.width
                    contentHeight: column.height+50
                    Column {
                        id:column
                        width: app.width
                        anchors.margins: 10
                        spacing: 10
                        Row {
                            width: app.width
                            spacing: 0
                            ToolSeparator {
                                height: 25
                                width: (app.width-label1_Calcul_tp6.width)/2-25
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
                                width: (app.width-label1_Calcul_tp6.width)/2-25
                                orientation: Qt.Horizontal
                            }
                        }
                        Column {
                            id:rowgroupbutton1_inteqt
                            width: app.width-5
                            anchors.margins: 10
                            spacing: 10
                        }
                        TextField {
                            id:textfx_plot
                            width: app.width-50
                            placeholderText: qsTr("y=f(x)")
                            text: fx_plot
                            Material.theme: themeofapp==="Dark"? Material.Dark:Material.Light
                            color: colorfx_plot=="white"? themeofapp==="Dark"? "white":"black" :"red"
                            onTextChanged: {if (textfx_plot.text==="nan" || textfx_plot.text==="NaN") textfx_plot.text=fx_plot ;
                                fx_plot=textfx_plot.text;
                                colorfx_plot=CalculHaf.textChangedinfx_plot(fx_plot)
                            }
                        }
                        Row{
                            width:app.width-61
                            spacing: 3
                            TextField {
                                id:texta_plot
                                width: parent.width/4
                                placeholderText: qsTr("a")
                                text: settings.a_plot
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (texta_plot.text==="nan" || texta_plot.text==="NaN") texta_plot.text=a_plot ;
                                    a_plot=texta_plot.text;
                                    dx_plot=(b_plot-a_plot)/(nbrePts_plot-1);
                                    textdx_plot.text=dx_plot;
                                }
                            }
                            TextField {
                                id:textb_plot
                                width: parent.width/4
                                placeholderText: qsTr("b")
                                text: settings.b_plot
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textb_plot.text==="nan" || textb_plot.text==="NaN") textb_plot.text=b_plot ;
                                    b_plot=textb_plot.text;
                                    dx_plot=(b_plot-a_plot)/(nbrePts_plot-1);
                                    textdx_plot.text=dx_plot;
                                }
                            }
                            TextField {
                                id:textdx_plot
                                width: parent.width/4
                                placeholderText: qsTr("dx")
                                text: settings.dx_plot
                                readOnly : true
                                selectByMouse: true
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textdx_plot.text==="nan" || textdx_plot.text==="NaN") textdx_plot.text=dx_plot ;
                                    dx_plot=textdx_plot.text;
                                }
                            }
                            TextField {
                                id:textNbrePts_plot
                                width: parent.width/4
                                placeholderText: qsTr("Number of points")
                                text: settings.nbrePts_plot
                                inputMethodHints: Qt.ImhDigitsOnly
                                onTextChanged: {if (textNbrePts_plot.text==="nan" || textNbrePts_plot.text==="NaN") textNbrePts_plot.text=nbrePts_plot ;
                                    nbrePts_plot=textNbrePts_plot.text;
                                    dx_plot=(b_plot-a_plot)/(nbrePts_plot-1);
                                    textdx_plot.text=dx_plot;
                                }
                            }
                        }
                        Row {
                            width: app.width-50
                            spacing: 0
                            ToolSeparator {
                                height: 25
                                width: (parent.width-label3_plot.width)/2
                                orientation: Qt.Horizontal
                            }
                            Label {
                                id:label3_plot
                                width: label3_plot.text.width
                                text: "Calcul"
                                anchors.fill: parent.center
                            }
                            ToolSeparator {
                                height: 25
                                width: (parent.width-label3_plot.width)/2
                                orientation: Qt.Horizontal
                            }
                        }
                        Button {
                            width: app.width-55
                            text: "Plot y=f(x)"
                            onClicked: {
                                CalculHaf.hafplot(fx_plot,a_plot,b_plot,nbrePts_plot,3)
                                tabbar2_plot.currentIndex=0;
                                tabbar2_plot.currentIndex=1;
                            }
                        }

                        TabBar {
                            id: tabbar2_plot
                            width: app.width-55
                            TabButton {
                                text: qsTr("Table")
                                width: implicitWidth
                            }
                            TabButton {
                                text: qsTr("Graph")
                                width: implicitWidth
                            }
                            onCurrentIndexChanged: tableModel1_plot.updatechart1_plot();
                        }

                        StackLayout {
                            id: view2_plot
                            width: app.width-70
                            currentIndex: tabbar2_plot.currentIndex
                            Rectangle {
                                id:rectabview1_plot
                                width: parent.width-17
                                height: app.width
                                color: Material.background
                                HorizontalHeaderView {
                                    id: horizontalHeader2_plot
                                    anchors.left: tabview1_plot.left
                                    anchors.top: parent.top
                                    syncView: tabview1_plot
                                    clip: true
                                    model: ["x(i)" , "y(i)"]
                                }
                                VerticalHeaderView {
                                    id: verticalHeader2_plot
                                    anchors.top: tabview1_plot.top
                                    anchors.left: parent.left
                                    syncView: tabview1_plot
                                    clip: true
                                }
                                TableView {
                                    id:tabview1_plot
                                    anchors.left: verticalHeader2_plot.right
                                    anchors.top: horizontalHeader2_plot.bottom
                                    anchors.right: parent.right
                                    anchors.bottom: parent.bottom
                                    clip: true
                                    columnSpacing: 1
                                    rowSpacing: 1
                                    ScrollBar.vertical: ScrollBar {
                                        id: tableVerticalBar_plotfx;
                                        active:tabview1_plot.implicitHeight>rectabview1_plot.implicitHeight?
                                                   policy:ScrollBar.AlwaysOn
                                    }
                                    boundsBehavior: Flickable.StopAtBounds
                                    model: TableModel {
                                        id:tableModel1_plot
                                        TableModelColumn { display: "xi" }
                                        TableModelColumn { display: "yi" }
                                        function updatechart1_plot()
                                        {
                                            myChart_plot.axisX.zoom = 1
                                            myChart_plot.axisY.zoom = 1

                                            myChart_plot.axisX.pan=0
                                            myChart_plot.axisY.pan=0

                                            scatterSerie1_plot.clear()
                                            scatterSerie2_plot.clear()
                                            ///-------------------------
                                            xitableModel1_plot=tableModel1_plot.rows[0].xi
                                            yitableModel1_plot=tableModel1_plot.rows[1].yi
                                            ///----------------
                                            /////myChart_plot.removeAllSeries();
                                            /////var line = myChart_plot.createSeries(GraphsView.SeriesTypeLine, "y=f(x)", axisX_plot, axisY_plot);
                                            ////var line0 = myChart_plot.createSeries(GraphsView.SeriesTypeLine, "y=0", axisX_plot, axisY_plot);

                                            /////line.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
                                            /////line.hovered.connect(function(point, state){ console.log(point); }); // connect onHovered signal to a function

                                            var maxxi_plot=parseFloat(tableModel1_plot.rows[0].xi);
                                            var maxyi_plot=parseFloat(tableModel1_plot.rows[0].yi);
                                            var minixi_plot=parseFloat(tableModel1_plot.rows[0].xi);
                                            var miniyi_plot=parseFloat(tableModel1_plot.rows[0].yi);
                                            for (var i = 0; i < tableModel1_plot.rowCount; i++)  {
                                                if (tableModel1_plot.rows[i].xi > maxxi_plot)
                                                    maxxi_plot=parseFloat(tableModel1_plot.rows[i].xi) ;
                                                if (tableModel1_plot.rows[i].yi > maxyi_plot)
                                                    maxyi_plot=parseFloat(tableModel1_plot.rows[i].yi) ;
                                                if (tableModel1_plot.rows[i].xi < minixi_plot)
                                                    minixi_plot=parseFloat(tableModel1_plot.rows[i].xi) ;
                                                if (tableModel1_plot.rows[i].yi < miniyi_plot)
                                                    miniyi_plot=parseFloat(tableModel1_plot.rows[i].yi) ;
                                            }
                                            for (i = 0; i < tableModel1_plot.rowCount; i++)  {
                                                if (tableModel1_plot.rows[i].xi!==0
                                                        && tableModel1_plot.rows[i].yi!==""
                                                        )
                                                    scatterSerie1_plot.append(tableModel1_plot.rows[i].xi,tableModel1_plot.rows[i].yi)
                                                    /////lineSeries1.append(tableModel1_plot.rows[i].xi,tableModel1_plot.rows[i].yi)
                                                /////line0.append(tableModel1_plot.rows[i].xi,0)
                                                scatterSerie2_plot.append(tableModel1_plot.rows[i].xi,0)
                                            }

                                            axisX_plot.min = Math.floor(minixi_plot-Math.abs(0.1*minixi_plot));
                                            axisX_plot.max = Math.ceil(maxxi_plot+Math.abs(0.1*maxxi_plot));
                                            axisY_plot.max = Math.max(Math.ceil(maxyi_plot+Math.abs(0.1*maxyi_plot)),axisY_plot.max*0.1);
                                            axisY_plot.min = Math.min(Math.floor(miniyi_plot-Math.abs(0.1*miniyi_plot)),-axisY_plot.max*0.1);
                                            ///
                                        }
                                    }
                                    delegate: DelegateChooser {
                                        DelegateChoice {
                                            column: 0
                                            delegate: TextField {
                                                id:textxi_plot
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                inputMethodHints: Qt.ImhDigitsOnly
                                                text: model.display
                                                padding: 9
                                                readOnly : true
                                                selectByMouse: true
                                                renderType: Text.NativeRendering
                                                ///color: Material.foregroundFieldHeight
                                                onTextChanged: tabview1_plot.forceLayout()
                                                Rectangle {
                                                    anchors.fill: parent
                                                    color: Material.background
                                                    height: textxi_plot.implicitHeight
                                                    width: textxi_plot.implicitWidth
                                                    z: -1
                                                    border.color: "steelblue"
                                                }
                                            }
                                        }
                                        DelegateChoice {
                                            column: 1
                                            delegate: TextField {
                                                id:textyi_plot
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignHCenter
                                                inputMethodHints: Qt.ImhDigitsOnly
                                                text: model.display
                                                padding: 9
                                                readOnly : true
                                                selectByMouse: true
                                                renderType: Text.NativeRendering
                                                ///color: Material.theme
                                                onTextChanged: tabview1_plot.forceLayout()
                                                Rectangle {
                                                    anchors.fill: parent
                                                    color: Material.background
                                                    height: textyi_plot.implicitHeight
                                                    width: textyi_plot.implicitWidth
                                                    z: -1
                                                    border.color: "steelblue"
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Rectangle {
                                width: parent.width-rectabview1_plot.width
                                height: rectabview1_plot.height
                                color: Material.background

                                GraphsView {
                                    id: myChart_plot
                                    anchors.fill: parent
                                    antialiasing: true
                                    clip: true
                                    panStyle: GraphsView.PanStyle.Drag
                                    zoomStyle: GraphsView.ZoomStyle.Center
                                    LineSeries{
                                        id:scatterSerie1_plot
                                        axisX: axisX_plot
                                        axisY: axisY_plot
                                        name: "y=f(x)" ///"Scatter"
                                    }
                                    LineSeries{
                                        id:scatterSerie2_plot
                                        axisX: axisX_plot
                                        axisY: axisY_plot
                                        color: "red"
                                        name: "y=0" ///"Scatter"

                                    }
                                    axisX:ValueAxis {
                                        id: axisX_plot
                                        gridVisible: true
                                        titleText:  "x"
                                        /////tickInterval: 2
                                        onVisualMaxChanged: {
                                                axisX_plot.tickInterval=(axisX_plot.visualMax-axisX_plot.visualMin)/5
                                        }
                                        // onVisualMinChanged: {
                                        //         axisX_plot.tickInterval=axisX_plot.tickInterval/2
                                        // }
                                    }
                                    axisY:ValueAxis {
                                        id: axisY_plot
                                        gridVisible: true
                                        titleText: "f(x)"
                                        subGridVisible: true
                                    }
                                    theme: GraphsTheme {
                                        colorScheme:  themeofapp==="Dark"? GraphsTheme.ColorScheme.Dark :GraphsTheme.ColorScheme.Light /////GraphsTheme.ColorScheme.Dark
                                        theme:  themeofapp==="Dark"? GraphsTheme.Theme.BlueSeries:GraphsTheme.Theme.BlueSeries /////GraphsTheme.Theme.QtGreen
                                        plotAreaBackgroundVisible: false
                                        backgroundVisible: false
                                        labelTextColor: "#AEAEAE"
                                        labelBackgroundVisible: true
                                        grid.mainColor: "#AEAEAE"
                                        grid.mainWidth: 1
                                    }
                                }
                            }
                        }
                    }
                }

                Component.onCompleted: {
                    tableModel1_plot.clear();
                }
            }
        }

    }
    standardButtons: Dialog.Ok
    onAccepted: {
        close()
    }
}
