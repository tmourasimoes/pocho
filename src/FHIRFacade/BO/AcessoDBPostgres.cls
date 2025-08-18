Class FHIRFacade.BO.AcessoDBPostgres Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method Inserir(pRequest As FHIRFacade.REQ.InserirPaciente, Output pResponse As FHIRFacade.RES.IsGravou) As %Status
{
    Do pRequest.NewResponse(.pResponse)


    Set sql = " INSERT INTO public.paciente(Codigo, Nome, Sobrenome, Sexo)"_
              " VALUES (?,?,?,?)" 

    
    Try{
			Set tSC = ..Adapter.ExecuteUpdate(.nrows,sql, pRequest.Codigo, pRequest.Nome, pRequest.Sobrenome, pRequest.Sexo)
												
			Set pResponse.IsGravou    = 1	
			Set pResponse.DsErro = "Linha(s) inserida(s):"_nrows
			$$$TRACE("Rotina executada:sim")
		}
	Catch ex {
        Set tSC=ex.AsStatus() 
        Set pResponse.IsGravou    = 300
        Set pResponse.DsErro    = "Falha ao [GRAVAR] os dados" 
    }

    Quit tSC
}

Method ConsultarPaciente(pRequest As FHIRFacade.REQ.ReqTbPaciente, Output pResponse As FHIRFacade.RES.ResTbPaciente) As %Status
{
    $$$TRACE("ListarTbTeste - Listar ")
    
    set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
        
    set sqlStr =  "select codigo, nome,sobrenome,sexo  FROM public.paciente WHERE codigo = ? "
    
    set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.Codigo)
    
    If $IsObject(pOutput) {
	        set tResult = ##class("FHIRFacade.RES.ResTbPaciente").%New()  		
            $$$TRACE("Objeto setado!!!")

            While pOutput.Next() {
                
                $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) //pOutput.Get("Codigo")
                
                Set tResult.Codigo       = pOutput.Get("codigo")    
				Set tResult.Nome         = pOutput.Get("nome")    
                Set tResult.Sobrenome    = pOutput.Get("sobrenome")    
                Set tResult.Sexo         = pOutput.Get("sexo")    

              
				//Do pResponse.Insert(tResult)
			}

            Set pResponse = tResult
		}

    if $$$ISERR(tSC) return tSC
    
    return tSC
}

XData MessageMap
{
<MapItems>

    <MapItem MessageType="FHIRFacade.REQ.InserirPaciente">
        <Method>Inserir</Method>
    </MapItem>

     <MapItem MessageType="FHIRFacade.REQ.ReqTbPaciente">
        <Method>ConsultarPaciente</Method>
    </MapItem>
      

</MapItems>
}

}
