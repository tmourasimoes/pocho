Class pocho.util.ParseObj Extends %RegisteredObject
{

ClassMethod ParseOBJPaciente(pInput As EnsLib.SQL.Snapshot, Output pOutput As pocho.msg.ResponsePaciente) As %Status
{
    while pInput.Next() {
        
        set tResult = ##class("pocho.obj.Paciente").%New()
        
        for x=1:1:pInput.GetColumnCount() 
        {
            set tObj = {}
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

            if (tCol = "ID_PACIENTE")
            {
                Set tResult.IDPACIENTE = tVal
            }

            if (tCol = "NOME")
            {
                Set tResult.NOME = tVal
            }
           
            Do pOutput.Pacientes.Insert(tResult)
        }
        kill tResult
    }
}

}
