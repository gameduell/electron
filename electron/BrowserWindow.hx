//v0.36.7 / API / Browser Window
package electron;

import js.node.Buffer;//haxelib
import js.node.events.EventEmitter;//haxelib

import js.Error;

import electron.WebContents;

typedef ExtraSize = 
{
    var width : Int;
    var height : Int;
}

typedef Bounds = 
{
    var x : Int;
    var y : Int;
    var width : Int;
    var height : Int;
}

@:enum
abstract ButtonFlag(String)
{
    var ENABLED = "enabled";
    var DISABLED = "disabled";
    var DISMISSONCLICK = "dismissonclick";
    var NOBACKGROUND = "nobackground";
    var HIDDEN = "hidden";
    var NONINTERACTIVE = "noninteractive";
}

typedef Button = 
{
    var icon : NativeImage;
    @:optional var tooltip : String;
    @:optional var flags : Array<ButtonFlag>;
    var click : Void -> Void;
}

@:enum abstract BrowserWindowType(String)
{
    var DESKTOP = "desktop";
    var DOCK = "dock";
    var TOOLBAR = "toolbar";
    var SPLASH = "splash";
    var NOTIFICATION = "notification";
    var TEXTURED = "textured";
}

@:enum abstract BrowserWindowTileBarStyle(String)
{
    var DEFAULT = "default";
    var HIDDEN = "hidden";
    var HIDDEN_INSET = "hidden-inset";
}

typedef BrowserFontFamily = 
{
    @:optional var standard : String;
    @:optional var serif : String;
    @:optional var sansSerif : String;
    @:optional var monospace : String;
}

typedef BrowserWindowWebPreferences =
{
    @:optional var nodeIntegration : Bool;
    @:optional var preload : String;
    @:optional var session : Session;
    @:optional var partition : String;
    @:optional var zoomFactor : Float;
    @:optional var javascript : Bool;
    @:optional var webSecurity : Bool;
    @:optional var allowDisplayingInsecureContent : Bool;
    @:optional var allowRunningInsecureContent : Bool;
    @:optional var images : Bool;
    @:optional var textAreasAreResizable : Bool;
    @:optional var webgl : Bool;
    @:optional var webaudio : Bool;
    @:optional var plugins : Bool;
    @:optional var experimentalFeatures : Bool;
    @:optional var experimentalCanvasFeatures : Bool;
    @:optional var directWrite : Bool;
    @:optional var blinkFeatures : String;
    @:optional var defaultFontFamily : BrowserFontFamily;
    @:optional var defaultFontSize : Int;
    @:optional var defaultMonospaceFontSize : Int;
    @:optional var minimumFontSize : Int;
    @:optional var defaultEncoding : String;
}

typedef BrowserOptions =
{
    @:optional var width : Int;
    @:optional var height : Int;
    @:optional var x : Int;
    @:optional var y : Int;
    @:optional var useContentSize : Bool;
    @:optional var center : Bool;
    @:optional var minWidth : Int;
    @:optional var minHeight : Int;
    @:optional var maxWidth : Int;
    @:optional var maxHeight : Int;
    @:optional var resizable : Bool;
    @:optional var movable : Bool;
    @:optional var minimizable : Bool;
    @:optional var maximizable : Bool;
    @:optional var closable : Bool;
    @:optional var alwaysOnTop : Bool;
    @:optional var fullscreen : Bool;
    @:optional var fullscreenable : Bool;
    @:optional var skipTaskbar : Bool;
    @:optional var kiosk : Bool;
    @:optional var title : String;
    @:optional var icon : NativeImage;
    @:optional var show : Bool;
    @:optional var frame : Bool;
    @:optional var acceptFirstMouse : Bool;
    @:optional var disableAutoHideCursor : Bool;
    @:optional var autoHideMenuBar : Bool;
    @:optional var enableLargerThanScreen : Bool;
    @:optional var backgroundColor : String;
    @:optional var hasShadow : Bool;
    @:optional var darkTheme : Bool;
    @:optional var transparent : Bool;
    @:optional var type : BrowserWindowType;
    @:optional var titleBarStyle : BrowserWindowTileBarStyle;
    @:optional var webPreferences : Bool;
}

