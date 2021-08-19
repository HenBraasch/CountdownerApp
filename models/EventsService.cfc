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
	function save(){

	}

	/**
	 * delete
	 */
	function delete(){

	}

	/**
	 * list
	 */
	function list(){
		return eventDao.getEventData();
	}

	/**
	 * get
	 */
	function get(){

	}


}