/**
 * I am a new handler
 */
component{

	//DI
	property name="messagebox" inject="MessageBox@cbmessagebox";
	property name="auth" inject="authenticationService@cbauth";

	/**
	 * new
	 */
	function new( event, rc, prc ){
		event.setView( "sessions/new" );
	}

	/**
	 * create
	 */
	function create( event, rc, prc ){
		try{
			auth.authenticate( rc.username, rc.password );
			return relocate( uri= "/Countdowner/dist/index.html" );
		} catch ( InvalidCredentials e) {
			messagebox.warn( e.message );
			return relocate( uri = "/login" );
		}
	}

	/**
	 * delete
	 */
	function delete( event, rc, prc ){
		auth.logout();
		messagebox.info( "See you soon!" );
		return relocate( uri= "/" );
	}



}
