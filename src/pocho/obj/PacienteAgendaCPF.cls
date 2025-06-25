Class pocho.obj.PacienteAgendaCPF Extends (%SerialObject, %XML.Adaptor)
{

Property DSSTATUSAGENDADSSTATUSAGENDA As %String;

Property CDAGENDA As %String;

Property CDCLASSIFICACAOAGENDA As %String;

Property DATA As %String;

Property CPF As %String;

Storage Default
{
<Data name="PacienteAgendaCPFState">
<Value name="1">
<Value>DSSTATUSAGENDADSSTATUSAGENDA</Value>
</Value>
<Value name="2">
<Value>CDAGENDA</Value>
</Value>
<Value name="3">
<Value>CDCLASSIFICACAOAGENDA</Value>
</Value>
<Value name="4">
<Value>DATA</Value>
</Value>
<Value name="5">
<Value>CPF</Value>
</Value>
</Data>
<State>PacienteAgendaCPFState</State>
<StreamLocation>^pocho.obj.PacienteAgendaCPFS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
