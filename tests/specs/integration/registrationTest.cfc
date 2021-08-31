component extends="tests.resources.BaseIntegrationSpec" appMapping="/"{
	property name="query" inject="provider:QueryBuilder@qb";

	function run(){
		describe( "Registration Suite", function(){
			beforeEach(function(currentSpec){
				setup();
			});

			it( "can show the user registration form", function(){
				var event = get( route="registration.new", params={} );
				expect( event.getRenderedContent() ).toInclude( "Register for Countdowner" );
			});

			it( "can register a user", function(){
				expect(
					queryExecute(
						"SELECT * FROM users WHERE username = :username",
						{ username : "testadmin" },
						{ returntype = "array" }
					)
				).toBeEmpty();

				var event = post( "/registration", {
					"username"				= "testadmin",
					"email"					= "testadmin@test.com",
					"password"				= "mypass1234",
					"passwordConfirmation"	= "mypass1234"
				});
				
				expect( event.getValue( "relocation_URI", "")).toBe( "/" );

				var users = query.from( "users" ).get();
				expect( users ).toBeArray();
				expect( users[1].username ).toBe( "testadmin" );
			})
		})
	}
}