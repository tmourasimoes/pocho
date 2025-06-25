Class pocho.msg.ResponseOperadora Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Operadoras As list Of pocho.obj.Operadora;

Storage Default
{
<Data name="ResponseOperadoraDefaultData">
<Subscript>"ResponseOperadora"</Subscript>
<Value name="1">
<Value>Operadoras</Value>
</Value>
</Data>
<DefaultData>ResponseOperadoraDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
