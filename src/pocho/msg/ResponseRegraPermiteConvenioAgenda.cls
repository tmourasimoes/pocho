Class pocho.msg.ResponseRegraPermiteConvenioAgenda Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Convenios As list Of pocho.obj.RegraPermiteAgenda;

Storage Default
{
<Data name="ResponseRegraPermiteConvenioAgendaDefaultData">
<Subscript>"ResponseRegraPermiteConvenioAgenda"</Subscript>
<Value name="1">
<Value>Convenios</Value>
</Value>
</Data>
<DefaultData>ResponseRegraPermiteConvenioAgendaDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
