Class pocho.msg.RequestVinicius Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "pocho.msg.ResponseVinicius";

Property CPF As %String;

Property NOME As %String;

Property CPIdade As %String;

Storage Default
{
<Data name="RequestViniciusDefaultData">
<Subscript>"RequestVinicius"</Subscript>
<Value name="1">
<Value>CPF</Value>
</Value>
<Value name="2">
<Value>NOME</Value>
</Value>
<Value name="3">
<Value>CPIdade</Value>
</Value>
</Data>
<DefaultData>RequestViniciusDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
