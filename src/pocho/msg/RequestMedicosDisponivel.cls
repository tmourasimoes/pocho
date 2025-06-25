Class pocho.msg.RequestMedicosDisponivel Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "pocho.msg.ResponseMedicosDisponiveis";

Property IdEspecialidades As %String;

Property NrAreaAtuacao As %String;

Storage Default
{
<Data name="RequestMedicosDisponivelDefaultData">
<Subscript>"RequestMedicosDisponivel"</Subscript>
<Value name="1">
<Value>IdEspecialidades</Value>
</Value>
<Value name="2">
<Value>NrAreaAtuacao</Value>
</Value>
</Data>
<DefaultData>RequestMedicosDisponivelDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
