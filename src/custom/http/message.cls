Class custom.http.message Extends (Ens.Response, Ens.Request, custom.json.utils)
{

/// ex: www.host.com or localhost:8081
Property TargetHost As %String(MAXLEN = "");

/// ex: "/oauth/token"
Property TargetPath As %String(MAXLEN = "");

/// ex: Post, Get, Put, etc...
Property HttpVerb As %String [ InitialExpression = "Get" ];

/// use headerGet and headerSet methods to get/set values on headers
Property Headers As %String(MAXLEN = "") [ InitialExpression = "{}" ];

/// use paramGet and paramSet methods to get/set values on parameters
Property Params As %String(MAXLEN = "") [ InitialExpression = "{}" ];

/// use bodyGet and bodySet methods to get/set values on body
Property Body As %Stream.GlobalCharacter;

/// for https, set this SSL/TLS config name http://localhost:52773/csp/sys/sec/%25CSP.UI.Portal.SSLList.zen
Property SSL As %String(MAXLEN = 200);

/// for https, set this Credentials config name http://localhost:52773/csp/healthshare/namespace/EnsPortal.Credentials.zen
/// for bearer token, set the user as Bearer and pwd as the token
/// for basic authorization, check basicAuthorization = true to set the user and pwd. 
Property AuthCredentials As %String(MAXLEN = 200);

Property BasicAuthorization As %Boolean [ InitialExpression = 0 ];

/// for https, set this property as true
Property Https As %Boolean [ InitialExpression = 0 ];

Property SSLCheckServerIdentity As %Boolean [ InitialExpression = 1 ];

Property ContentType As %String(MAXLEN = "");

Property CharSet As %String;

Property Cookies As %String(MAXLEN = "") [ InitialExpression = "{}" ];

Property MimeDataIdx As array Of %String;

Property MimeData As list Of %Stream.GlobalBinary;

Property ContentLength As %String;

Property ContentInfo As %String(MAXLEN = "");

Property ContentBoundary As %String;

Property HttpVersion As %String;

Property ResponseStatusCode As %Integer;

Property ResponseStatusLine As %String(MAXLEN = "");

Property ResponseReasonPhrase As %String(MAXLEN = "");

/// use urlSet method - ex: https://api.restful-api.dev/objects
Property URL As %String(MAXLEN = "");

/// short paramSet version
Method ps(pNodePath As %String = "", pValue As %Library.DynamicObject, pType As %String, pNodePathDelimiter As %String = ".") As %Status
{
    Quit ..paramSet(pNodePath,pValue,pType,pNodePathDelimiter)
}

Method paramSet(pNodePath As %String = "", pValue As %Library.DynamicObject, pType As %String = "", pNodePathDelimiter As %String = ".") As %Status
{
	Set tSC = $System.Status.OK()
    Set tRef=""
    Try
	{
        Set tParams = {}
        If $Length(..Params)>0 {
            Set tParams = {}.%FromJSON(..Params)
        }
        If pNodePath = "" {
            Set tParams = pValue
        } Else {
            Do ..set(tParams,pNodePath,pValue,pType,pNodePathDelimiter)
        }
        Set ..Params = tParams.%ToJSON()
    }
    Catch(e)
    {
        Set tSC = e.AsStatus()
    }
    Quit tSC
}

/// short paramGet version
Method pg(pNodePath, pNodePathDelimiter As %String = ".") As %Library.DynamicObject
{
    Quit ..paramGet(pNodePath, pNodePathDelimiter)
}

/// Param get (nodePath is the path to get properties from json, ex: rootnode or rootnode.innernode or rootnode.innernode.0 - 0 is the first object of innernode array)
/// To get an entire json let pNodePath empty
Method paramGet(pNodePath As %String = "", pNodePathDelimiter As %String = ".") As %Library.DynamicObject
{
    Set tRef=""
    Try
	{
        If $Length(..Params)=0 Return ""
        Set tJson = {}.%FromJSON(..Params)
        Set tRef = ..get(tJson,pNodePath,pNodePathDelimiter)
    }
	Catch(e)
	{
	}
    Quit tRef
}

ClassMethod new(url As %String, verb As %String = "Get", Output tSC As %Status) As custom.http.message
{
    Set tMessage = ##class(custom.http.message).%New()
    Set tSC = tMessage.urlSet(url)
    Set tMessage.HttpVerb = verb
    Quit tMessage
}

/// based on provided URL, split the values for TargetHost, TargetPath and Https
Method urlSet(pURL As %String) As %Status
{
    Set tSC = $$$OK
    Try {
        If $ZConvert($Piece(pURL,"//",1),"L") = "https:" Set ..Https = 1
        If $Find(pURL,"//") Set pURL = $Piece(pURL,"//",2,*)
        Set ..TargetHost = $Piece(pURL,"/",1)
        Set ..TargetPath = "/"_$Piece($Piece(pURL,"/",2,*),"?",1)
        If ..Https = 0,..SSL'="" Set ..SSL = ""
    }
    Catch(e)
    {
        Set tSC = e.AsStatus()
    }
    Quit tSC
}

/// short headerSet version
Method hs(pNodePath As %String = "", pValue As %Library.DynamicObject, pType As %String, pNodePathDelimiter As %String = ".") As %Status
{
    Quit ..headerSet(pNodePath,pValue,pType,pNodePathDelimiter)
}

/// Header set (nodePath is the path to set properties on json, ex: rootnode or rootnode.innernode or rootnode.innernode.0 - 0 is the first object of innernode array)
/// To set an entire json let pNodePath empty
Method headerSet(pNodePath As %String = "", pValue As %Library.DynamicObject, pType As %String = "", pNodePathDelimiter As %String = ".") As %Status
{
	Set tSC = $System.Status.OK()
    Set tRef=""
    Try
	{
        Set tHeaders = {}
        If $Length(..Headers)>0 {
            Set tHeaders = {}.%FromJSON(..Headers)
        }
        If pNodePath = "" {
            Set tHeaders = pValue
        } Else {
            Do ..set(tHeaders,pNodePath,pValue,pType,pNodePathDelimiter)
        }

        Set ..Headers = tHeaders.%ToJSON()
    }
    Catch(e)
    {
        Set tSC = e.AsStatus()
    }
    Quit tSC
}

/// short headerGet version
Method hg(pNodePath, pNodePathDelimiter As %String = ".") As %Library.DynamicObject
{
    Quit ..headerGet(pNodePath, pNodePathDelimiter)
}

/// Header get (nodePath is the path to get properties from json, ex: rootnode or rootnode.innernode or rootnode.innernode.0 - 0 is the first object of innernode array)
/// To get an entire json let pNodePath empty
Method headerGet(pNodePath, pNodePathDelimiter As %String = ".") As %Library.DynamicObject
{
    Set tRef=""
    Try
	{
        If $Length(..Headers)=0 Return tRef
        Set tJson = {}.%FromJSON(..Headers)
        Set tRef = ..get(tJson,pNodePath,pNodePathDelimiter)
    }
	Catch(e)
	{
	}
    Quit tRef
}

/// short bodySet version
Method bs(pNodePath As %String = "", pValue As %Library.DynamicObject, pType As %String = "", pNodePathDelimiter As %String = ".") As %Status
{
    Quit ..bodySet(pNodePath,pValue,pType,pNodePathDelimiter)
}

/// Param set (nodePath is the path to set properties on json, ex: rootnode or rootnode.innernode or rootnode.innernode.0 0 is the first object of innernode array)
/// To set an entire json let pNodePath empty
/// Ex     Do tRequest.bodySet(,{
///        "name": "Apple MacBook Pro 16",
///        "data": {
///            "year": 2019,
///            "price": 1849.99,
///            "CPU model": "Intel Core i9",
///            "Hard disk size": "1 TB",
///            "Series":["B1","C1","D1"]
///        }
///    })
/// Or
///         Do tRequest.bodySet("name","Apple MacBook Pro 16")
///         Do tRequest.bodySet("data.year","2019")
///         Do tRequest.bodySet("data.price",1849.99)
///         Do tRequest.bodySet("data.CPU model","Intel Core i9")
///         Do tRequest.bodySet("data.Hard disk size","1 TB")
///         Do tRequest.bodySet("data.Series.0","B1")
///         Do tRequest.bodySet("data.Series.+","C1") //plus is for pushing (%Push)
///         Do tRequest.bodySet("data.Series.+","D1") //plus is for pushing (%Push)
Method bodySet(pNodePath As %String = "", pValue As %Library.DynamicObject, pType As %String = "", pNodePathDelimiter As %String = ".") As %Status
{
	Set tSC = $System.Status.OK()
    Try
    {
        If '$IsObject(..Body) Set ..Body = ##class(%Stream.GlobalCharacter).%New()
        Set tPayload = {}
        If ..Body.SizeGet()>0 {
            Set tPayload = {}.%FromJSON(..Body)
        }
        If ..ContentType="" Set ..ContentType="application/json"
        If pNodePath = "" {
            Set tPayload = pValue
        } Else {
            Do ..set(tPayload,pNodePath,pValue,pType,pNodePathDelimiter)
        }
        Do tPayload.%ToJSON(..Body)
    }
    Catch(e)
    {
        Set tSC = e.AsStatus()
    }
    Quit tSC
}

/// It's Used when the body is a json type
/// Body get (nodePath is the path to get properties from json, ex: rootnode or rootnode.innernode or rootnode.innernode.0 - 0 is the first object of innernode array)
/// To get an entire json let pNodePath empty
Method bodyGet(pNodePath As %String = "", pNodePathDelimiter As %String = ".") As %Library.DynamicObject
{
    Set tRef=""
    Try
	{
        If '$IsObject(..Body) Set ..Body = ##class(%Stream.GlobalCharacter).%New()
        Do ..Body.Rewind()
        If ..Body.SizeGet() = 0 Return ""
        Set tJson = {}.%FromJSON(..Body)
        Set tRef = ..get(tJson,pNodePath,pNodePathDelimiter)
    }
	Catch(e)
	{
	}
    Quit tRef
}

/// short bodyGet version
Method bg(pNodePath As %String = "", pNodePathDelimiter As %String = ".") As %Library.DynamicObject
{
    Quit ..bodyGet(pNodePath,pNodePathDelimiter)
}

Method GetNextMimeData(ByRef pIndex) As %Stream.GlobalBinary
{
	If '$Data(pIndex) Set pIndex = ""
	Set tIdx = ..MimeDataIdx.Next(pIndex)
	Set pIndex = tIdx
	If tIdx="" Quit ""
	Quit ..MimeData.GetAt(..MimeDataIdx.GetAt(tIdx))
}

Method GetMimeData(pNodePath) As %Stream.GlobalBinary
{
	If ..MimeDataIdx.GetAt(pNodePath)="" Quit ""
	Quit ..MimeData.GetAt(..MimeDataIdx.GetAt(pNodePath))
}

Method SetMimeData(pNodePath, pValue As %Stream.GlobalBinary) As %Status
{
	Set tSC = $System.Status.OK()
    Try
    {
		Do ..MimeDataIdx.SetAt(..MimeData.Count()+1,pNodePath)
		Do ..MimeData.Insert(pValue)
    }
    Catch(e)
    {
        Set tSC = e.AsStatus()
    }
    Quit tSC
}

Method HttpCall(Output pResponse As custom.http.message, pTimeout As %Integer, pParams As %DynamicObject) As %Status
{
    Set tSC = $$$OK 
    Try {
        If '$Data(pParams) Set pParams = {}
        If ..Https=1,..SSL="" Set ..SSL = ..GetSSLConfiguration("pm.community.intersystems.com")
        Set tSC = ..ToHttpRequest(.tHttpRequest,.tURL)
        If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC) }
        If $Data(pTimeout) Set tHttpRequest.Timeout = pTimeout
        Set tSC = $Method(tHttpRequest,..HttpVerb,tURL)
        If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC) }
        Set tSC = ..HttpResponseToMsgResponse(tURL,tHttpRequest,$This,.pResponse)
        If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC) }
		Set tSC = ..TreatMsgResponse($This,.pResponse,pParams)
		If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC) }

    }
    Catch(e) {
		Set tSC = e.AsStatus()
    }
    Quit tSC
}

