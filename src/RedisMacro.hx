package;

import haxe.Json;
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.io.File;

using Lambda;

// TODO: investigate how to put this file inside the js package
class RedisMacro {
	
	public static function buildClient() {
		return buildCommands(macro:Void);
	}
	
	public static function buildMulti() {
		return buildCommands(macro:Multi);
	}
	
	static function buildCommands(ct) {
		var pos = Context.currentPos();
		var fields = Context.getBuildFields();
		var path = Context.resolvePath('redis-commands.json');
		var commands = Json.parse(File.getContent(path));
		
		for(field in Reflect.fields(commands)) {
			switch fields.find(function(f) return f.name == field) {
				case null:
					fields.push({
						name: field,
						pos: pos,
						kind: FFun({
							args: [{
								name: 'args',
								type: macro:Array<String>,
							}, {
								name: 'callback',
								opt: true,
								type: macro:Callback<Dynamic>,
							}],
							ret: ct,
							expr: null,
						}),
						access: [APublic],
						meta: [{ // TODO: how do we support function(arg1, arg2, ...., argn, callback)?
							name: ':overload',
							pos: pos,
							params: [macro function(key:String, ?callback:Callback<Dynamic>):$ct {}]
						},{
							name: ':overload',
							pos: pos,
							params: [macro function(key:String, args:Array<String>, ?callback:Callback<Dynamic>):$ct {}]
						},{
							name: ':overload',
							pos: pos,
							params: [macro function(key:String, value:String, ?callback:Callback<Dynamic>):$ct {}]
						}].concat(switch field {
							case 'hmset': [{
								name: ':overload',
								pos: pos,
								params: [macro function(key:String, obj:{}, ?callback:Callback<Dynamic>):$ct {}]
							}];
							default: [];
						}),
					});
				default: // don't override existing field
			}
			
		}
		return fields;
		
	}
}