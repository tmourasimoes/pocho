Class pocho.api.api Extends (Ens.BusinessService, %SOAP.WebService)
{

/// Name of the WebService.
Parameter SERVICENAME = "api";

/// TODO: change this to actual SOAP namespace.
/// SOAP Namespace for the WebService
Parameter NAMESPACE = "https://tempuri.org";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

/// teste
/// @apiPub[tag="TesteAPI"]
/// @apiPub[path="teste/{pCode}"]
Method teste(pCode As %String, Output pOutput As %String) As %Status [ WebMethod ]
{
    Set tSC = $$$OK
    Set pOutput = pCode
    Quit tSC
}

/// RetornarPacientePorCPF
/// @apiPub[tag="Consultar"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[path="RetornarPacientePorCPF/{pCPF}"]
Method RetornarPacientePorCPF(pCPF As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestPaciente").%New()
    Set pInput.CPF = pCPF
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
      
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarConvenioPorNome
/// @apiPub[tag="Consultar"]
/// @apiPub[verb="Get"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[path="RetornarConvenioPorNome/{pIdOperadora}"]
Method RetornarConvenioPorNome(pIdOperadora As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestOperadora").%New()
    Set pInput.IdOperadora = pIdOperadora
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
      
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarPlanoPorConvenio
/// @apiPub[tag="Consultar"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[verb="Get"]
/// @apiPub[path="RetornarPlanoPorConvenio/{pConvenio}/{pPlano}"]
Method RetornarPlanoPorConvenio(pConvenio As %String, pPlano As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestPlanoConvenio").%New()
    Set pInput.CdConvenio = pConvenio
    Set pInput.CdPlano = pPlano

    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
      
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarEspecialidade
/// @apiPub[tag="Consultar"]
/// @apiPub[verb="Get"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[path="RetornarEspecialidade/{pIdEspecialidade}"]
Method RetornarEspecialidade(pIdEspecialidade As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestEspecialidades").%New()
    Set pInput.IdEspecialidades = pIdEspecialidade
    
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
      
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarAtuacaoEspecialidade
/// @apiPub[tag="Consultar"]
/// @apiPub[verb="Get"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[path="RetornarAtuacaoEspecialidade/{pIdEspecialidade}/{pNrAreaAtuacao}"]
Method RetornarAtuacaoEspecialidade(pIdEspecialidade As %String, pNrAreaAtuacao As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestAtuacaoEspecialidade").%New()
    Set pInput.IdEspecialidades = pIdEspecialidade
    Set pInput.NrAreaAtuacao = pNrAreaAtuacao
    
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
      
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarRegraPermiteConvenioAgenda
/// @apiPub[tag="Consultar"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[path="RetornarRegraPermiteConvenioAgenda/{pCdConvenio}"]
Method RetornarRegraPermiteConvenioAgenda(pCdConvenio As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestRegraPermiteConvenioAgenda").%New()
    Set pInput.CdConvenio =  pCdConvenio
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)
      
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarRegraQuantidadeAgendamento
/// @apiPub[path="/RetornarRegraQuantidadeAgendamento"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[tag="Consultar"]
/// @apiPub[verb="Post"]
Method RetornarRegraQuantidadeAgendamento(pInput As pocho.msg.RequestQuantidadeAgendamento, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)   
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarAgendaDisponivel
/// @apiPub[path="/RetornarAgendaDisponivel"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[tag="Consultar"]
/// @apiPub[verb="GET"]
Method RetornarAgendaDisponivel(pInput As pocho.msg.RequestAgendaDisponivel, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)   
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarPacienteAgendaPorCPF
/// @apiPub[path="/RetornarPacienteAgendaPorCPF"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[tag="Consultar"]
Method RetornarPacienteAgendaPorCPF(pInput As pocho.msg.RequestQuantidadeAgenda, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)   
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

// XData apiPub [ MimeType = application/json ]

// {

// {

//   "info":{

//     "title":"Api isp",

//     "description":"Api isp ",

//     "version":"1.0.0",

//     "termsOfService":"http://swagger.io/terms/",

//     "contact":{

//       "email":"apiteam@swagger.io"

//     },

//     "license":{

//       "name":"Apache 2.0",

//       "url":"http://www.apache.org/licenses/LICENSE-2.0.html"

//     }

//   }

// }

// }

}
