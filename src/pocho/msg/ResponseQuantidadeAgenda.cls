Class pocho.msg.ResponseQuantidadeAgenda Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Agendas As list Of pocho.obj.PacienteAgendaCPF;

Storage Default
{
<Data name="ResponseQuantidadeAgendaDefaultData">
<Subscript>"ResponseQuantidadeAgenda"</Subscript>
<Value name="1">
<Value>Agendas</Value>
</Value>
</Data>
<DefaultData>ResponseQuantidadeAgendaDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
