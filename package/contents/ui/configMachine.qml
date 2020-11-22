import QtQuick 2.0
import QtQuick.Controls 2.3 as QtControls
import org.kde.kirigami 2.5 as Kirigami

Item {
    id: pagemach
    width: childrenRect.width
    height: childrenRect.height

        property alias cfg_tools: tools.value
        property alias cfg_isheatbed: isheatbed.checked
        property alias cfg_ischamber: ischamber.checked


    Kirigami.FormLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        QtControls.SpinBox  {
            id: tools
            editable: true
            from: 1
            to: 4
            Kirigami.FormData.label: i18n("Number of hotends:")
        }
        QtControls.CheckBox {
            id: isheatbed
            Kirigami.FormData.label: i18n("Heatbed:")
        }
        QtControls.CheckBox {
            id: ischamber
            Kirigami.FormData.label: i18n("Heated chamber:")
        }
    }
}
