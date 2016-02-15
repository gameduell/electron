//v0.36.7 / API / Web Contents
package electron;

import haxe.extern.Rest;

import js.node.events.EventEmitter;//haxelib
import js.node.Buffer;//haxelib

import js.Error;

@:enum
abstract MarginsType(Int)
{
    var DEFAULT = 0;
    var NONE = 1;
    var MINIMUM = 2;
}

@:enum
abstract PageSize(String) {
    var A5 = "A5";
    var A4 = "A4";
    var A3 = "A3";
    var LEGAL = "Legal";
    var LETTER = "Letter";
    var TABLOID = "Tabloid";
}

typedef PrintOptions = 
{
    var silent : Bool;
    var printBackground : Bool;
}

typedef PDFOptions = 
{
    var marginsType : MarginsType;
    var pageSize : PageSize;
    var printBackground : Bool;
    var printSelectionOnly : Bool;
    var landscape : Bool;
}

typedef DevToolsOptions =
{
    var detach : Bool;
}

typedef LoadURLOptions =
{
    @:optional var httpReferrer : String;
    @:optional var userAgent : String;
    @:optional var extraHeaders : String;
}

typedef FindInPageOptions = 
{
    @:optional var forward : Bool;
    @:optional var findNext : Bool;
    @:optional var matchCase : Bool;
    @:optional var wordStart : Bool;
    @:optional var medialCapitalAsWordStart : Bool;
}

@:enum
abstract StopFindInPageAction(String)
{
    var CLEAR_SELECTION = "clearSelection";
    var KEEP_SELECTION = "keepSelection";
    var ACTIVATE_SELECTION = "activateSelection";

}

@:enum
abstract DeviceEmulatorPosition(String)
{
    var DESKTOP = "desktop";
    var MOBILE = "mobile";
}

typedef DeviceEmuatorScreenSize =
{
    var width : Int;
    var height : Int;
}

typedef DeviceEmulatorViewPosition =
{
    var x : Int;
    var y : Int;
}

typedef DeviceEmulatorViewSize =
{
    var width : Int;
    var height : Int;
}

typedef DeviceEmulatorOffset =
{
    var x : Float;
    var y : Float;
}

typedef DeviceEmulationParameters =
{
    @:optional var screenPosition : DeviceEmulatorPosition;
    @:optional var screenSize : DeviceEmuatorScreenSize;
    @:optional var viewPosition : DeviceEmulatorViewPosition;
    @:optional var deviceScaleFactor : Int;
    @:optional var viewSize : DeviceEmulatorViewSize;
    @:optional var fitToView : Bool;
    @:optional var offset : DeviceEmulatorOffset;
    @:optional var scale : Float;
}

@:enum
abstract InputEventType(String)
{
    var MOUSE_DOWN = "mouseDown";
    var MOUSE_UP = "mouseUp";
    var MOUSE_ENTER = "mouseEnter";
    var MOUSE_LEAVE = "mouseLeave";
    var CONTEXT_MENU = "contextMenu";
    var MOUSE_WHEEL = "mouseWheel";
    var MOUSE_MOVE = "mouseMove";
    var KEY_DOWN = "keyDown";
    var KEY_UP = "keyUp";
    var CHAR = "char";
}

@:enum
abstract InputEventModifier(String)
{
    var SHIFT = "shift";
    var CONTROL = "control";
    var ALT = "alt";
    var META = "meta";
    var ISKEYPAD = "isKeypad";
    var ISAUTOREPEAT = "isAutoRepeat";
    var LEFTBUTTONDOWN = "leftButtonDown";
    var MIDDLEBUTTONDOWN = "middleButtonDown";
    var RIGHTBUTTONDOWN = "rightButtonDown";
    var CAPSLOCK = "capsLock";
    var NUMLOCK = "numLock";
    var LEFT = "left";
    var RIGHT = "right";
}

@:enum
abstract InputEventKeyCode(String)
{
    var ENTER = "enter";
    var BACKSPACE = "backspace";
    var DELETE = "delete";
    var TAB = "tab";
    var ESCAPE = "escape";
    var CONTROL = "control";
    var ALT = "alt";
    var SHIFT = "shift";
    var END = "end";
    var HOME = "home";
    var INSERT = "insert";
    var LEFT = "left";
    var UP = "up";
    var RIGHT = "right";
    var DOWN = "down";
    var PAGEUP = "pageUp";
    var PAGEDOWN = "pageDown";
    var PRINTSCREEN = "printScreen";
}

