/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
*/
component{

	// APPLICATION CFC PROPERTIES
	this.name 				= "ColdBoxTestingSuite" & hash(getCurrentTemplatePath());
	this.sessionManagement 	= true;
	this.sessionTimeout 	= createTimeSpan( 0, 0, 15, 0 );
	this.applicationTimeout = createTimeSpan( 0, 0, 15, 0 );
	this.setClientCookies 	= true;
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

	// Create testing mapping
	this.mappings[ "/tests" ] = getDirectoryFromPath( getCurrentTemplatePath() );
	// Map back to its root
	rootPath = REReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
	this.mappings["/root"]   = rootPath;

	public void function onRequestEnd() {

		if( !isNull( application.cbController ) ){
			application.cbController.getLoaderService().processShutdown();
		}

		structDelete( application, "cbController" );
		structDelete( application, "wirebox" );
	}
}