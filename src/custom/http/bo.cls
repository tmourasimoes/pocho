Class custom.http.bo Extends (Ens.BusinessOperation, custom.json.utils)
{


Parameter ADAPTER;

Parameter INVOCATION = "Queue";

Property SSL As %String;

Property Https As %Boolean [ InitialExpression = 0 ];

Property SSLCheckServerIdentity As %Boolean [ InitialExpression = 1 ];

/// ex: www.host.com or localhost:8081
Property TargetHost As %String(MAXLEN = 200);

/// format json response 
Property FormatJsonBodyResponse As %Boolean [ InitialExpression = 1 ];

/// format json response
Property Timeout As %Integer [ InitialExpression = 30 ];

/// for https, set this Credentials config name http://localhost:52773/csp/healthshare/namespace/EnsPortal.Credentials.zen
/// for bearer token, set the user as Bearer and pwd as the token
/// for basic authorization, check basicAuthorization = true to set the user and pwd. 
Property AuthCredentials As %String(MAXLEN = 200);

Property BasicAuthorization As %Boolean [ InitialExpression = 0 ];

Parameter SETTINGS = "FormatJsonBodyResponse:APIConfig,TargetHost:APIConfig,Https:APIConfig,Https:APIConfig,SSL:APIConfig:sslConfigSelector,BasicAuthorization:APIConfig,AuthCredentials:APIConfig:credentialsSelector,Timeout:APIConfig";

Method CallHttp(pRequest As custom.http.message, Output pResponse As custom.http.message) As %Status
{
    Set tSC = $$$OK 
    Try {
        If ..BasicAuthorization||pRequest.BasicAuthorization Set pRequest.BasicAuthorization = 1
        If ..Https||pRequest.Https Set pRequest.Https = 1
        If ..AuthCredentials'="" Set pRequest.AuthCredentials = ..AuthCredentials
        If ..TargetHost'="" Set pRequest.TargetHost = ..TargetHost
        If ..SSL'="" Set pRequest.SSL = ..SSL
        If '..SSLCheckServerIdentity||'pRequest.SSLCheckServerIdentity Set pRequest.SSLCheckServerIdentity = 0
        Set pResponse = ##class(custom.http.message).%New()
        Set tSC = pRequest.HttpCall(.pResponse,..Timeout,{"formatJsonBodyResponse":(..FormatJsonBodyResponse)})
        If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC) }
    }
    Catch(e) {
		Set tSC = e.AsStatus()
    }
    Quit tSC
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="custom.http.message">
        <Method>CallHttp</Method>
    </MapItem>
</MapItems>
}

}
