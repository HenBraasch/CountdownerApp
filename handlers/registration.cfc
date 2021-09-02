/**
 * I am a new handler
 */
component{

	//DI
	property name="userService" inject="UserService";
	property name="messageBox"  inject="messageBox@cbmessagebox";

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	 * new
	 */
	function new( event, rc, prc ){
		event.setView( "registration/new" );
	}

	/**
	 * create
	 */
	function create( event, rc, prc ){
		/* Get a new instance of the user class and populate the fields with information from the rc scope */
		var oUser = populateModel( getInstance( "User" ) );
		
		oUser = userService.create( oUser );

		messageBox.success( "The user #encodeForHTML( oUser.getUsername() )# with id: #oUser.getID()# was successfully created." );

		relocate( uri = "/" );
	}



}
