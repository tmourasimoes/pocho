Class pocho.msg.RequestHorariosDisponivel Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "pocho.msg.ResponseHorarioDisponiveis";

Property CdAgenda As %String;

Property Data As %String;

Storage Default
{
<Data name="RequestHorariosDisponivelDefaultData">
<Subscript>"RequestHorariosDisponivel"</Subscript>
<Value name="1">
<Value>CdAgenda</Value>
</Value>
<Value name="2">
<Value>Data</Value>
</Value>
</Data>
<DefaultData>RequestHorariosDisponivelDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
