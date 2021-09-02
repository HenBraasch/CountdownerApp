/**
 * I am a new Model Object
 */
component singleton accessors="true"{

	// Properties
	property name="bCrypt" inject="bcrypt@BCrypt";
	// To create new User instances
	property name="wirebox" inject="wirebox";
	// To populate objects from data
	property name="populator" inject="wirebox:populator";

	/**
	 * Constructor
	 */
	UserService function init(){

		return this;
	}

	//Get a new instance of the user class
	User function new(){
		return wirebox.getInstance( "User" );
	}

	User function retrieveUserById( id ){
		//Populates a new user instance with data from the first row of the query
		return populator.populateFromQuery(
			new(),
			queryExecute( "SELECT * FROM `users` WHERE `id` = ?", [ id ]),
			1
		)
	}

	User function retrieveUserByUsername( username ){
		//Populates a new user instance with data from the first row of the query
		return populator.populateFromQuery(
			new(),
			queryExecute( "SELECT * FROM `users` WHERE `username` = ?", [ username ]),
			1
		)
	}

	boolean function isValidCredentials( username, password ){
		var oUser = retrieveUserByUsername( username );
		if( !oUser.isLoaded() ){
			return false;
		} else {
			return bcrypt.checkPassword( password, oUser.getPassword() );
		}
	}

	function list(){
		
		return queryExecute( "SELECT * FROM `users`", {} ,{ returntype="array" } );
	}

	/**
	 * Create a new user
	 *
	 * @user 
	 * 
	 * @return The created id of the user
	 */
	function create( required user ){
		
		queryExecute(
			" INSERT INTO `users` ( `email`, `username`, `password` )
			  VALUES ( ?, ?, ?) ",
			  [
				  arguments.user.getEmail(),
				  arguments.user.getUsername(),
				  bcrypt.hashPassword( arguments.user.getPassword() )
			  ],
			  {
				  result: 'local.result'
			  }
		);
	
		arguments.user.setID( local.result.generatedKey );
	}


}