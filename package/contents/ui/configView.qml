import QtQuick 2.0
import QtQuick.Controls 2.3 as QtControls
import org.kde.kirigami 2.5 as Kirigami

Item {
    id: pageview
    width: childrenRect.width
    height: childrenRect.height

    property alias cfg_showtleft: showtleft.checked
    property alias cfg_showpbar: showpbar.checked
    property alias cfg_panelwidth: panelwidth.value


    Kirigami.FormLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        QtControls.CheckBox {
            id: showtleft
            Kirigami.FormData.label: i18n("Show time left instead of total:")
        }
        QtControls.CheckBox {
            id: showpbar
            Kirigami.FormData.label: i18n("Show progress bar:")
        }
        QtControls.SpinBox {
            id: panelwidth
            editable: true
            from: 100
            to: 1000
            Kirigami.FormData.label: i18n("Widget width (panel):")
        }
    }
}
