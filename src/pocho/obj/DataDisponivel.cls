Class pocho.obj.DataDisponivel Extends (%SerialObject, %XML.Adaptor)
{

Property NRSEQUENCIAINTERNOAGENDA As %String;

Property HORARIO As %String;

Property DATA As %String;

Property CDAGENDA As %String;

Storage Default
{
<Data name="DataDisponivelState">
<Value name="1">
<Value>NRSEQUENCIAINTERNOAGENDA</Value>
</Value>
<Value name="2">
<Value>HORARIO</Value>
</Value>
<Value name="3">
<Value>DATA</Value>
</Value>
<Value name="4">
<Value>CDAGENDA</Value>
</Value>
</Data>
<State>DataDisponivelState</State>
<StreamLocation>^pocho.obj.DataDisponivelS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
