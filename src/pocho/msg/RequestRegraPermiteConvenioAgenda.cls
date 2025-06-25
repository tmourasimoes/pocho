Class pocho.msg.RequestRegraPermiteConvenioAgenda Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property CdConvenio As %String;

Storage Default
{
<Data name="RequestRegraPermiteConvenioAgendaDefaultData">
<Subscript>"RequestRegraPermiteConvenioAgenda"</Subscript>
<Value name="1">
<Value>CdConvenio</Value>
</Value>
</Data>
<DefaultData>RequestRegraPermiteConvenioAgendaDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
