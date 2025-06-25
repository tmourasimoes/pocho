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

/// Criação								 <br>		
/// Descrição    : Consulta Convenio por Nome  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarConvenioPorNome(pRequest As pocho.msg.RequestOperadora, Output pResponse As pocho.msg.ResponseOperadora) As %Status
{
    try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarConvenioPorNome - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT NM_OPERADORA, QT_DIAS_RETORNO FROM "_..Schema_".TASYAEC_RETORNA_CONVENIO_POR_NOME WHERE ID_OPERADORA = ? "
                    
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.IdOperadora)
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.Operadora").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.NMOPERADORA   = pOutput.Get("NM_OPERADORA")    
              Set tResult.QTDIASRETORNO = pOutput.Get("QT_DIAS_RETORNO")    
                            
              Do pResponse.Operadoras.Insert(tResult)
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
/// Descrição    : Consulta plano por convenio  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarPlanoPorConvenio(pRequest As pocho.msg.RequestPlanoConvenio, Output pResponse As pocho.msg.ResponsePlanoConvenio) As %Status
{
    try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarPlanoPorConvenio - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT NM_PLANO FROM "_..Schema_".TASYAEC_RETORNA_PLANO_POR_CONVENIO WHERE CD_CONVENIO = ? AND CD_CON_PLANO = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.CdConvenio, pRequest.CdPlano) 
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.PlanoConvenio").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.NMPLANO   = pOutput.Get("NM_PLANO")    
              
              
              Do pResponse.Convenios.Insert(tResult)
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
/// Descrição    : Consulta Especialidades  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarEspecialidade(pRequest As pocho.msg.RequestEspecialidades, Output pResponse As pocho.msg.ResponseEspecialidade) As %Status
{
   
    Set tSC = $$$OK

    Do pRequest.NewResponse(.pResponse) 
    
    $$$TRACE("RetornarEspecialidade - Retornar ")
    
    set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
        
    set sqlStr =  "SELECT ESPECIALIDADE FROM "_..Schema_".TASYAEC_RETORNA_ESPECIALIDADES WHERE ID_ESPECIALIDADE = ?"
    
    set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.IdEspecialidades ) 
    
    If $IsObject(pOutput) {
            
        $$$TRACE("Objeto setado!!!")

        While pOutput.Next() {
            set tResult = ##class("pocho.obj.Especialidade").%New() 
            $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
            
            Set tResult.ESPECIALIDADE   = pOutput.Get("ESPECIALIDADE")    
            
            Do pResponse.Especialidades.Insert(tResult)
            kill tResult
        }
    }
    if $$$ISERR(tSC) return tSC
   
    Quit tSC
}

