Class pocho.msg.RequestQuantidadeAgendamento Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property CdConvenio As %String;

Property CdAgenda As %String;

Property DiaSemanaRegra As %String;

Storage Default
{
<Data name="RequestQuantidadeAgendamentoDefaultData">
<Subscript>"RequestQuantidadeAgendamento"</Subscript>
<Value name="1">
<Value>CdConvenio</Value>
</Value>
<Value name="2">
<Value>CdAgenda</Value>
</Value>
<Value name="3">
<Value>DiaSemanaRegra</Value>
</Value>
</Data>
<DefaultData>RequestQuantidadeAgendamentoDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
