package electron;

extern class CommandLine
{
    function appendSwitch( switchValue:String, ?value:String ) : Void;
    function appendArgument( value:String ) : Void;
}