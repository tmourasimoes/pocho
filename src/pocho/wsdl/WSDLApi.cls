Class pocho.wsdl.WSDLApi Extends EnsLib.SOAP.Service
{

Parameter ADAPTER = "EnsLib.SOAP.InboundAdapter";

/// Name of the WebService.
Parameter SERVICENAME = "WSDLApi";

/// TODO: change this to actual SOAP namespace.
/// SOAP Namespace for the WebService
Parameter NAMESPACE = "https://tempuri.org";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

Method Teste(pTeste As %String) As %String [ WebMethod ]
{
    Quit pTeste_"1"
}

Method RetornarPacientePorCPFMOC(pCPF As %String) As pocho.msg.ResponsePaciente [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestPaciente").%New()
    Set pInput.CPF = pCPF
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)

    Set pOutput = ##class(pocho.util.ParseObj).ParseOBJPaciente(tResponse, .tObj)

    Quit tObj
}

}
