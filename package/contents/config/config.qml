import QtQuick 2.0
import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: i18n("Connection")
        icon: "network-connect"
        source: "configConnect.qml"
    }
    ConfigCategory {
        name: i18n("Machine")
        icon: "settings-configure"
        source: "configMachine.qml"
    }
    ConfigCategory {
        name: i18n("Camera")
        icon: "camera-video"
        source: "configCamera.qml"
    }
    ConfigCategory {
        name: i18n("View")
        icon: "view-visible"
        source: "configView.qml"
    }  
}
