package electron.renderer;

import electron.BrowserWindow;
import electron.WebContents;

@:jsRequire("remote")
extern class Remote {
  static function require(module : String) : Dynamic;
  static function getCurrentWindow() : BrowserWindow;
  static function getCurrentWebContent() : WebContents;
  static function getGlobal(name : String) : String;
  static var process(default, null) : js.node.Process;
}
