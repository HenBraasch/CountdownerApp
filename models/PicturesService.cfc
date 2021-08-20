/**
 * I manage pictures
 */
component singleton accessors="true"{

	// Properties
	property name="pictureDao" inject="Pictures";

	/**
	 * Constructor
	 */
	PicturesService function init(){

		return this;
	}

	/**
	 * save
	 */
	function save(){

	}

	/**
	 * delete
	 */
	function delete(){

	}

	/**
	 * list
	 */
	function list(){
		return pictureDao.getPictures();
	}

	/**
	 * get
	 */
	function get(){

	}


}