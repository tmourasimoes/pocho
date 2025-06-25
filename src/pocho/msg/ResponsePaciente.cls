Class pocho.msg.ResponsePaciente Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Pacientes As list Of pocho.obj.Paciente;

Storage Default
{
<Data name="ResponsePacienteDefaultData">
<Subscript>"ResponsePaciente"</Subscript>
<Value name="1">
<Value>Pacientes</Value>
</Value>
</Data>
<DefaultData>ResponsePacienteDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
