Class pocho.msg.RequestAgendaDisponivel Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property IdEspecialidades As %String;

Property NrAreaAtuacao As %String;

Property CdAgenda As %String;

Property CPF As %String;

Property Data As %String;

Property Horario As %String;

Property NrInternoAgenda As %String;

Storage Default
{
<Data name="RequestAgendaDisponivelDefaultData">
<Subscript>"RequestAgendaDisponivel"</Subscript>
<Value name="1">
<Value>IdEspecialidades</Value>
</Value>
<Value name="2">
<Value>NrAreaAtuacao</Value>
</Value>
<Value name="3">
<Value>CdAgenda</Value>
</Value>
<Value name="4">
<Value>CPF</Value>
</Value>
<Value name="5">
<Value>Data</Value>
</Value>
<Value name="6">
<Value>Horario</Value>
</Value>
<Value name="7">
<Value>NrINternoAgenda</Value>
</Value>
<Value name="8">
<Value>NrInternoAgenda</Value>
</Value>
<Value name="9">
<Value>NrInternoAgenda2</Value>
</Value>
</Data>
<DefaultData>RequestAgendaDisponivelDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