Method ToHttpRequest(Output pHttpRequest As %Net.HttpRequest, Output tURL As %String, pGetToken As %Boolean = 0) As %Status
{
    Set tSC = $$$OK 
    Try {
        If (..TargetPath = ""||..TargetHost=""),..URL'="" Do ..urlSet(..URL)
        Set pHttpRequest = ##class(%Net.HttpRequest).%New()
        Set pHttpRequest.Https = ..Https
        Set pHttpRequest.SSLConfiguration = ..SSL
		Set pHttpRequest.SSLCheckServerIdentity = ..SSLCheckServerIdentity
        If ..AuthCredentials'="" {
           Set tCred = ##class(Ens.Config.Credentials).%OpenId(..AuthCredentials)
           If $IsObject(tCred) {
                If (..BasicAuthorization) {
                    Do ..headerSet("Authorization","Basic "_$SYSTEM.Encryption.Base64Encode(tCred.GetValue(..AuthCredentials,"Username")_":"_tCred.PasswordGet()))
                } Else {
                    Do ..headerSet("Authorization",tCred.GetValue(..AuthCredentials,"Username")_" "_tCred.PasswordGet())
                }
           }
        }
		Set tJSONHeaders = {}
        If $Length(..Headers)>0 Set tJSONHeaders = {}.%FromJSON(..Headers)
		If ..ContentType'="" {
            Do ..s(tJSONHeaders,"Content-Type",..ContentType)
		}
        Set tProp = tJSONHeaders.%GetIterator()
        While (tProp.%GetNext(.key,.value)) {
            Do pHttpRequest.SetHeader(key,$Select($IsObject(value):value.%ToJSON(),1:value))
        }
		If $Find("get:put:post:patch:delete:",$Piece($ZCONVERT(..TargetPath,"L"),":",1))>0 {
            Set tVerb = $Piece($ZCONVERT(..TargetPath,"L"),":",1)
            Set ..HttpVerb = $Select(tVerb="post":"Post",tVerb="put":"Put",tVerb="patch":"Patch",tVerb="delete":"Delete",1:"Get")
			Set ..TargetPath = $Piece(..TargetPath,":",2,*)
		} Else {
            Set ..HttpVerb = $ZCONVERT(..HttpVerb,"L")
            Set ..HttpVerb = $Select(..HttpVerb="post":"Post",..HttpVerb="put":"Put",..HttpVerb="patch":"Patch",..HttpVerb="delete":"Delete",1:"Get")
        }
        Set tTargetPath = ..TargetPath
        Set tTargetPath = $Replace($Replace(tTargetPath,"{{","{"),"}}","}")
		Set tJSONParams = {}
        If $Length(..Params)>0 Set tJSONParams = {}.%FromJSON(..Params)
        Set tProp = tJSONParams.%GetIterator()
        While (tProp.%GetNext(.key,.value)) {
            If $Find(tTargetPath,"{"_key_"}")>0 {
                Set tTargetPath = $Replace(tTargetPath,"{"_key_"}",$ZCONVERT($ZCONVERT(value,"O","UTF8"),"O","URL"))
            } Else {
                If $Find($ZCONVERT(..ContentType,"L"),"form-urlencoded")=0 {
                    Do pHttpRequest.SetParam(key,$Select($IsObject(value):value.%ToJSON(),1:value))
                } Else {
                    Do pHttpRequest.InsertFormData(key,$Select($IsObject(value):value.%ToJSON(),1:value))
                }
            }
        }
        If $IsObject(..Body) {
            Do ..Body.Rewind()
            While (..Body.AtEnd=0) {
                Do pHttpRequest.EntityBody.Write(..Body.Read())
            }
        }
        Set pHttpRequest.Server = $PIECE($PIECE(..TargetHost,":",1),"/",1)
	    Set pHttpRequest.Port = $SELECT($FIND(..TargetHost,":")>0:$PIECE($PIECE(..TargetHost,":",2),"/",1),1:pHttpRequest.Port)
		Set tURL = $SELECT($PIECE(..TargetHost,"/",2,*)'="":"/"_$PIECE(..TargetHost,"/",2,*),1:"")_tTargetPath
    }
    Catch(e) {
		Set tSC = e.AsStatus()
    }
	Quit tSC
}

