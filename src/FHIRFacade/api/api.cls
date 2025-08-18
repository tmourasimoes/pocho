Class FHIRFacade.api.api Extends Ens.BusinessService
{

/// @apiPub[tag="function"]
/// @apiPub[tag="FHIR"] 
/// @apiPub[charset="UTF-8"]
/// @apiPub[path="consultarpaciente/{pCode}"]
Method ConsultarPaciente(pCode As %String, Output tSC As %Status) As %DynamicObject [ WebMethod ]
{
    Set tSC = $$$OK

    Set pInput = ##class(FHIRFacade.REQ.FindPatientByInternalId).%New()    
    Set pInput.PatientInternalId = pCode
    Set tSC = ..SendRequestSync("BPPatient" ,pInput,.pOutput)

    Quit pOutput.JSON
}

/// @apiPub[tag="function"]
/// @apiPub[tag="FHIR"] 
/// @apiPub[charset="UTF-8"]
/// @apiPub[path="consultarpacientedb/{pCode}"]
Method ConsultarPacienteDB(pCode As %String, Output tSC As %Status) As %DynamicObject [ WebMethod ]
{
    Set tSC = $$$OK

    Set pInput = ##class(FHIRFacade.REQ.ReqTbPaciente).%New()    
    Set pInput.Codigo = pCode
    Set tSC = ..SendRequestSync("BPConsultarPaciente" ,pInput,.pOutput)

    Quit pOutput.JSON
}


/// ReceberFHIRDynamic
/// @apiPub[path="/receberfhirdynamic"]
/// @apiPub[tag="FHIR"] 
/// @apiPub[charset="UTF-8"]
Method ReceberFHIRDynamic(pInput As %DynamicObject, Output tSC As %Status) As %DynamicObject [ WebMethod ]
{
    Set tSC = $$$OK
    
    Set pV      = ##class(FHIRFacade.util.util).%New()
    
    Set pFHIR               = ##class(FHIRFacade.REQ.ReqFHIRJSON).%New()
   
    Set pFHIR.JSON          = pInput
    
    Set pFHIR.ResourceName  = pV.RetornarResourceFHIR(pInput)
    Set pFHIR.resourceType  = pV.RetornarResourceType(pInput) 
       
    Set tSC =  ..SendRequestSync("BPRoteamentoFHIR",pFHIR,.pRetorno)
    
    Quit pRetorno.JSON
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
