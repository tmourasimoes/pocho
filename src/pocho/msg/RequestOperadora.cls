Class demoho.msg.RequestOperadora Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property IdOperadora As %String;

Storage Default
{
<Data name="RequestOperadoraDefaultData">
<Subscript>"RequestOperadora"</Subscript>
<Value name="1">
<Value>IdOperadora</Value>
</Value>
</Data>
<DefaultData>RequestOperadoraDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