ClassMethod HttpResponseToMsgResponse(pURL As %String, pHttpRequest As %Net.HttpRequest, pMessageRequest As custom.http.message, Output pMessageResponse As custom.http.message, Output pPayloadResponse As %Library.DynamicObject, Output pHeadersResponse As %Library.DynamicObject) As %Status
{
    Set tSC = $$$OK 
    Try {
        Set pResponse = pHttpRequest.HttpResponse
        Set pMessageResponse = ##class(custom.http.message).%New()
        Set pPayloadResponse = {}
        If $IsObject(pResponse.Data),pResponse.Data.SizeGet()>0{
			Do pResponse.Data.Rewind()
			While (pResponse.Data.AtEnd=0) {
				Do pMessageResponse.Body.Write(pResponse.Data.Read())
			}
        }
        Set tHeaders = {}
        Set tIdx = pResponse.GetNextHeader("")
        While tIdx'="" {
            Set tValue = pResponse.GetHeader(tIdx)
            If tValue'="" Do tHeaders.%Set(tIdx,tValue)
            Set tIdx = pResponse.GetNextHeader(tIdx)
        }
        If tHeaders.%Size()>0 {
            Set tHeaderStr = ""
			If ($IsObject(##class(%Dictionary.ClassDefinition).%OpenId("%JSON.Formatter"))) {
        		Set tFormatter = ##class(%JSON.Formatter).%New()
				Set tSC = tFormatter.FormatToString(tHeaders.%ToJSON(),.tHeaderStr) 
				If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC) }
			} Else {
				Set tHeaderStr = tHeaders.%ToJSON()			
			}
            Set pMessageResponse.Headers = tHeaderStr
            Set pHeadersResponse = tHeaders
        }
		Set tParams={}
		Set tIdx = pHttpRequest.NextParam("")
		While tIdx'="" {
            Set tValue = $Get(pHttpRequest.GetParam(tIdx))
            If tValue'="" Do tParams.%Set(tIdx,tValue)
			Set tIdx = pHttpRequest.NextParam(tIdx)
		}
        If tParams.%Size()>0 {
            Set tParamsStr = ""
			If ($IsObject(##class(%Dictionary.ClassDefinition).%OpenId("%JSON.Formatter"))) {
        		Set tFormatter = ##class(%JSON.Formatter).%New()
				Set tSC = tFormatter.FormatToString(tParams.%ToJSON(),.tParamsStr) 
				If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC) }
				Set pMessageResponse.Params = tParamsStr
			} Else {
				Set pMessageResponse.Params = tParams.%ToJSON()			
			}
        }
        Set pMessageResponse.TargetHost = pMessageRequest.TargetHost
        Set pMessageResponse.URL = pURL
        Set pMessageResponse.ResponseStatusCode = pResponse.StatusCode
        Set pMessageResponse.ResponseStatusLine = pResponse.StatusLine
        Set pMessageResponse.ResponseReasonPhrase = pResponse.ReasonPhrase
		Set pMessageResponse.ContentType = pResponse.ContentType
        Set pMessageResponse.ContentInfo = pResponse.ContentInfo
        Set pMessageResponse.ContentLength = pResponse.ContentLength
        Set pMessageResponse.ContentBoundary = pResponse.ContentBoundary
   }
    Catch(e) {
		Set tSC = e.AsStatus()
    }
	Quit tSC
}

