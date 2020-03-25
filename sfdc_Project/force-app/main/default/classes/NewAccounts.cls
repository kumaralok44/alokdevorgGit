public class NewAccounts {
    public static void sObjectsInsert(){
        Account store =new Account();
        store.name='The tea store';
        store.phone='05321';
        store.AccountNumber='32461';
        insert store;
    }
}