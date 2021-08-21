/**
 * Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {

	// Application properties
	this.name              = hash( getCurrentTemplatePath() );
	this.sessionManagement = true;
	this.sessionTimeout    = createTimespan( 0, 0, 30, 0 );
	this.setClientCookies  = true;
	this.defaultdatasource = "countdowner";
	this.datasources["countdowner"] = {
		class: 'com.mysql.cj.jdbc.Driver'
	  , bundleName: 'com.mysql.cj'
	  , bundleVersion: '8.0.19'
	  , connectionString: 'jdbc:mysql://localhost:3306/countdowner?characterEncoding=UTF-8&serverTimezone=Pacific/Auckland&maxReconnects=3'
	  , username: 'root'
	  , password: "encrypted:cf4c0737e68ea0cc18fa0d46f36b8ff66e1fa727ea4055a42b1e7a49a0075bd3"
	  
	  // optional settings
	  , connectionLimit:100 // default:-1
	  , liveTimeout:60 // default: -1; unit: minutes
	  , alwaysSetTimeout:true // default: false
	  , validate:false // default: false
  };

	// Java Integration
	this.javaSettings = {
		loadPaths               : [ expandPath( "./lib" ) ],
		loadColdFusionClassPath : true,
		reloadOnChange          : false
	};

	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_APP_MAPPING   = "";
	// COLDBOX PROPERTIES
	COLDBOX_CONFIG_FILE   = "";
	// COLDBOX APPLICATION KEY OVERRIDE
	COLDBOX_APP_KEY       = "";

	// application start
	public boolean function onApplicationStart() {
		application.cbBootstrap = new coldbox.system.Bootstrap(
			COLDBOX_CONFIG_FILE,
			COLDBOX_APP_ROOT_PATH,
			COLDBOX_APP_KEY,
			COLDBOX_APP_MAPPING
		);
		application.cbBootstrap.loadColdbox();
		return true;
	}

	// application end
	public void function onApplicationEnd( struct appScope ) {
		arguments.appScope.cbBootstrap.onApplicationEnd( arguments.appScope );
	}

	// request start
	public boolean function onRequestStart( string targetPage ) {
		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );

		return true;
	}

	public void function onSessionStart() {
		application.cbBootStrap.onSessionStart();
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ) {
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection = arguments );
	}

	public boolean function onMissingTemplate( template ) {
		return application.cbBootstrap.onMissingTemplate( argumentCollection = arguments );
	}

}