Method formatJSONBody() As %Status
{
    Set tSC = $$$OK 
    Try {
        If $IsObject(..Body),..Body.SizeGet()>0{
			If ($IsObject(##class(%Dictionary.ClassDefinition).%OpenId("%JSON.Formatter"))),$Find($ZConvert(..ContentType,"L"),"json")>0 {
        		Set tFormatter = ##class(%JSON.Formatter).%New()
                Set tBody = ##class(%DynamicObject).%FromJSON(..Body)
                Set tSC = tFormatter.FormatToStream(tBody,..Body)
                If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC) }
            }
        }
	}
    Catch(e) {
		Set tSC = e.AsStatus()
    }
	Quit tSC
}

ClassMethod TreatMsgResponse(pRequest As custom.http.message, ByRef pResponse As custom.http.message, pParams As %Library.DynamicObject) As %Status
{
    Set tSC = $$$OK 
    Try {
        If '$Data(pParams) Set pParams={"formatJsonBodyResponse":0}
        Set pFormatJsonBodyResponse = $Select(pParams.formatJsonBodyResponse'="":pParams.formatJsonBodyResponse,1:0)
		If pResponse.ResponseReasonPhrase="" {
        	Set pResponse.ResponseReasonPhrase = ..GetResponseReasonPhrase(pResponse.ResponseStatusCode)
        }
        If (pFormatJsonBodyResponse) {
            Set tSC = pResponse.formatJSONBody()
            If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC) }
        }
        If $Data(pRequest),pRequest'="" {
            Set pResponse.TargetHost = pRequest.TargetHost
            Set pResponse.TargetPath = pRequest.TargetPath
            Set pResponse.HttpVerb = pRequest.HttpVerb
        }
	}
    Catch(e) {
		Set tSC = e.AsStatus()
    }
	Quit tSC
}

