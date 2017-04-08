package ui 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ActorCircle extends MovieClip 
	{
		
		public function ActorCircle() 
		{
			super();
			
		}
		
		public var actor_head:DisplayObject;
		public var actor_path:String;
		
		public function actor_load(actor_path:String):void
		{
			var loader:Loader = new Loader();
			var actor_request:URLRequest = new URLRequest(actor_path);
			loader.load(actor_request);
			this["ui_actor_loader"].addChild(loader);
			this.actor_head = this["ui_actor_loader"];
			this.actor_path = actor_path;
		}
	}

}