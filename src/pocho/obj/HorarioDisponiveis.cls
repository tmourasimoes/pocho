Class pocho.obj.HorarioDisponiveis Extends (%SerialObject, %XML.Adaptor)
{

Property NRSEQUENCIAINTERNOAGENDA As %String;

Property HORARIO As %String;

Property DATA As %String;

Property CDAGENDA As %String;

Storage Default
{
<Data name="HorarioDisponiveisState">
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
<State>HorarioDisponiveisState</State>
<StreamLocation>^pocho.obj.HorarioDisponiveisS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