/// Criação								 <br>		
/// Descrição    : Consulta atuação por Especialidade  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarAtuacaoEspecialidade(pRequest As pocho.msg.RequestAtuacaoEspecialidade, Output pResponse As pocho.msg.ResponseAtuacaoEspecialidade) As %Status
{
    try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarAtuacaoEspecialidade - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT DS_AREA_ATUACAO FROM "_..Schema_".TASYAEC_AREA_ATUACAO_ESPECIALIDADE WHERE CD_ESPECIALIDADE = ? AND NR_SEQ_AREA_ATUACAO = ?"
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.IdEspecialidades, pRequest.NrAreaAtuacao)   
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.AtuacaoEspecialidade").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.DSAREAATUACAO   = pOutput.Get("DS_AREA_ATUACAO")    
              
              Do pResponse.AtuacaoEspecialidades.Insert(tResult)
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
/// Descrição    : Consulta regra permite convenio Agenda  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarRegraPermiteConvenioAgenda(pRequest As pocho.msg.RequestRegraPermiteConvenioAgenda, Output pResponse As pocho.msg.ResponseRegraPermiteConvenioAgenda) As %Status
{
    try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarRegraPermiteConvenioAgenda - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT CD_AGENDA, HORA_INICIO_REGRA,HORA_FIM_REGRA, DIA_SEMANA_REGRA FROM "_..Schema_".TASYAEC_REGRA_PERMITE_CONVENIO_AGENDA WHERE CD_CONVENIO = ?"
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr, pRequest.CdConvenio)   
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.RegraPermiteAgenda").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.CDAGENDA          = pOutput.Get("CD_AGENDA")    
              Set tResult.HORAINICIOREGRA   = pOutput.Get("HORA_INICIO_REGRA")    
              Set tResult.HORAFIMREGRA      = pOutput.Get("HORA_FIM_REGRA")    
              Set tResult.DIASEMANAREGRA    = pOutput.Get("DIA_SEMANA_REGRA")    
              
              Do pResponse.Convenios.Insert(tResult)
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
/// Descrição    : Consulta Horarios Disponíveis  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarHorariosDisponivel(pRequest As pocho.msg.RequestHorariosDisponivel, Output pResponse As pocho.msg.ResponseHorarioDisponiveis) As %Status
{
   try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarHorariosDisponivel - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  " SELECT NR_SEQUENCIA_INTERNO_AGENDA, HORARIO FROM "_..Schema_".TASYAEC_RETORNA_AGENDA_DISPONIVEL "_
                      " WHERE "_
                      " DATA = REPLACE(?, '-', '/') AND CD_AGENDA = ? "
        
        $$$TRACE("Str:"_sqlStr)

        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr,pRequest.Data, pRequest.CdAgenda)         
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.HorarioDisponiveis").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.NRSEQUENCIAINTERNOAGENDA     = pOutput.Get("NR_SEQUENCIA_INTERNO_AGENDA")    
              Set tResult.HORARIO                      = pOutput.Get("HORARIO")    
                
              
              Do pResponse.Horarios.Insert(tResult)
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
/// Descrição    : Consulta medicos disponíveis  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarMedicosDisponivel(pRequest As pocho.msg.RequestMedicosDisponivel, Output pResponse As pocho.msg.ResponseMedicosDisponiveis) As %Status
{
   try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarMedicosDisponivel - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  " SELECT CD_AGENDA, DATA, HORARIO, ID_MEDICO FROM "_..Schema_".TASYAEC_RETORNA_AGENDA_DISPONIVEL "_
                      " WHERE "_
                      " ID_ESPECIALIDADE = ? AND NR_SEQ_AREA_ATUACAO = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr,pRequest.IdEspecialidades, pRequest.NrAreaAtuacao)        
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.MedicoDisponiveis").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.CDAGENDA   = pOutput.Get("CD_AGENDA")    
              Set tResult.DATA       = pOutput.Get("DATA")    
              Set tResult.HORARIO    = pOutput.Get("HORARIO")    
              Set tResult.IDMEDICO   = pOutput.Get("ID_MEDICO")
                
              
              Do pResponse.Medicos.Insert(tResult)
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
/// Descrição    : Consulta data disponíveis  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarDataDisponivel(pRequest As pocho.msg.RequestDataDisponivel, Output pResponse As pocho.msg.ResponseDatasDisponiveis) As %Status
{
   try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarDataDisponivel - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
       set sqlStr =  " SELECT NR_SEQUENCIA_INTERNO_AGENDA, DATA, HORARIO FROM "_..Schema_".TASYAEC_RETORNA_AGENDA_DISPONIVEL "_
                      " WHERE "_
                      " CD_AGENDA = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr,pRequest.CdAgenda)           
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.DataDisponivel").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.NRSEQUENCIAINTERNOAGENDA   = pOutput.Get("NR_SEQUENCIA_INTERNO_AGENDA")    
              Set tResult.DATA                       = pOutput.Get("DATA")    
              Set tResult.HORARIO                    = pOutput.Get("HORARIO")    
              
              Do pResponse.Datas.Insert(tResult)
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
/// Descrição    : Consulta Paciente Agenda por CPF  no TASY	 <br>
/// Desenvolvedor: Thiago Simões		 <br>
/// Dt Inclusão  : 22/06/2025			 <br>
/// Atualizações						 <br>	
/// Data:  ID     		:   Descrição		: 	Desenvolvedor : 
Method RetornarPacienteAgendaPorCPF(pRequest As pocho.msg.RequestQuantidadeAgenda, Output pResponse As pocho.msg.ResponseQuantidadeAgenda) As %Status
{
   try
	{
        Do pRequest.NewResponse(.pResponse) 
        
        $$$TRACE("RetornarPacienteAgendaPorCPF - Retornar ")
        
        set pOutput = ##class(EnsLib.SQL.Snapshot).%New()        
            
        set sqlStr =  "SELECT  DS_STATUS_AGENDA FROM "_..Schema_".TASYAEC_RETORNA_PACIENTE_AGENDA_CPF "_
                      " WHERE "_
                      " CPF = ? AND CD_AGENDA = ? AND CD_CLASSIFICACAO_AGENDA = ? AND DATA = ? "
        
        set tSC = ..Adapter.ExecuteQuery(.pOutput,sqlStr,pRequest.CPF, pRequest.CdAgenda, pRequest.CdClassificaoAgenda, pRequest.Data)          
        
        If $IsObject(pOutput) {
	       		
          $$$TRACE("Objeto setado!!!")

          While pOutput.Next() {
              set tResult = ##class("pocho.obj.PacienteAgendaCPF").%New() 
              $$$TRACE("Registro(s) encontrado(s)!!! - " _ pOutput.RowCount) 
              
              Set tResult.DSSTATUSAGENDADSSTATUSAGENDA   = pOutput.Get("DS_STATUS_AGENDA")    

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

XData MessageMap
{
<MapItems>
        <MapItem MessageType="pocho.msg.RequestQuantidadeAgenda">
            <Method>RetornarPacienteAgendaPorCPF</Method>
        </MapItem>
        
        <MapItem MessageType="pocho.msg.RequestDataDisponivel">
            <Method>RetornarDataDisponivel</Method>
        </MapItem>
        
        <MapItem MessageType="pocho.msg.RequestMedicosDisponivel">
            <Method>RetornarMedicosDisponivel</Method>
        </MapItem>

        <MapItem MessageType="pocho.msg.RequestHorariosDisponivel">
            <Method>RetornarHorariosDisponivel</Method>
        </MapItem>
        
        <MapItem MessageType="pocho.msg.RequestRegraPermiteConvenioAgenda">
            <Method>RetornarRegraPermiteConvenioAgenda</Method>
        </MapItem>
        <MapItem MessageType="pocho.msg.RequestAtuacaoEspecialidade">
            <Method>RetornarAtuacaoEspecialidade</Method>
        </MapItem>
        <MapItem MessageType="pocho.msg.RequestEspecialidades">
            <Method>RetornarEspecialidade</Method>
        </MapItem>
 
        <MapItem MessageType="pocho.msg.RequestPlanoConvenio">
            <Method>RetornarPlanoPorConvenio</Method>
        </MapItem>
        <MapItem MessageType="pocho.msg.RequestQuantidadeAgendamento">
            <Method>RetornarRegraQuantidadeAgendamento</Method>
        </MapItem>
        <MapItem MessageType="pocho.msg.RequestPaciente">
		    <Method>RetornarPacientePorCPF</Method>
        </MapItem>
        <MapItem MessageType="pocho.msg.RequestOperadora">
		    <Method>RetornarConvenioPorNome</Method>
        </MapItem>
    </MapItems>
}

}
