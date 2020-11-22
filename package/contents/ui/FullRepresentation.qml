import QtQuick 2.15
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0



Item {
    id: fview        
    Layout.preferredWidth: 640 * units.devicePixelRatio
    Layout.preferredHeight: 640 * units.devicePixelRatio

    Timer {
        id: snapshotupdate
        interval: plasmoid.configuration.fps*1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: { snapshot1.source = ""; snapshot1.source = main.snapshoturl }}
    Timer {
        id: tempsupdate
        interval: plasmoid.configuration.pollintervalf*1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: { request("job", callback);
                 request("printer", callback);
                 if (main.chamber) request("printer/chamber", callback);}}

    Column{
        anchors.fill: parent
        padding: 10
        spacing: 0
        PlasmaComponents.Label {
            text: "Printer status: "+ main.status
            font.weight: Font.Bold
            wrapMode: Text.WordWrap
            width: parent.width-20}
        
        PlasmaComponents.Label {
            text: "Filename: "+ main.filename 
            font.weight: Font.Bold}
        
        Row{
            visible: main.ishon
            PlasmaComponents.Label {
                text: "Progress: "+ main.completion +"%, "+main.printTime+" / "
                font.weight: Font.Bold}
            PlasmaComponents.Label {
                text: main.printTimeLeft
                font.weight: Font.Bold
                visible: showtleft}
            PlasmaComponents.Label {
                text: main.estimatedPrintTime
                font.weight: Font.Bold
                visible: !showtleft}}
        
        PlasmaComponents.ProgressBar {
            width: parent.width-20
            height: 24
            value: main.completion/100
            visible: main.showpbar}

        Row{
            spacing: units.smallSpacing
            visible: main.ishon
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
                    visible: main.hotends>2}
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
                    visible: main.chamber}
        }
            
        Image {
            id:snapshot1
            width: parent.width-20
            sourceSize.width: snapshot1.width * units.devicePixelRatio
            fillMode: Image.PreserveAspectFit;
            cache: false
            visible: main.iscamera}
        
}
}
