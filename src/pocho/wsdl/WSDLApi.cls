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

Method RetornarPacientePorCPF(pCPF As %String) As pocho.msg.GXML [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.GXML").%New()
    Set pInput.Telefone = pCPF
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
        
    Quit pInput
}

// Method GXML(Output pObj As pocho.msg.GXML) As pocho.msg.GXML [ WebMethod ]

// {

//     Set tSC = $$$OK

//     Set tTabela = ##class(pocho.msg.GXML).%OpenId(1)

//     Set pObj.Telefone = tTabela.Telefone

//     Set pObj.Nome     = tTabela.Nome

//     Set pObj.CPF      = tTabela.CPF

//     quit pObj

// }

}
