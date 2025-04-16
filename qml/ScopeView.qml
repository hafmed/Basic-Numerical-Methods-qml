import QtQuick
import QtQuick.Controls
import QtCore
import QtQuick.Controls.Material 2.12
import QtCharts 2.15

import QtQuick.Layouts


SwipeView {
    id: swipeView
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    currentIndex: tabBar.currentIndex

    onCurrentIndexChanged:{
        pathView.currentIndex=swipeView.currentIndex
        tabBarcurrentIndex=swipeView.currentIndex
        savesettings()
    }

    height: app.height * 0.25
    width: app.width * 0.25

    Screen_tp1{
    }
    Screen_tp2{
    }
    Screen_tp3{
    }
    Screen_tp4{
    }
    Screen_tp5{
    }
    Screen_tp6{
    }

}
