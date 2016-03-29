package electron;

extern class WebRequest
{
    function onBeforeSendHeaders( ?filter:Dynamic, listener:Dynamic->Dynamic->Void ) : Void;
}