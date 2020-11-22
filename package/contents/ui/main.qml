import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.12
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0


Item {
    id: main            
    Plasmoid.compactRepresentation: CompactRepresentation {}
    Plasmoid.fullRepresentation: FullRepresentation {}

    property string url: "http://"+plasmoid.configuration.hostname+":"+plasmoid.configuration.port+"/api/"
    property string apikey: plasmoid.configuration.key
    property string snapshoturl: plasmoid.configuration.cameraurl
    
    property string temp0a: ""
    property string temp0t: ""
    property string temp1a: ""
    property string temp1t: ""
    property string temp2a: ""
    property string temp2t: ""
    property string temp3a: ""
    property string temp3t: ""
    property string tempba: ""
    property string tempbt: ""
    property string tempca: ""
    property string tempct: ""
    property bool chamber: plasmoid.configuration.ischamber
    property int hotends: plasmoid.configuration.tools
    property bool bed: plasmoid.configuration.isheatbed
    property bool iscamera: plasmoid.configuration.iscamera
    property bool showtleft: plasmoid.configuration.showtleft
    property bool showpbar: plasmoid.configuration.showpbar
    property int panelwidth: plasmoid.configuration.panelwidth
    property string version: ""
    property string status: ""
    property string filename: ""
    property double completion: 0
    property string printTime: ""
    property string printTimeLeft: ""
    property string printTimeTotal: ""    

    
    
    function callback(x,rq){
        if (x.responseText) {
            var d = JSON.parse(x.responseText);
            
            if (rq=="job"){
                //main.ispon = true;
                main.status = d.state;
                main.filename = d.job.file.name;
                main.completion = roundperc(d.progress.completion);
                main.printTime = parseconds(d.progress.printTime);
                main.printTimeLeft = parseconds(d.progress.printTimeLeft);
                main.estimatedPrintTime = parseconds(d.job.estimatedPrintTime);}
            if (rq=="printer"){
                main.temp0a = parseFloat(d.temperature.tool0.actual).toFixed();
                main.temp0t = parseFloat(d.temperature.tool0.target).toFixed();
                if (hotends>1){
                main.temp1a = parseFloat(d.temperature.tool1.actual).toFixed();
                main.temp1t = parseFloat(d.temperature.tool1.target).toFixed();}
                if (hotends>2){
                main.temp2a = parseFloat(d.temperature.tool2.actual).toFixed();
                main.temp2t = parseFloat(d.temperature.tool2.target).toFixed();}
                if (hotends>3){
                main.temp3a = parseFloat(d.temperature.tool3.actual).toFixed();
                main.temp3t = parseFloat(d.temperature.tool3.target).toFixed();}
                if (main.bed){
                main.tempba = parseFloat(d.temperature.bed.actual).toFixed();
                main.tempbt = parseFloat(d.temperature.bed.target).toFixed();}
                }
            if (rq=="priner/chamber"){
                main.tempca = parseFloat(d.chamber.actual).toFixed();
                main.tempct = parseFloat(d.chamber.target).toFixed();}
           
        }
        }

    
    function request(rq, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function f() {callback(xhr, rq)});
        xhr.open('GET', main.url+rq, true);
        xhr.setRequestHeader("Host", main.url);
        xhr.setRequestHeader("X-Api-Key", main.apikey);
        xhr.send();}

    
    function roundperc(num){
        num = +num.toFixed(2);
        return num;}

    function parseconds(seconds){
        //seconds = Number(seconds);
        var d = Math.floor(seconds / (3600*24));
        var h = Math.floor(seconds % (3600*24) / 3600);
        var m = Math.floor(seconds % 3600 / 60);
        var s = Math.floor(seconds % 60);
        
        var dDisplay = d > 0 ? d + "d " : "";
        var hDisplay = h > 0 ? h + "h " : "";
        var mDisplay = m > 0 ? m + "m " : "";
        //var sDisplay = s > 0 ? s + "s" : "";
        
        //var dDisplay = d > 0 ? d + (d == 1 ? " day, " : " days, ") : "";
        //var hDisplay = h > 0 ? h + (h == 1 ? " hour, " : " hours, ") : "";
        //var mDisplay = m > 0 ? m + (m == 1 ? " minute, " : " minutes, ") : "";
        //var sDisplay = s > 0 ? s + (s == 1 ? " second" : " seconds") : "";
        return dDisplay + hDisplay + mDisplay;}


}

