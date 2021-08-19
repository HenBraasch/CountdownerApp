/**
 * I model a events
 */
component accessors="true"{

	// Properties
	property name="qb" inject="QueryBuilder@qb";

	/**
	 * Constructor
	 */
	Events function init(){

		return this;
	}

	/**
	 * getEventData
	 */
	array function getEventData(){
		query = qb.from('event')
				  .get();
		return query;
	}


}