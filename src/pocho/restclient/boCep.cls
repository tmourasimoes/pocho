Class pocho.restclient.boCep Extends custom.http.bo
{

Method CepApi(pRequest As pocho.restclient.cepRequest, Output pResponse As pocho.restclient.cepResponse) As %Status
{
    Set tSC = $$$OK
    Set tRequest = ##class(custom.http.message).new("https://viacep.com.br/ws/"_pRequest.cep_"/json/")
    Set tRequest.HttpVerb="Get"

    Set tSC = ..CallHttp(tRequest, .tIResponse)
    If 'tSC Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC)
    If $find(tIResponse.ContentType,"application/json")>0 {
        Set tPayload = tIResponse.bodyGet()
        Set pResponse = ##class(pocho.restclient.cepResponse).%New()
        Set pResponse.cep = tPayload.%Get("cep")
        Set pResponse.localidade = tPayload.%Get("localidade")
        Set pResponse.logradouro = tPayload.%Get("logradouro")
        Set pResponse.bairro = tPayload.%Get("bairro")
        Set pResponse.complemento = tPayload.%Get("complemento")
        Set pResponse.ddd = tPayload.%Get("ddd")
        Set pResponse.estado = tPayload.%Get("estado")
        Set pResponse.gia = tPayload.%Get("gia")
        Set pResponse.regiao = tPayload.%Get("regiao")
        Set pResponse.uf = tPayload.%Get("uf")
        Set pResponse.siafi = tPayload.%Get("siafi")    
    } ElseIf tIResponse.ResponseStatusCode'="200" {
      Set tSC = $$$ERROR($$$GeneralError, "<"_tIResponse.ResponseStatusCode_"> "_tIResponse.ResponseStatusLine)
    }
    Quit tSC
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="pocho.restclient.cepRequest">
        <Method>CepApi</Method>
    </MapItem>
    <MapItem MessageType="custom.http.message">
        <Method>CallHttp</Method>
    </MapItem>
</MapItems>
}

}
