/*******************************************************************************
*	Integration Test as BDD (CF10+ or Railo 4.1 Plus)
*
*	Extends the integration class: coldbox.system.testing.BaseTestCase
*
*	so you can test your ColdBox application headlessly. The 'appMapping' points by default to 
*	the '/root' mapping created in the test folder Application.cfc.  Please note that this 
*	Application.cfc must mimic the real one in your root, including ORM settings if needed.
*
*	The 'execute()' method is used to execute a ColdBox event, with the following arguments
*	* event : the name of the event
*	* private : if the event is private or not
*	* prePostExempt : if the event needs to be exempt of pre post interceptors
*	* eventArguments : The struct of args to pass to the event
*	* renderResults : Render back the results of the event
*******************************************************************************/
component extends="tests.resources.BaseIntegrationSpec" appMapping="/"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		// do your own stuff here
	}

	function afterAll(){
		// do your own stuff here
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "events Suite", function(){

			beforeEach(function( currentSpec ){
				// Setup as a new ColdBox request for this suite, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			});

			it( "can render a list of events", function(){
				var event = execute( event="events.index", renderResults=true );
				
				debug( event.getHandlerResults());
				expect( event.getRenderedContent() ).toBeJSON();
			});

			it( "new", function(){
				var event = execute( event="events.new", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

			it( "create", function(){
				var event = execute( event="events.create", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

			it( "show", function(){
				var event = execute( event="events.show", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

			it( "edit", function(){
				var event = execute( event="events.edit", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

			it( "update", function(){
				var event = execute( event="events.update", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

			it( "delete", function(){
				var event = execute( event="events.delete", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

		
		});

	}

}
