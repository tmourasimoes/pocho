Class pocho.obj.RegraPermiteAgenda Extends (%SerialObject, %XML.Adaptor)
{

Property CDAGENDA As %String;

Property HORAINICIOREGRA As %String;

Property HORAFIMREGRA As %String;

Property DIASEMANAREGRA As %String;

Property CDCONVENIO As %String;

Storage Default
{
<Data name="RegraPermiteAgendaState">
<Value name="1">
<Value>CDAGENDA</Value>
</Value>
<Value name="2">
<Value>HORAINICIOREGRA</Value>
</Value>
<Value name="3">
<Value>HORAFIMREGRA</Value>
</Value>
<Value name="4">
<Value>DIASEMANAREGRA</Value>
</Value>
<Value name="5">
<Value>CDCONVENIO</Value>
</Value>
</Data>
<State>RegraPermiteAgendaState</State>
<StreamLocation>^pocho.obj.RegraPermiteAgendaS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
