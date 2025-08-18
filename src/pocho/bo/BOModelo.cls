Class pocho.restclient.BoModelo Extends custom.http.bo
{

Method Login(pRequest As pocho.msg.RequestGuarddocLogin, Output pResponse As pocho.msg.ResponseGuarddocLogin) As %Status
{
    $$$TRACE("INICIOU")
    Set tSC = $$$OK
    Set tRequest = ##class(custom.http.message).new("https://gds.app.br/public/api/login")
    Set tRequest.HttpVerb="Post"
    Set tRequest.Https = 1
    Set tRequest.ContentType = "application/json" //"multipart/form-data"
    
    Set tUser = "orizonti.clinica@orizontiitabira.com.br"
    Set tPassword = "L3nHA$e#q7Q9DTjWQ3Zk"
   
    Do tRequest.paramSet("email",tUser)
    Do tRequest.paramSet("password",tPassword)
     
    $$$TRACE("Carregou variaveis")
 
    Set tSC = ..CallHttp(tRequest, .tIResponse)
    If 'tSC Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC)
    
    $$$TRACE(tIResponse)
    $$$TRACE("Executou http")

    $$$TRACE("Retorno Status:" _ tIResponse.ResponseStatusCode)

    $$$TRACE("Retorno BODY:" _ tIResponse.Body.Read())
    Do tIResponse.Body.Rewind()
 
    If $find(tIResponse.ContentType,"application/json")>0 {
        
        $$$TRACE("Carregando payload")
        Set tPayload = tIResponse.Body.Read()
        Set pResponse = ##class(pocho.msg.ResponseGuarddocLogin).%New()
        Set pResponse.TOKEN = tPayload
    } ElseIf tIResponse.ResponseStatusCode'="200" {
        $$$TRACE("Erro 200")
       Set tSC = $$$ERROR($$$GeneralError, "<"_tIResponse.ResponseStatusCode_"> "_tIResponse.ResponseStatusLine)
    }
    
    Quit tSC
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="pocho.msg.RequestGuarddocLogin">
        <Method>Login</Method>
    </MapItem>
    <MapItem MessageType="custom.http.message">
        <Method>CallHttp</Method>
    </MapItem>
</MapItems>
}

}
