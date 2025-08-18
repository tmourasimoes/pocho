Class FHIRFacade.RES.IsGravou Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property IsGravou As %Boolean;

Property DsErro As %String(MAXLEN = 255);

Storage Default
{
<Data name="IsGravouDefaultData">
<Subscript>"IsGravou"</Subscript>
<Value name="1">
<Value>IsGravou</Value>
</Value>
<Value name="2">
<Value>DsErro</Value>
</Value>
</Data>
<DefaultData>IsGravouDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
