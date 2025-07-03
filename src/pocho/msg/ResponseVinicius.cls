Class pocho.msg.ResponseVinicius Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property IsGravou As %Boolean;

Storage Default
{
<Data name="ResponseViniciusDefaultData">
<Subscript>"ResponseVinicius"</Subscript>
<Value name="1">
<Value>IsGravou</Value>
</Value>
</Data>
<DefaultData>ResponseViniciusDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
