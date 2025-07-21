Class pocho.restclient.cepRequest Extends Ens.Request
{

Property cep As %String(MAXLEN = "");

Storage Default
{
<Data name="cepRequestDefaultData">
<Subscript>"cepRequest"</Subscript>
<Value name="1">
<Value>cep</Value>
</Value>
</Data>
<DefaultData>cepRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
