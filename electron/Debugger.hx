package electron;

import haxe.extern.Rest;

@:enum
abstract DebuggerEvent(String)
{
	var DETACH = "detach";
	var MESSAGE = "message";
}

typedef DebuggerDetachEvent =
{
	var event : DebuggerEvent;
	var reason : String;
}

typedef DebuggerMessageEvent =
{
	var event : DebuggerEvent;
	var method : String;
	var params : Dynamic;
}

extern class Debugger
{
	function attach( ?protocolVersion:String ) : Void;
	function isAttached() : Bool;
	function detach() : Void;
	function sendCommand( method:String, ?commandParams:Dynamic, ?callback:Dynamic->Dynamic->Void ) : Void;

	function on( event:DebuggerEvent, callback:DebuggerEvent->Rest<Dynamic> ) : Void;
}
