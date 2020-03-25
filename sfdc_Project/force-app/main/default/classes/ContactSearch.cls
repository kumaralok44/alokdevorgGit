//
//
public class ContactSearch {
    public static List<Contact> searchForContacts(String lname, String pcode){
        List<Contact> serchlist = New List<Contact>();
        Contact[] contlist = [Select LastName,MailingPostalCode from Contact];
        System.debug('No. of contact matched '+contlist.size());
         System.debug('List of contact matched '+contlist);
        for(Contact cmatch : contlist){
            //if(lname==cmatch.LastName && pcode==cmatch.MailingPostalCode){
            if(lname.equalsIgnoreCase(cmatch.LastName) && pcode.equalsIgnoreCase(cmatch.MailingPostalCode)){
                serchlist.add(cmatch);
                System.debug('List of contact matched '+serchlist);
            }
        }
        return serchlist;
    }

}