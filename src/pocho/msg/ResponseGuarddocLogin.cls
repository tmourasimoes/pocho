Class pocho.msg.ResponseGuarddocLogin Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property TOKEN As %String(MAXLEN = 500);

Property Success As %Boolean;

Storage Default
{
<Data name="ResponseGuarddocLoginDefaultData">
<Subscript>"ResponseGuarddocLogin"</Subscript>
<Value name="1">
<Value>TOKEN</Value>
</Value>
<Value name="2">
<Value>Success</Value>
</Value>
</Data>
<DefaultData>ResponseGuarddocLoginDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
