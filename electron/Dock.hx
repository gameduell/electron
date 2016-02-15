//v0.36.7 / API / DOCK
package electron;

@:enum
abstract BounceType(String)
{
	var CRITICAL = "critical";
	var INFORMATIONAL = "informational";	
}

/**
	class Dock
	Available on OSX only
**/
extern class Dock
{	
	function bounce( ?type:BounceType=BounceType.INFORMATIONAL ) : Void;
	function cancelBounce( id:Int ) : Void;
	function setBadge( text:String ) : Void;
	function getBadge() : String;
	function hide() : Void;
	function show() : Void;
	function setMenu( menu:Menu ) : Void;
	function setIcon( image:NativeImage ) : Void;
}