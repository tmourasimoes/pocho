Class pocho.msg.RequestQuantidadeAgenda Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "pocho.msg.ResponseQuantidadeAgenda";

Property CdAgenda As %String;

Property CPF As %String;

Property CdClassificaoAgenda As %String;

Property Data As %String;

Storage Default
{
<Data name="RequestQuantidadeAgendaDefaultData">
<Subscript>"RequestQuantidadeAgenda"</Subscript>
<Value name="1">
<Value>CdAgenda</Value>
</Value>
<Value name="2">
<Value>CPF</Value>
</Value>
<Value name="3">
<Value>CdClassificaoAgenda</Value>
</Value>
<Value name="4">
<Value>Data</Value>
</Value>
</Data>
<DefaultData>RequestQuantidadeAgendaDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
