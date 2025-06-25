Class pocho.obj.Paciente Extends (%SerialObject, %XML.Adaptor)
{

Property IDPACIENTE As %String;

Property NOME As %String;

Storage Default
{
<Data name="PacienteState">
<Value name="1">
<Value>IDPACIENTE</Value>
</Value>
<Value name="2">
<Value>NOME</Value>
</Value>
</Data>
<State>PacienteState</State>
<StreamLocation>^pocho.obj.PacienteS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
