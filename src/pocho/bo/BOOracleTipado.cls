Class pocho.bo.BOOracleTipado Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method RetornarPacientePorCPFMOC(pRequest As pocho.msg.RequestPaciente, Output pOutput As pocho.msg.ResponsePaciente) As %Status
{
      Set tSC = $$$OK
      
      Do pRequest.NewResponse(.pOutput)  
      $$$TRACE("RetornarPacientePorCPFMOC - Retornar ")

	    set tResult = ##class("pocho.obj.Paciente").%New()  		
      $$$TRACE("Objeto setado!!!")
      Set tResult.IDPACIENTE  = "1"
      Set tResult.NOME        = "Teste 1"

      Do pOutput.Pacientes.Insert(tResult)

      kill tResult

      if $$$ISERR(tSC) return tSC
      
      return tSC
}

Method RetornarPacientePorCPF(pRequest As pocho.msg.RequestPaciente, Output pOutput As pocho.msg.ResponsePaciente) As %Status
{
        
        $$$TRACE("RetornarPacientePorCPF - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT ID_PACIENTE, NOME FROM TASY.TASYAEC_RETORNA_PACIENTE_POR_CPF WHERE CPF = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.CPF)
        
        If $IsObject(pOutput) {
	        set tResult = ##class("pocho.obj.Paciente").%New()  		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) //pOutput.Get("Codigo")
              
              Set tResult.IDPACIENTE  = pOutput.Get("ID_PACIENTE")    
              Set tResult.NOME        = pOutput.Get("NOME")    

              Do pOutput.Pacientes.Insert(tResult)
          }
          Set pResponse = tResult
	      }

        if $$$ISERR(tSC) return tSC
        
        return tSC
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="pocho.msg.RequestPaciente">
		<Method>RetornarPacientePorCPFMOC</Method>
    </MapItem>
</MapItems>
}

}
