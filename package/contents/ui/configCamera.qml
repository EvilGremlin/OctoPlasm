import QtQuick 2.0
import QtQuick.Controls 2.3 as QtControls
import org.kde.kirigami 2.5 as Kirigami

Item {
    id: pagecam
    width: childrenRect.width
    height: childrenRect.height

    property alias cfg_iscamera: iscamera.checked
    property alias cfg_cameraurl: cameraurl.text
    property alias cfg_fps: fps.value

    Kirigami.FormLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        QtControls.CheckBox {
            id: iscamera
            Kirigami.FormData.label: i18n("Enable camera view:")
        }
        QtControls.TextField {
            id: cameraurl
            Kirigami.FormData.label: i18n("Camera snapshot URL:")
        }
        QtControls.SpinBox {
            id: fps
            editable: true
            from: 1
            to: 60
            Kirigami.FormData.label: i18n("Refresh interval, seconds:")
        }
    }
}
