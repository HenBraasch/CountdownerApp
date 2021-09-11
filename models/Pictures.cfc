/**
 * I model a picture
 */
component accessors="true"{

	// Properties
	property name="qb" inject="QueryBuilder@qb";

	/**
	 * Constructor
	 */
	Pictures function init(){

		return this;
	}

	/**
	 * getEventData
	 */
	array function getPictures(){
		query = qb.from('picture')
				  .get();
		return query;
	}

}