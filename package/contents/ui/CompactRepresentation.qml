import QtQuick 2.6
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0



Item {
    id: cview
    
    MouseArea {
        onClicked: plasmoid.expanded = !plasmoid.expanded
        anchors.fill: parent
        hoverEnabled: true}
        
    Layout.preferredWidth: main.panelwidth * units.devicePixelRatio
    height: PlasmaCore.Units.iconSizeHints.panel

    Timer { 
        running: true
        triggeredOnStart: true
        interval: 3000
                onTriggered: { request("job", callback);
                 request("printer", callback);
                 if (main.chamber) request("printer/chamber", callback);}}



        ColumnLayout{
            spacing: units.smallSpacing
            RowLayout{
                Layout.fillWidth: true
            PlasmaComponents.Label {
                text: "Status: "+ main.status
                font.weight: Font.Bold
                wrapMode: Text.NoWrap}
            PlasmaComponents.Label {
                text: main.completion +"%"
                font.weight: Font.Bold
                wrapMode: Text.NoWrap}}
            RowLayout{
                Layout.fillWidth: true
            PlasmaComponents.Label {
                text: "T0: "+main.temp0a+"/"+main.temp0t
                font.weight: Font.Bold}
            PlasmaComponents.Label {
                text: "T1: "+main.temp1a+"/"+main.temp1t
                font.weight: Font.Bold
                visible: main.hotends>1}
            PlasmaComponents.Label {
                text: "T2: "+main.temp2a+"/"+main.temp2t
                font.weight: Font.Bold
                visible: main.hotends>2                }
            PlasmaComponents.Label {
                text: "T3: "+main.temp3a+"/"+main.temp3t
                font.weight: Font.Bold
                visible: main.hotends>3}
            PlasmaComponents.Label {
                text: "Bed: "+main.tempba+"/"+main.tempbt
                font.weight: Font.Bold
                visible: main.bed}
            PlasmaComponents.Label {
                text: "Chamber: "+main.tempca+"/"+main.tempct
                font.weight: Font.Bold
                visible: main.chamber}}
        }
        
}
