component {

	function configure() {
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */

		resources( resource="registration", only="new,create" );

		route( "/login" )
		 	.withAction( {"POST" = "create", "GET" = "new"} )
			.toHandler( "sessions" );

		
		delete( "/logout" ).to( "sessions.delete" )

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ) {
			return "Ok!";
		} );

		// A nice RESTFul Route example
		route( "/api/echo", function( event, rc, prc ) {
			return {
				"error" : false,
				"data"  : "Welcome to my awesome API!"
			};
		} );
		resources( resource="events" );
		resources( resource="pictures" );
		
		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
