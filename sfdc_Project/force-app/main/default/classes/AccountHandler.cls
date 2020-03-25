//Class to accept a string and create a account record with same string value, also check that sting is not empty
//if empty then throw error or else return account name 

public class AccountHandler {
    public static Account insertNewAccount(String AccName){
        if(!(string.IsEmpty(AccName))){
          Account accList = New Account(Name=AccName); 
            try{
                 insert accList; 
             }
        catch(DmlException e){
            System.debug('error while insert Account is '+ e.getmessage());
        }
            return accList;
    }
        else
            return Null;
}
}