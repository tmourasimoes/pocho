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

Method RetornarPacientePorCPF(pCPF As %String) As pocho.msg.ResponsePaciente [ WebMethod ]
{
    Set tSC = $$$OK
    
    Set pInput = ##class("pocho.msg.RequestPaciente").%New()
    Set pInput.CPF = pCPF
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)

    Set tObj = ##class(pocho.util.ParseObj).ParseOBJPaciente(tResponse)

    Quit tObj
}

Method RetornarConvenioPorNome(pIdOperadora As %String) As pocho.msg.ResponseOperadora [ WebMethod ]
{
    Set tSC = $$$OK
    
    Set pInput = ##class("pocho.msg.RequestOperadora").%New()
    Set pInput.IdOperadora = pIdOperadora
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
    
    Set tSC = ##class(pocho.util.util).ParseOBJOperadora(tResponse, .tObj)
    
    Quit tObj
}

Method RetornarEspecialidade(pIdEspecialidade As %String) As pocho.msg.ResponseEspecialidade [ WebMethod ]
{
    Set tSC = $$$OK
    
    Set pInput = ##class("pocho.msg.RequestEspecialidades").%New()
    Set pInput.IdEspecialidades = pIdEspecialidade
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
      
    Set tSC = ##class(pocho.util.ParseObj).ParseOBJEspecialidades(tResponse, .tObj)
    
    Quit tObj
}

}
