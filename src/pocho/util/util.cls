Class pocho.util.util Extends %RegisteredObject
{

/// Converte EnsLib.SQL.Snapshot para %Library.DynamicObject
ClassMethod SnapToDyna(pInput As EnsLib.SQL.Snapshot) As %Library.DynamicObject
{
        Set pOutput = {"Response":[]}
                
        while pInput.Next() {
            set tObj = {}
            
            for x=1:1:pInput.GetColumnCount() 
            {
                Set tVal =  pInput.GetData(x)
                Set tCol =  pInput.GetColumnName(x)
                
                If ((pInput.GetColumnType(x) = "BIGINT") || (pInput.GetColumnType(x) = "INTEGER") || (pInput.GetColumnType(x) = "DECIMAL")  || (pInput.GetColumnType(x) = "NUMERIC" ))
                {
                    Do tObj.%Set(tCol,+tVal,"number")
                }
                elseif (pInput.GetColumnType(x) = "BOOLEAN")
                {
                    Do tObj.%Set(tCol,tVal, "boolean")
                }
                else
                {
                    Do tObj.%Set(tCol,tVal)
                }
                
                
                //Write tVal,",", tCol ,",", pInput.GetColumnType(x),  ! 
            }

            do pOutput.%Get("Response").%Push(tObj)           
        }
        
        return pOutput
}

}
