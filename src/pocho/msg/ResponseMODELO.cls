Class pocho.msg.ResponseMODELO Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

// Property Pacientes As list Of pocho.obj.Paciente;

Property IdEspecialidades As %String;

Storage Default
{
<Data name="ResponseMODELODefaultData">
<Subscript>"ResponseMODELO"</Subscript>
<Value name="1">
<Value>IdEspecialidades</Value>
</Value>
</Data>
<DefaultData>ResponseMODELODefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
