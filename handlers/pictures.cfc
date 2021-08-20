/**
 * Manage pictures
 * It will be your responsibility to fine tune this template, add validations, try/catch blocks, logging, etc.
 */
component extends="coldbox.system.EventHandler"{
	
	// DI 
	property name="pictureService" inject="PicturesService";
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
	 * Display a list of pictures
	 */
	function index( event, rc, prc ){
		// Get resources here

		prc.events = pictureService.list();
		return prc.events;
	}

	/**
	 * Return an HTML form for creating one pictures
	 */
	function new( event, rc, prc ){
		event.setView( "pictures/new" );
	}

	/**
	 * Create a pictures
	 */
	function create( event, rc, prc ){
		
	}

	/**
	 * Show a pictures
	 */
	function show( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "pictures/show" );
	}

	/**
	 * Edit a pictures
	 */
	function edit( event, rc, prc ){
		event.paramValue( "id", 0 );
		
		event.setView( "pictures/edit" );
	}

	/**
	 * Update a pictures
	 */
	function update( event, rc, prc ){
		event.paramValue( "id", 0 );
		
	}

	/**
	 * Delete a pictures
	 */
	function delete( event, rc, prc ){
		event.paramValue( "id", 0 );
		
	}
	
}
