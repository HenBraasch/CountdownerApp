component extends="coldbox.system.testing.BaseTestCase" {
    property name="migrationService" inject="MigrationService@cfmigrations";

    this.loadColdBox = true;
    this.unloadColdbox = false;

    function beforeAll(){
        super.beforeAll();
        application.wirebox.autowire(this);

        if(!request.keyExists("migrationsRan")){
            migrationService.setMigrationsDirectory("/root/resources/database/migrations");
            migrationService.runAllMigrations("down");
            migrationService.runAllMigrations("up");
            request.migrationsRan = true;
        }
    }

    /**
     * All the integration tests we build will be automatically
     * rolled back
     * @aroundEach
     */
    function wrapInTransaction(spec){
        transaction action="begin"{
            try{
                arguments.spec.body();
            } catch(any e){
                rethrow;
            } finally{
                transaction action="rollback";
            }
        }
    }
}