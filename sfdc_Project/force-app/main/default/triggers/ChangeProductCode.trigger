trigger ChangeProductCode on Product2 (before insert,before Update) {
List<Product2> ProductList = Trigger.New;
    for (Product2 a : ProductList){
       if (a.ProductCode != Null && a.ProductCode !='')
			a.ProductCode=('XYZ-'+a.ProductCode);
    } 
}