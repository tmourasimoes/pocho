Class pocho.msg.ResponseHorarioDisponiveis Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Horarios As list Of pocho.obj.HorarioDisponiveis;

Storage Default
{
<Data name="ResponseHorarioDisponiveisDefaultData">
<Subscript>"ResponseHorarioDisponiveis"</Subscript>
<Value name="1">
<Value>Horarios</Value>
</Value>
</Data>
<DefaultData>ResponseHorarioDisponiveisDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
