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

}
