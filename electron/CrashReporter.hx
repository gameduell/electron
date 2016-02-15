//v0.36.7 / API / Crash Reporter
package electron;

typedef CrashReportOptions = 
{
    @:optional var productName : String;
    var companyName : String;
    var submitURL : String;
    @:optional var autoSubmit : Bool;
    @:optional var ignoreSystemCrashHandler : Bool;
    @:optional var extra : Dynamic;
}

@:jsRequire('crash-reporter')
extern class CrashReporter
{
    static function start( ?options:CrashReportOptions ) : Void;
    static function getLastCrashReport() : Dynamic;
    static function getUploadedReports() : Dynamic;
}