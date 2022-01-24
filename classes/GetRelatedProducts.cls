public class GetRelatedProducts {

    @InvocableMethod(label='Get Related Products' description='Get Related products matching to Master Service PI')
    public static List<RelatedProducts> createRelated(List <GetMasterPI> pis){
        
        Product_Line_Item__c masterPIs = pis.get(0).masterPI;
        String masterProduct = masterPIs.Product_Code__c;
        String controlProductName;
        List <String> relatedProdNames = new List <String> ();
        List<RelatedProducts> relatedProductList = new List<RelatedProducts>();
        List<Product2> relatedProd = [select Id, Name, Family, Control_Product__c from Product2 WHERE Family = 'Related'];
        
        
        //start of logic
        for(Product2 productObj : relatedProd) {
            if(productObj.Control_Product__c != NULL)  {
                controlProductName = productObj.Control_Product__c;
                
                if(controlProductName.contains(masterProduct) ) {
                    relatedProdNames.add(productObj.Name);
                }
            }
        }

        //end of logic
        
        //parse outputs
        RelatedProducts dp = new RelatedProducts();
        dp.relatedPName = relatedProdNames;
        relatedProductList.add(dp);        
        return relatedProductList; 
    }
    
    public class GetMasterPI{        
        @InvocableVariable
        public Product_Line_Item__c masterPI;
    }
    
    public class RelatedProducts{        
        @InvocableVariable
        public List<string> relatedPName;
    }
    
}