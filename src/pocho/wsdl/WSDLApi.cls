Class demoho.wsdl.WSDLApi Extends (Ens.BusinessService, %SOAP.WebService)
{

/// Name of the WebService.
Parameter SERVICENAME = "WSDLApi";

/// TODO: change this to actual SOAP namespace.
/// SOAP Namespace for the WebService
Parameter NAMESPACE = "https://tempuri.org";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

Method Teste(pTeste As %String) As %String [ WebMethod ]
{
    Quit pTeste
}

Method TesteAPI(pTeste As %String) As %String [ WebMethod ]
{
    Set pObj = ##class("demoho.api.api").%New()
    Set rv= pObj.teste("1234",.t)
    Quit t
}

Method GXML(Output pObj As demoho.msg.GXML) As %Status [ WebMethod ]
{
    Set tSC = $$$OK
    
  

    Set tTabela = ##class(demoho.msg.GXML).%OpenId(1)

    Set pObj.Telefone = tTabela.Telefone
    Set pObj.Nome     = tTabela.Nome
    Set pObj.CPF      = tTabela.CPF

    quit tSC
}

}
