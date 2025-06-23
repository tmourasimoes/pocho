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

/// RetornarPacientePorCPF - Solicitação 1
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

/// RetornarConvenioPorNome - Solicitação 2
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

/// RetornarPlanoPorConvenio - Solicitação 3
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

/// RetornarEspecialidade - Solicitação 4
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

/// RetornarAtuacaoEspecialidade - Solicitação 5
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

/// RetornarRegraPermiteConvenioAgenda - Solicitação 6
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

/// RetornarRegraQuantidadeAgendamento - Solicitação 7
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

/// RetornarMedicosDisponivel - Solicitação 8
/// @apiPub[path="/RetornarMedicosDisponivel/{pIdEspecialidades}/{pNrAreaAtuacao}"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[tag="Consultar"]
/// @apiPub[verb="GET"]
Method RetornarMedicosDisponivel(pIdEspecialidades As %String, pNrAreaAtuacao As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestMedicosDisponivel").%New()
    Set pInput.IdEspecialidades =  pIdEspecialidades
    Set pInput.NrAreaAtuacao =  pNrAreaAtuacao
    
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)   
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarDataDisponivel - Solicitação 9
/// @apiPub[path="/RetornarDataDisponivel/{pCdAgenda}"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[tag="Consultar"]
/// @apiPub[verb="GET"]
Method RetornarDataDisponivel(pCdAgenda As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestDataDisponivel").%New()
    Set pInput.CdAgenda =  pCdAgenda
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)   
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarHorariosDisponivel - Solicitação 10 
/// @apiPub[path="/RetornarHorariosDisponivel/{pCdAgenda}/{pData}"]
/// @apiPub[charset="UTF-8"]
/// @apiPub[tag="Consultar"]
/// @apiPub[verb="GET"]
Method RetornarHorariosDisponivel(pCdAgenda As %String, pData As %String, Output pOutput As %DynamicObject) As %Status [ WebMethod ]
{
    Set pInput = ##class("pocho.msg.RequestHorariosDisponivel").%New()
    Set pInput.CdAgenda =  pCdAgenda
    Set pInput.Data =  pData
    
    
    Set tSC = ..SendRequestSync("BOOracle",pInput,.tResponse)   
    if $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(pocho.util.util).SnapToDyna(tResponse)
    
    return tSC
}

/// RetornarPacienteAgendaPorCPF - Solicitação 11
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
