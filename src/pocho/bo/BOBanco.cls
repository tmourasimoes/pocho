Include EnsSQLTypes

Class pocho.bo.BOBanco Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

Property Schema As %String;

Parameter SETTINGS = "Schema";

/// Criação								 <br>		
/// Descrição    : Consulta regras de Quantidade de Agendamentos  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Mensagem de transação: pocho.msg.RequestQuantidadeAgendamento <br>
/// Property CdConvenio As %String; <br>
/// Property CdAgenda As %String; <br>
/// Property DiaSemanaRegra As %String; <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarRegraQuantidadeAgendamento(pRequest As pocho.msg.RequestQuantidadeAgendamento, Output pResponse As pocho.msg.ResponseRegraQuantidadeAgendamento) As %Status
{
    try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarRegraQuantidadeAgendamento - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT cd_classificacao_agenda, qt_permissao, qt_agendado_hoje_regra FROM "_..Schema_".tasyaec_regra_qtd_agendamento "_
                      " where "_
                      " cd_agenda = ? and cd_convenio = ? and ds_dia_regra = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.CdAgenda, pRequest.CdConvenio, pRequest.DiaSemanaRegra)
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.RegraQuantidadeAgenda").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.CDCLASSIFICACAOAGENDA  = pOutput.Get("cd_classificacao_agenda")    
              Set tResult.QTPERMISSAO            = pOutput.Get("qt_permissao")    
              Set tResult.QTAGENDADOHOJEREGRA    = pOutput.Get("qt_agendado_hoje_regra")    
              

              Do pResponse.Agendas.Insert(tResult)
              kill tResult
          }
	    }
    }
    catch erro{
		throw ##class(%Exception.SystemException).%New("Codigo Erro:"_erro.Code_" Location:"_erro.Location_" Data:"_erro.Data)
	}
    
    Quit tSC
}

/// Criação								 <br>		
/// Descrição    : Consulta Pacientes  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Mensagem de transação: pocho.msg.RequestPaciente <br>
/// Property CPF As %String; <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarPacientePorCPF(pRequest As pocho.msg.RequestPaciente, Output pResponse As pocho.msg.ResponsePaciente) As %Status
{
    try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarPacientePorCPF - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT ID_PACIENTE, NOME FROM "_..Schema_".TASYAEC_RETORNA_PACIENTE_POR_CPF WHERE CPF = ? "
                    
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.CPF)
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.Paciente").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.IDPACIENTE  = pOutput.Get("ID_PACIENTE")    
              Set tResult.NOME        = pOutput.Get("NOME")    
              
              Do pResponse.Pacientes.Insert(tResult)
              kill tResult
          }
	    }

    }
    catch erro{
		throw ##class(%Exception.SystemException).%New("Codigo Erro:"_erro.Code_" Location:"_erro.Location_" Data:"_erro.Data)
	}    
    Quit tSC
}

XData MessageMap
{
<MapItems>
        <MapItem MessageType="pocho.msg.RequestQuantidadeAgendamento">
            <Method>RetornarRegraQuantidadeAgendamento</Method>
        </MapItem>
        <MapItem MessageType="pocho.msg.RequestPaciente">
		    <Method>RetornarPacientePorCPF</Method>
        </MapItem>
    </MapItems>
}

}
