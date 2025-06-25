Class pocho.msg.ResponseMedicosDisponiveis Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Medicos As list Of pocho.obj.MedicoDisponiveis;

Storage Default
{
<Data name="ResponseMedicosDisponiveisDefaultData">
<Subscript>"ResponseMedicosDisponiveis"</Subscript>
<Value name="1">
<Value>Medicos</Value>
</Value>
</Data>
<DefaultData>ResponseMedicosDisponiveisDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
