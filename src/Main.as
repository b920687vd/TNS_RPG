package
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import ui.ActorCircle;
	
	/**
	 * ...
	 * @author Adam White
	 */
	public class Main extends MovieClip
	{
		
		public function Main()
		{
			_acle_list = new Vector.<ActorCircle>();
			_curr_actor = -1;
			this.addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private var _acle_list:Vector.<ActorCircle>;
		private var _curr_actor:int;
		
		private var _curr_main_circle_display:DisplayObject;
		
		public function show_bar(max:int):void
		{
			//this["ui_main_circle"].cacheAsBitmap = true;
			if (max > 100)
				max = 100;
			this["ui_main_circle"]["ui_action_bar_max"].gotoAndStop(max);
			this["ui_main_circle"]["ui_action_bar"].gotoAndPlay(2);
		}
		
		public function Update(e:Event):void
		{
			for each(var i:ActorCircle in _acle_list)
			{
				i.x++;
				if (i.x >= 400)
				{
					i.x = 12;
					_curr_actor = _acle_list.indexOf(i);
					break;
				}
				if (_curr_actor !=-1)
					enter_turn();
			}
		}
		
		public function add_acle():ActorCircle
		{
			var new_acle:ActorCircle = new ActorCircle();
			new_acle.actor_load("swf/actor_2.swf");
			this.addChild(new_acle);
			new_acle.x = 12;
			new_acle.y = 60;
			_acle_list.push(new_acle);
			return new_acle;
		}
		
		public function actor_load(load_circle:Sprite, actor_path:String):void
		{
			var loader:Loader = new Loader();
			var actor_request:URLRequest = new URLRequest(actor_path);
			loader.load(actor_request);
			_curr_main_circle_display = loader;
			load_circle["ui_actor_loader"].addChild(_curr_main_circle_display);
		}
		
		public function enter_turn():void
		{
			if(_curr_main_circle_display)
				this["ui_main_circle"]["ui_actor_loader"].removeChild(_curr_main_circle_display);
			
			actor_load(this["ui_main_circle"], _acle_list[_curr_actor].actor_path);
			show_bar(50);
		}
	}

}