ClassMethod GetSSLConfiguration(host) As %String
{
  Set tNS = $NAMESPACE
  SET $NAMESPACE = "%SYS"
  IF '##class(Security.SSLConfigs).Exists(host) {
    DO ##class(Security.SSLConfigs).Create(host)
  }
  SET $NAMESPACE = tNS
  QUIT host
}

ClassMethod GetResponseReasonPhrase(statusCode As %Integer) As %String
{
        If statusCode = 200 Quit "OK"
        If statusCode = 201 Quit "Created"
        If statusCode = 202 Quit "Accepted"
        If statusCode = 204 Quit "No Content"
        If statusCode = 304 Quit "Not Modified"
        If statusCode = 400 Quit "Bad Request"
        If statusCode = 401 Quit "Unauthorized"
        If statusCode = 403 Quit "Forbidden"
        If statusCode = 404 Quit "Not Found"
        If statusCode = 405 Quit "Method Not Allowed"
        If statusCode = 406 Quit "Not Acceptable"
        If statusCode = 409 Quit "Conflict"
        If statusCode = 415 Quit "Unsupported Media Type"
        If statusCode = 422 Quit "Unprocessable Entity"
        If statusCode = 423 Quit "Locked"
        If statusCode = 500 Quit "Internal Server Error"
        Quit ""
}

