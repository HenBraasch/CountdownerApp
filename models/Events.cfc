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

	function saveEventData( eventData ){
		query = qb.from('event')
			.insert({
				"title" = eventData.title,
				"date" = eventData.date,
				"picture_url" = eventData.picture_url
			})
	}


}