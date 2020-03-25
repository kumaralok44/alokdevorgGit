public class sample_bulk_dml {
    public static void main(){
        List<Contact> Conlist =new List<contact> {
            new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
            new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
            new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
                new Contact(FirstName='Kim',LastName='Shain',Department='Education')}; 
        
         insert Conlist;
        
		List<Contact> ListToUpdate = new List<Contact>();
        	for(Contact con : Conlist) {
                if (con.Department == 'Finance'){
                    con.Title='Financial analyst';
					ListToUpdate.add(con);
                        }
        	}
        update ListToUpdate ;  
            }}