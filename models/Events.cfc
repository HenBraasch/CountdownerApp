/**
 * I model a events
 */
component accessors="true"{

	// Properties
	property name="qb" inject="provider:QueryBuilder@qb";

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

	/**
	 * Save a new event
	 *
	 * @eventData 
	 */
	function saveEventData( eventData ){
		qb.from('event')
			.insert({
				"title" = eventData.title,
				"date" = eventData.date,
				"picture_url" = eventData.picture_url,
				"created_at" = {value = now(), cfsqltype = "CF_SQL_TIMESTAMP"}
			})
	}

	/**
	 * Update an events title
	 */
	function updateEventTitle( eventData )
	{
		qb.from('event')
			.whereId( eventData.id )
			.update({
				"title" = Left(eventData.title,25),
				"date"  = eventData.date,
				"modified_at"= {value = now(), cfsqltype = "CF_SQL_TIMESTAMP"}
			})
	}

}