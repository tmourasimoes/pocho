Class pocho.msg.ResponseRegraQuantidadeAgendamento Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Agendas As list Of pocho.obj.RegraQuantidadeAgenda;

Storage Default
{
<Data name="ResponseRegraQuantidadeAgendamentoDefaultData">
<Subscript>"ResponseRegraQuantidadeAgendamento"</Subscript>
<Value name="1">
<Value>Agendas</Value>
</Value>
</Data>
<DefaultData>ResponseRegraQuantidadeAgendamentoDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
