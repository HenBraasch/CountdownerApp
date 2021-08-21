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
				"title" = {value = eventData.title, cfsqltype = "CF_SQL_VARCHAR"},
				"date" = {value = eventData.date, cfsqltype = "CF_SQL_DATE"},
				"picture_url" = {value = eventData.picture_url, cfsqltype = "CF_SQL_VARCHAR"},
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
				"title" = {value = eventData.title, cfsqltype = "CF_SQL_VARCHAR"},
				"date"  = {value = eventData.date, cfsqltype = "CF_SQL_DATE"},
				"modified_at"= {value = now(), cfsqltype = "CF_SQL_TIMESTAMP"}
			})
	}


	function deleteEvent( eventId ){
		qb.from('event')
			.where( "id", eventId)
			.delete();
	}

}