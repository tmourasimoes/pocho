Class pocho.api.api Extends Ens.BusinessService
{

/// teste
/// @apiPub[tag="TesteAPI"]
/// @apiPub[path="teste/{pCode}"]
Method teste(pCode As %String, Output pOutput As %String) As %Status [ WebMethod ]
{
    Set tSC = $$$OK
    Set pOutput = pCode
    Quit tSC
}

/// RetornarPacientePorCPF - Solicitação 1 CPF = 21798265672
/// @apiPub[tag="Consultar"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[path="RetornarPacientePorCPF/{pCPF}"]
Method RetornarPacientePorCPF(pCPF As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set tSC = $$$OK

    Set pInput = ##class("pocho.msg.RequestPaciente").%New()
    Set pInput.CPF = pCPF
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
      
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

XData apiPub [ MimeType = application/json ]
{
{
  "info":{
    "title":"Api isp",
    "description":"Api isp ",
    "version":"1.0.0",
    "termsOfService":"http://swagger.io/terms/",
    "contact":{
      "email":"apiteam@swagger.io"
    },
    "license":{
      "name":"Apache 2.0",
      "url":"http://www.apache.org/licenses/LICENSE-2.0.html"
    }
  }
}
}

}
