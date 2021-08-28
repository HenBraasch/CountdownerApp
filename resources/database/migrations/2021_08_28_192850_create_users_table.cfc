component {
    
    function up( schema, qb ) {
       
       schema.create( "users", function (table){
           table.increments( "id" );
           table.string( "username" ).unique;
           table.string( "email" ).unique;
           table.string( "password" );
           table.timestamp( "createdDate" );
           table.timestamp( "modifiedDate" );

       });
    };

    function down( schema, qb ) {
        queryExecute( "DROP TABLE `users`");
    };

}
