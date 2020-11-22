import QtQuick 2.0
import QtQuick.Controls 2.3 as QtControls
import org.kde.kirigami 2.5 as Kirigami

Item {
    id: pagecon
    width: childrenRect.width
    height: childrenRect.height

    property alias cfg_hostname: hostname.text
    property alias cfg_port: port.text
    property alias cfg_key: key.text
    property alias cfg_pollintervalb: pollintervalb.value
    property alias cfg_pollintervalf: pollintervalf.value

    Kirigami.FormLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        QtControls.TextField {
            id: hostname
            Kirigami.FormData.label: i18n("Hostname/IP:")
        }
        QtControls.TextField {
            id: port
            Kirigami.FormData.label: i18n("Port:")
        }
        QtControls.TextField {
            id: key
            Kirigami.FormData.label: i18n("API key:")
        }
        QtControls.SpinBox {
            id: pollintervalb
            editable: true
            from: 1
            to: 600
            Kirigami.FormData.label: i18n("Data poll interval (panel):")
        }
        QtControls.SpinBox {
            id: pollintervalf
            editable: true
            from: 1
            to: 600
            Kirigami.FormData.label: i18n("Data poll interval (widget):")
        }        
    }
}
