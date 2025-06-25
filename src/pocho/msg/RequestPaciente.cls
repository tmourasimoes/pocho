Class pocho.msg.RequestPaciente Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "pocho.msg.ResponsePaciente";

Property CPF As %String;

Storage Default
{
<Data name="RequestPacienteDefaultData">
<Subscript>"RequestPaciente"</Subscript>
<Value name="1">
<Value>CPF</Value>
</Value>
</Data>
<DefaultData>RequestPacienteDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