@:enum
abstract InputEventMouseButton(String)
{
    var LEFT = "left";
    var MIDDLE = "middle";
    var RIGHT = "right";    
}

typedef InputEvent =
{
    var type:InputEventType;
    @:optional var modifiers : Array<InputEventModifier>;
    @:optional var keyCode : Array<InputEventKeyCode>; //on keyboard event
    @:optional var x : Int; // on mouse event
    @:optional var y : Int; // on mouse event
    @:optional var button : InputEventMouseButton;// on mouse event
    @:optional var globalX : Int;// on mouse event
    @:optional var globalY : Int;// on mouse event
    @:optional var movementX : Int;// on mouse event
    @:optional var movementY : Int;// on mouse event
    @:optional var clickCount : Int;// on mouse event
    @:optional var deltaX : Int;// on mouse wheel event
    @:optional var deltaY : Int;// on mouse wheel event
    @:optional var wheelTicksX : Int;// on mouse wheel event
    @:optional var wheelTicksY : Int;// on mouse wheel event
    @:optional var accelerationRatioX : Int;// on mouse wheel event
    @:optional var accelerationRatioY : Int;// on mouse wheel event
    @:optional var hasPreciseScrollingDeltas : Bool;// on mouse wheel event
    @:optional var canScroll : Bool;// on mouse wheel event
}

@:enum
abstract SavePageType(String)
{
    var HTMLONLY = "HTMLOnly";
    var HTMLCOMPLETE = "HTMLComplete";
    var MHTML = "MHTML";
}

extern class WebContents extends EventEmitter<WebContents>
{
    var session : Session;
    var devToolsWebContents : WebContents;
    var debugger : Debugger; 

    function loadURL( url:String, ?options:LoadURLOptions ) : Void;
    function downloadURL( url:String ) : Void;
    function getURL() : String;
    function getTitle() : String;
    function isLoading() : Bool;
    function isWaitingForResponse() : Bool;
    function stop() : Void;
    function reload() : Void;
    function reloadIgnoringCache() : Void;
    function canGoBack() : Bool;
    function canGoForward() : Bool;
    function canGoToOffset( offset:Int ) : Bool;
    function clearHistory() : Void;
    function goBack() : Void;
    function goForward() : Void;
    function goToIndex( index:Int ) : Void;
    function goToOffset( offset:Int ) : Void;
    function isCrashed() : Bool;
    function setUserAgent( userAgent:String ) : Void;
    function getUserAgent() : String;
    function insertCSS( css:String ) : Void;
    function executeJavaScript( code:String, ?userGesture:Bool ) : Void;
    function setAudioMuted( muted:Bool ) : Void;
    function isAudioMuted() : Bool;
    function undo() : Void;
    function redo() : Void;
    function cut() : Void;
    function copy() :  Void;
    function paste() : Void;
    function pasteAndMatchStyle() : Void;
    function delete() : Void;
    function selectAll() : Void;
    function unselect() : Void;
    function replace( text:String ) : Void;
    function replaceMisspelling( text:String ) : Void;
    function insertText( text:String ) : Void;
    function findInPage( text:String, ?options:FindInPageOptions ) : Int;
    function stopFindInPage( action:StopFindInPageAction ) : Void;
    function hasServiceWorker( callback:Void->Bool ) : Void;
    function unregisterServiceWorker( callback:Void->Bool ) : Void;
    function print( ?options:PrintOptions ) : Void;
    function printToPDF( options:PDFOptions, callback:Error->Buffer->Void ) : Void;
    function addWorkSpace( path:String ) : Void;
    function removeWorkSpace( path:String ) : Void;
    function openDevTools( ?options:DevToolsOptions ) : Void;
    function closeDevTools() : Void;
    function isDevToolsOpened() : Bool;
    function toggleDevTools() : Void;
    function isDevToolsFocused() : Bool;
    function inspectElement( x:Int, y:Int ) : Void;
    function inspectServiceWorker() : Void;
    function send( channel:String, args:Rest<Dynamic> ) : Void;
    function enableDeviceEmulation( parameters:DeviceEmulationParameters ) : Void;
    function disableDeviceEmulation() : Void;
    function sendInputEvent( event:InputEvent ) : Void;
    function beginFrameSubscription( callback:Buffer->Void ) : Void;
    function endFrameSubscription() : Void;
    function savePage( fullPath:String, saveType:SavePageType, callback:Error->Void ) : Bool;
}