@:jsRequire('browser-window')
extern class BrowserWindow extends EventEmitter<BrowserWindow>
{
    var webContents : WebContents;
    var id : Int;

    static function getAllWindows() : Array<BrowserWindow>;
    static function getFocusedWindow() : BrowserWindow;
    static function fromWebContents( webContents:WebContents ) : BrowserWindow;
    static function fromId( id:Int ) : BrowserWindow;
    static function addDevToolsExtension( path:String ) : String;
    static function removeDevToolsExtension( name:String ) : Void;

    function new( ?options:BrowserOptions ) : Void; //TODO
    function destroy() : Void;
    function close() : Void;
    function focus() : Void;
    function isFocused() : Bool;
    function show() : Void;
    function showInactive() : Void;
    function hide() : Void;
    function isVisible() : Bool;
    function maximize() : Void;
    function unmaximize() : Void;
    function isMaximized() : Bool;
    function minimize() : Void;
    function restore() : Void;
    function isMinimized() : Bool;
    function setFullScreen( flag:Bool ) : Void;
    function isFullScreen() : Bool;
    function setAspectRatio( aspectRatio:String, ?extraSize:ExtraSize ) : Void;
    function setBounds( options:Bounds, ?animate:Bool ) : Void;
    function getBounds() : Bounds;
    function setSize( width:Int, height:Int, ?animate:Bool ) : Void;
    function getSize() : Array<Int> ;
    function setContentSize( width:Int, height:Int, ?animate:Bool ) : Void;//animate on OSX only
    function getContentSize() : Array<Int>;
    function setMinimumSize( width:Int, height:Int ) : Void;
    function getMinimumSize() : Array<Int>;
    function setMaximumSize( width:Int, height:Int ) : Void;
    function getMaximumSize() : Array<Int>;
    function setResizable( resizable:Bool ) : Void;
    function isResizable() : Bool;
    function setMovable( moveable:Bool ) : Void; //OSX, WIN
    function isMovable() : Bool;
    function setMinimizable( minimizable:Bool ) : Void; //OSX, WIN
    function isMinimizable() : Bool; //OSX, WIN
    function setMaximizable( maximizable:Bool ) : Void; //OSX, WIN
    function isMaximizable() : Bool; //OSX, WIN
    function setFullScreenable( fullScreenable:Bool ) : Void; //OSX
    function isFullScreenable() : Bool; //OSX
    function setClosable( closeable:Bool ) : Void; //OSX, WIN
    function isClosable() : Bool; //OSX, WIN
    function setAlwaysOnTop( flag:Bool ) : Void;
    function isAlwaysOnTop() : Bool;
    function center() : Void;
    function setPosition( x:Int, y:Int, ?animate:Bool ) : Void; //animate on OSX only
    function getPosition() : Array<Int>;
    function setTitle( title:String ) : Void;
    function getTitle() : String;
    function flashFrame( flag:Bool ) : Void;
    function setSkipTaskbar( skip:Bool ) : Void;
    function setKiosk( flag:Bool ) : Void;
    function isKiosk() : Bool;
    function getNativeWindowHandle() : Dynamic;
    function hookWindowMessage( message:Int, callback:Void->Void ) : Void; //Windoof
    function isWindowMessageHooked( message:Int ) : Bool; //Windoof
    function unhookWindowMessage( message:Int ) : Void; //Windoof
    function unhookAllWindowMessages() : Void; //Windoof
    function setRepresentedFilename( filename:String ) : Void; //OSX
    function getRepresentedFilename() : String; //OSX
    function setDocumentEdited( edited:Bool ) : Void; //OSX
    function isDocumentEdited() : Bool; //OSX
    function focusOnWebView() : Void;
    function blurWebView() : Void;
    function capturePage( ?rect:Bounds, callback:NativeImage->Void) : Void;
    function print( ?options:PrintOptions ) : Void;
    function printToPDF( options:PDFOptions, callback:Error->Buffer->Void ) : Void;
    function loadUrl( url:String, ?options:LoadURLOptions ) : Void;
    function reload() : Void;
    function setMenu( menu:Menu ) : Void; //Linux Windows
    function setProgressBar( progress:Float ) : Void;
    function setOverlayIcon( overlay:NativeImage, description:String ) : Void;//Windows 7+
    function setHasShadow( hasShadow:Bool ) : Void; //OSX
    function hasShadow() : Bool; //OSX
    function setThumbarButtons( buttons:Array<Button> ) : Void; //Windows 7+
    function showDefinitionForSelection() : Void; //OSX
    function setAutoHideMenuBar( hide:Bool ) : Void;
    function isMenuBarAutoHide() : Bool;
    function setMenuBarVisibility( visible:Bool ) : Void;
    function isMenuBarVisible() : Bool;
    function setVisibleOnAllWorkspaces( visible:Bool ) : Void;
    function isVisibleOnAllWorkspaces() : Bool;
    function setIgnoreMouseEvents( ignore:Bool ) : Void; //OSX
}