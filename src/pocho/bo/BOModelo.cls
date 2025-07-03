Include EnsSQLTypes

Class pocho.bo.BOOracle Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

/// Criação								 <br>		
/// Descrição    : Consulta Pacientes  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarPacientePorCPF(pRequest As pocho.msg.RequestPaciente, Output pOutput As EnsLib.SQL.Snapshot) As %Status
{
        
        //Teste

        $$$TRACE("RetornarPacientePorCPF - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT ID_PACIENTE, NOME FROM TASY.TASYAEC_RETORNA_PACIENTE_POR_CPF WHERE CPF = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.CPF)
        
        if $$$ISERR(tSC) return tSC
        
        return tSC
}



XData MessageMap
{
<MapItems>
    <MapItem MessageType="pocho.msg.RequestPaciente">
		<Method>RetornarPacientePorCPF</Method>
    </MapItem>
    
    



</MapItems>
}

}
