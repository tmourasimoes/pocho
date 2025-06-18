Class pocho.bo.BOOracle Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

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

Method RetornarConvenioPorNome(pRequest As pocho.msg.RequestOperadora, Output pOutput As EnsLib.SQL.Snapshot) As %Status
{
        //Teste
        
        $$$TRACE("RetornarConvenioPorNome - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT NM_OPERADORA, QT_DIAS_RETORNO FROM TASY.TASYAEC_RETORNA_CONVENIO_POR_NOME WHERE ID_OPERADORA = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.IdOperadora)
        
        if $$$ISERR(tSC) return tSC
        
        return tSC
}

Method RetornarPlanoPorConvenio(pRequest As pocho.msg.RequestPlanoConvenio, Output pOutput As EnsLib.SQL.Snapshot) As %Status
{
        //Teste
        
        $$$TRACE("RetornarPlanoPorConvenio - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT NM_PLANO FROM TASY.TASYAEC_RETORNA_PLANO_POR_CONVENIO WHERE CD_CONVENIO = ? AND CD_CON_PLANO = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.CdConvenio, pRequest.CdPlano  )      
        if $$$ISERR(tSC) return tSC
        
        return tSC
}

Method RetornarEspecialidade(pRequest As pocho.msg.RequestEspecialidades, Output pOutput As EnsLib.SQL.Snapshot) As %Status
{
        //Teste
        
        $$$TRACE("RetornarEspecialidades - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT ESPECIALIDADE FROM TASY.TASYAEC_RETORNA_ESPECIALIDADES WHERE ID_ESPECIALIDADE = ?"
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.IdEspecialidades )      
        if $$$ISERR(tSC) return tSC
        
        return tSC
}

Method RetornarAtuacaoEspecialidade(pRequest As pocho.msg.RequestAtuacaoEspecialidade, Output pOutput As EnsLib.SQL.Snapshot) As %Status
{
        //Teste
        
        $$$TRACE("RetornarAtuacaoEspecialidade - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT DS_AREA_ATUACAO FROM TASY.TASYAEC_AREA_ATUACAO_ESPECIALIDADE WHERE CD_ESPECIALIDADE = ? AND NR_SEQ_AREA_ATUACAO = ?"
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.IdEspecialidades, pRequest.NrAreaAtuacao  )      
        if $$$ISERR(tSC) return tSC
        
        return tSC
}

Method RetornarRegraPermiteConvenioAgenda(pRequest As pocho.msg.RequestRegraPermiteConvenioAgenda, Output pOutput As EnsLib.SQL.Snapshot) As %Status
{
        //Teste
        
        $$$TRACE("RetornarRegraPermiteConvenioAgenda - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT CD_AGENDA, HORA_INICIO_REGRA,HORA_FIM_REGRA, DIA_SEMANA_REGRA FROM TASY.TASYAEC_REGRA_PERMITE_CONVENIO_AGENDA WHERE CD_CONVENIO = ?"
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.CdConvenio)      
        if $$$ISERR(tSC) return tSC
        
        return tSC
}

Method RetornarRegraQuantidadeAgendamento(pRequest As pocho.msg.RequestQuantidadeAgendamento, Output pOutput As EnsLib.SQL.Snapshot) As %Status
{
        //Teste
        
        $$$TRACE("RetornarRegraQuantidadeAgendamento - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT CD_CLASSIFICACAO_AGENDA, QT_PERMISSAO, QT_AGENDADO_HOJE_REGRA FROM TASY.TASYAEC_REGRA_QTD_AGENDAMENTO "_
                      " WHERE "_
                      " CD_AGENDA = ? AND CD_CONVENIO = ? AND DS_DIA_REGRA = ?"
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr,pRequest.CdAgenda, pRequest.CdConvenio, pRequest.DiaSemanaRegra)      
        if $$$ISERR(tSC) return tSC
        
        return tSC
}

Method RetornarAgendaDisponivel(pRequest As pocho.msg.RequestAgendaDisponivel, Output pOutput As EnsLib.SQL.Snapshot) As %Status
{
        $$$TRACE("RetornarAgendaDisponivel - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
         

        if pRequest.CdAgenda = "" 
        {           
              $$$TRACE("RetornarAgendaDisponivel - pRequest.CdAgenda vazia ")
              
              set sqlStr =  "SELECT CD_AGENDA, DATA, HORARIO, ID_MEDICO FROM TASY.TASYAEC_RETORNA_AGENDA_DISPONIVEL "_
                      " WHERE "
              Set sqlStr = sqlStr _" ID_ESPECIALIDADE = ? AND NR_SEQ_AREA_ATUACAO = ?"
              set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr,pRequest.IdEspecialidades, pRequest.NrAreaAtuacao)
        }
        if pRequest.CdAgenda '= ""   
        {
             $$$TRACE("RetornarAgendaDisponivel - pRequest.CdAgenda não esta vazia ")
             
             set sqlStr =  "SELECT NR_SEQUENCIA_INTERNO_AGENDA, DATA, HORARIO FROM TASY.TASYAEC_RETORNA_AGENDA_DISPONIVEL "_
                      " WHERE "   
             Set sqlStr = sqlStr _" CD_AGENDA = ?"   
             set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr,pRequest.CdAgenda)
        } 

        if pRequest.CdAgenda '= "" && pRequest.Data  '= ""   
        {
              $$$TRACE("RetornarAgendaDisponivel - pRequest.CdAgenda não esta vazia e pRequest.Data não vazia")

             set sqlStr =  "SELECT NR_SEQUENCIA_INTERNO_AGENDA,  HORARIO FROM TASY.TASYAEC_RETORNA_AGENDA_DISPONIVEL "_
                      " WHERE "   
             Set sqlStr = sqlStr _" HORARIO = ? AND o	NR_SEQUENCIA_INTERNO_AGENDA = ?"  
             set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr,pRequest.Horario, pRequest.NrInternoAgenda) 
        }

              
        if $$$ISERR(tSC) return tSC
        
        return tSC
}