Storage Default
{
<Data name="MimeDataIdx">
<Attribute>MimeDataIdx</Attribute>
<Structure>subnode</Structure>
<Subscript>"custom.http.message.MimeDataIdx"</Subscript>
</Data>
<Data name="messageDefaultData">
<Subscript>"message"</Subscript>
<Value name="1">
<Value>TargetHost</Value>
</Value>
<Value name="2">
<Value>TargetPath</Value>
</Value>
<Value name="3">
<Value>HttpVerb</Value>
</Value>
<Value name="4">
<Value>Headers</Value>
</Value>
<Value name="5">
<Value>Params</Value>
</Value>
<Value name="6">
<Value>Body</Value>
</Value>
<Value name="7">
<Value>SSL</Value>
</Value>
<Value name="8">
<Value>AuthCredentials</Value>
</Value>
<Value name="9">
<Value>Https</Value>
</Value>
<Value name="10">
<Value>SSLCheckServerIdentity</Value>
</Value>
<Value name="11">
<Value>ContentType</Value>
</Value>
<Value name="12">
<Value>CharSet</Value>
</Value>
<Value name="13">
<Value>Cookies</Value>
</Value>
<Value name="14">
<Value>MimeData</Value>
</Value>
<Value name="15">
<Value>ContentLength</Value>
</Value>
<Value name="16">
<Value>ContentInfo</Value>
</Value>
<Value name="17">
<Value>ContentBoundary</Value>
</Value>
<Value name="18">
<Value>HttpVersion</Value>
</Value>
<Value name="19">
<Value>ResponseStatusCode</Value>
</Value>
<Value name="20">
<Value>ResponseStatusLine</Value>
</Value>
<Value name="21">
<Value>ResponseReasonPhrase</Value>
</Value>
<Value name="22">
<Value>URL</Value>
</Value>
<Value name="23">
<Value>BasicAuthorization</Value>
</Value>
</Data>
<DefaultData>messageDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
