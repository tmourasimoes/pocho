Class pocho.util.ParseObj Extends %RegisteredObject
{

ClassMethod ParseOBJPaciente(pInput As EnsLib.SQL.Snapshot) As pocho.msg.ResponsePaciente
{
    set pOutput = ##class("pocho.msg.ResponsePaciente").%New()
    
    while pInput.Next() {
        
        set tResult = ##class("pocho.obj.Paciente").%New()
        
        for x=2:1:pInput.GetColumnCount() 
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

    return pOutput
}

ClassMethod ParseOBJOperadora(pInput As EnsLib.SQL.Snapshot) As pocho.msg.ResponseOperadora
{
    set pOutput = ##class("pocho.msg.ResponseOperadora").%New()
    
    while pInput.Next() {
        
        set tResult = ##class("pocho.obj.Operadora").%New()
        
        for x=2:1:pInput.GetColumnCount() 
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

            if (tCol = "NM_OPERADORA")
            {
                Set tResult.NMOPERADORA = tVal
            }

            if (tCol = "QT_DIAS_RETORNO")
            {
                Set tResult.QTDIASRETORNO = tVal
            }
           
            Do pOutput.Operadoras.Insert(tResult)
        }
        kill tResult
    }

    return pOutput
}

ClassMethod ParseOBJEspecialidades(pInput As EnsLib.SQL.Snapshot) As pocho.msg.ResponseEspecialidade
{
    set pOutput = ##class("pocho.msg.ResponseEspecialidade").%New()
    
    while pInput.Next() {
        
        set tResult = ##class("pocho.obj.Especialidade").%New()
        
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

            if (tCol = "ESPECIALIDADE")
            {
                Set tResult.ESPECIALIDADE = tVal
            }

            Do pOutput.Especialidades.Insert(tResult)
        }
        kill tResult
    }
    return pOutput
}

}