Method RetornarPacienteAgendaPorCPF(pRequest As pocho.msg.RequestQuantidadeAgenda, Output pOutput As EnsLib.SQL.Snapshot) As %Status
{
        //Teste

        $$$TRACE("RetornarPacienteAgendaPorCPF - Retornar ")

        $$$TRACE("RetornarPacienteAgendaPorCPF - CPF :" _ pRequest.CPF)
        $$$TRACE("RetornarPacienteAgendaPorCPF - CdAgenda :" _ pRequest.CdAgenda)
        $$$TRACE("RetornarPacienteAgendaPorCPF - CdClassificacaoAgenda :" _ pRequest.CdClassificaoAgenda)
        $$$TRACE("RetornarPacienteAgendaPorCPF - Data :" _ pRequest.Data)
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT  DS_STATUS_AGENDA FROM TASY.TASYAEC_RETORNA_PACIENTE_AGENDA_CPF "_
                      " WHERE "_
                      " CPF = ? AND CD_AGENDA = ? AND CD_CLASSIFICACAO_AGENDA = ? AND DATA = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr,pRequest.CPF, pRequest.CdAgenda, pRequest.CdClassificaoAgenda, pRequest.Data)      
        if $$$ISERR(tSC) return tSC
        
        return tSC
}

XData MessageMap
{
<MapItems>
     <MapItem MessageType="pocho.msg.RequestAtuacaoEspecialidade">
		<Method>RetornarAtuacaoEspecialidade</Method>
    </MapItem>

    <MapItem MessageType="pocho.msg.RequestPaciente">
		<Method>RetornarPacientePorCPF</Method>
    </MapItem>

     <MapItem MessageType="pocho.msg.RequestOperadora">
		<Method>RetornarConvenioPorNome</Method>
    </MapItem>

     <MapItem MessageType="pocho.msg.RequestPlanoConvenio">
		<Method>RetornarPlanoPorConvenio</Method>
    </MapItem>

    <MapItem MessageType="pocho.msg.RequestEspecialidades">
		<Method>RetornarEspecialidade</Method>
    </MapItem>

    <MapItem MessageType="pocho.msg.RequestEspecialidades">
		<Method>RetornarAtuacaoEspecialidade</Method>
    </MapItem>

    <MapItem MessageType="pocho.msg.RequestRegraPermiteConvenioAgenda">
		<Method>RetornarRegraPermiteConvenioAgenda</Method>
    </MapItem>

     <MapItem MessageType="pocho.msg.RequestQuantidadeAgendamento">
		<Method>RetornarRegraQuantidadeAgendamento</Method>
    </MapItem>

     <MapItem MessageType="pocho.msg.RequestAgendaDisponivel">
		<Method>RetornarAgendaDisponivel</Method>
    </MapItem>

     <MapItem MessageType="pocho.msg.RequestQuantidadeAgenda">
		<Method>RetornarPacienteAgendaPorCPF</Method>
    </MapItem>





</MapItems>
}

}
