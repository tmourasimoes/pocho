Class pocho.wsdl.WSDL Extends EnsLib.SOAP.Service
{

Parameter ADAPTER = "EnsLib.SOAP.InboundAdapter";

/// Name of the WebService.
Parameter SERVICENAME = "WSDL";

/// TODO: change this to actual SOAP namespace.
/// SOAP Namespace for the WebService
Parameter NAMESPACE = "https://tempuri.org";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

Method RetornarPacientePorCPF(pInput As pocho.msg.RequestPaciente) As pocho.msg.ResponsePaciente [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BPProcesso",pInput,.tResponse)

        Quit tResponse
}

Method RetornarRegraQuantidadeAgendamento(pInput As pocho.msg.RequestQuantidadeAgendamento) As pocho.msg.ResponseRegraQuantidadeAgendamento [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

Method RetornarConvenioPorNome(pInput As pocho.msg.RequestOperadora) As pocho.msg.ResponseOperadora [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

Method RetornarPlanoPorConvenio(pInput As pocho.msg.RequestPlanoConvenio) As pocho.msg.ResponsePlanoConvenio [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

Method RetornarEspecialidade(pInput As pocho.msg.RequestEspecialidades) As pocho.msg.ResponseEspecialidade [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

Method RetornarAtuacaoEspecialidade(pInput As pocho.msg.RequestAtuacaoEspecialidade) As pocho.msg.ResponseAtuacaoEspecialidade [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

Method RetornarRegraPermiteConvenioAgenda(pInput As pocho.msg.RequestRegraPermiteConvenioAgenda) As pocho.msg.ResponseRegraPermiteConvenioAgenda [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

Method RetornarHorariosDisponivel(pInput As pocho.msg.RequestHorariosDisponivel) As pocho.msg.ResponseHorarioDisponiveis [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

Method RetornarMedicosDisponivel(pInput As pocho.msg.RequestMedicosDisponivel) As pocho.msg.ResponseMedicosDisponiveis [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

Method RetornarDataDisponivel(pInput As pocho.msg.RequestDataDisponivel) As pocho.msg.ResponseDatasDisponiveis [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

Method RetornarPacienteAgendaPorCPF(pInput As pocho.msg.RequestQuantidadeAgenda) As pocho.msg.ResponseQuantidadeAgenda [ WebMethod ]
{
        Set tSC = $$$OK
        
        Set tSC = ..SendRequestSync("BOBanco",pInput,.tResponse)

        Quit tResponse
}

}
