/**
 * Manage events
 * It will be your responsibility to fine tune this template, add validations, try/catch blocks, logging, etc.
 */
component extends="coldbox.system.EventHandler"{
	
	// DI 
	property name="eventService" inject="EventsService";

	// HTTP Method Security
	this.allowedMethods = {
		index  		= "GET", 
		new    		= "GET", 
		create   	= "POST,PUT", 
		show 		= "GET", 
		edit		= "GET",
		update 		= "POST,PUT,PATCH",
		delete 		= "DELETE"
	};
	
	/**
	 * Param incoming format, defaults to `html`
	 */
	function preHandler( event, rc, prc ){
		event.paramValue( "format", "html" );
	}
		
	/**
	 * Display a list of events
	 */
	function index( event, rc, prc ){
		prc.events = eventService.list();
		return prc.events;
	}

	/**
	 * Return an HTML form for creating one events
	 */
	function new( event, rc, prc ){
		// event.setView( "events/new" );
	}

	/**
	 * Create a events
	 */
	function create( event, rc, prc ){
		var status_message = "Created a new event";

		try {
			eventService.save( rc );
		} catch (any e) {
			status_message = e.message
		}
		return status_message;
	}

	/**
	 * Show a events
	 */
	function show( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "events/show" );
	}

	/**
	 * Edit a events
	 */
	function edit( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "events/edit" );
	}

	/**
	 * Update a events
	 */
	function update( event, rc, prc ){
		var status_message = "Event successfully updated";
		try {
			eventService.update( rc );
		} catch (exType exName) {
			status_message = e.message
		}
		
		return status_message;
	}

	/**
	 * Delete a events
	 */
	function delete( event, rc, prc ){
		event.paramValue( "id", 0 );
		
	}
	
}
