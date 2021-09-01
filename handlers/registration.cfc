/**
 * I am a new handler
 */
component{

	//DI
	property name="userService" inject="UserService";
	property name="messageBox"  inject="messageBox@cbmessagebox";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use

	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

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
		//insert the user
		var generatedKey = userService.create( rc.email, rc.username, rc.password );

		messageBox.success( "The user #encodeForHTML( rc.username )# with id: #generatedKey# was successfully created." );

		relocate( uri = "/" );
	}



}
