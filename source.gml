var _app_asset = asset_get_index( "App" );

//	There is an app object to load
//	Create app object instance

//	App объект существует
//	Создание экземпляра App объекта и загрузка ( bootstrap ) игры
if ( object_exists( _app_asset ) )
{
	//	Creating a new room to prepare an instance without references inside the object instances, 
	//	which can be described in the instances that the room creates when loading
	
	//	Создание новой комнаты для подготовки экземпляра без ссылок внутри экземпляров объектов,
	//	что могут быть описаны в экземплярах, создаваемых комнатой при загрузке
	var _room = room_add( );
	
	room_instance_add( _room, 0, 0, _app_asset );
	room_goto( _room );
	
	//	After going to the download room, you need to return the game to its normal flow
	//	After one game frame, the game will return to the starting room from where it should start
	
	//	После перехода в комнату загрузки игре необходимо вернуться к стандартному порядку комнат
	//	После одного игрового кадра игра вернется в исходную комнату, откуда она должна была начаться
	call_later( 1, time_source_units_frames, 
		///	@method
		///	@description Return to default room order
		///				 Возвращение к стандартному порядку комнат
		function( )
		{
			//	Automatic change of the 'persistent' value 
			//	for the App instance so that the entry point is always available to reference to
			
			//	Автоматическое изменение значения 'persistent' 
			//	для экземпляра App, чтобы точка входа всегда была доступна для ссылки
			App.persistent = true;
			
			room_goto( room_first );
		} );
};
