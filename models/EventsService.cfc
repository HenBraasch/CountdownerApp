/**
 * I manage events
 */
component singleton accessors="true"{

	// Properties
	property name="eventDao" inject="Events";

	/**
	 * Constructor
	 */
	EventsService function init(){

		return this;
	}

	/**
	 * save
	 */
	function save( rc ){
		eventDao.saveEventData( rc );
	}

	/**
	 * delete
	 */
	function delete( eventId ){
		eventDao.deleteEvent( eventId );
	}

	/**
	 * list all events
	 */
	function list(){

		var events = eventDao.listEventData();
		return events;
	}

	/**
	 * get events by user
	 */
	function get(string userid){
		var events = eventDao.getEventData(arguments.userid);
		return events;
	}
	
	function update( eventData ){
		eventDao.updateEventTitle(eventData);
	}


}