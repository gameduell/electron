//v0.36.7 / API / App
package electron;

@:enum
abstract AppEvent(String) {
    var WILL_FINISH_LAUNCHING = "will-finish-launching";
    var READY = "ready";
    var WINDOW_ALL_CLOSED = "window-all-closed";
    var BEFORE_QUIT = "before-quit";
    var WILL_QUIT = "will-quit";
    var QUIT = "quit";
    var OPEN_FILE = "open-file";//OSX
    var OPEN_URL = "open-url";//OSX
    var ACTIVATE = "activate";//OSX
    var BROWSER_WINDOW_BLUR = "browser-window-blur";
    var BROWSER_WINDOW_FOCUS = "browser-window-focus";
    var BROWSER_WINDOW_CREATED = "browser-window-created";
    var CERTIFICATE_ERROR = "certificate-error";
    var SELECT_CLIENT_CERTIFICATE = "select-client-certificate";
    var LOGIN = "login";
    var GPU_PROCESS_CRASHED = "gpu-process-crashed";
}

@:enum
abstract AppPath(String) {
    var HOME = "home";
    var APPDATA = "appData";
    var USERDATA = "userData";
    var TEMP = "temp";
    var EXE = "exe";
    var MODULE = "module";
    var DESKTOP = "desktop";
    var DOCUMENTS = "documents";
    var DOWNLOADS = "downloads";
    var MUSIC = "music";
    var PICTURES = "pictures";
    var VIDEOS = "videos";
}

typedef Task = {
    var program : String;
    var arguments : String;
    var title : String;
    var description : String;
    var iconPath : String;
    var iconIndex : Int;
}

@:jsRequire('app')
extern class App
{
    static var commandLine(default, null) : CommandLine;
    static var dock(default, null) : Dock; //OSX

    static function quit() : Void;
    static function exit( exitCode:Int ) : Void;
    static function getAppPath() : String;
    static function getPath( name:AppPath ) : String;
    static function setPath( name:AppPath, path:String ) : Void;
    static function getVersion() : String;
    static function getName() : String;
    static function getLocale() : String;
    static function addRecentDocument( path:String ) : Void; //OSX Windows
    static function clearRecentDocuments() : Void; //OSX Windows
    static function setUserTasks( tasks:Array<Task> ) : Void; //Windows
    static function allowNTLMCredentialsForAllDomains( allow:Bool ) : Void;
    static function makeSingleInstance( callback:Array<String>->String->Void ) : Bool;
    static function setAppUserModelId( id:String ) : String; //Windows
    static function isAeroGlassEnabled() : Bool; //Windows

    static function on( eventType:AppEvent, callback:Void->Void ) : Void;
}