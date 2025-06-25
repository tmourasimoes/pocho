Class pocho.msg.RequestAtuacaoEspecialidade Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "pocho.msg.ResponseAtuacaoEspecialidade";

Property IdEspecialidades As %String;

Property NrAreaAtuacao As %String;

Storage Default
{
<Data name="RequestAtuacaoEspecialidadeDefaultData">
<Subscript>"RequestAtuacaoEspecialidade"</Subscript>
<Value name="1">
<Value>IdEspecialidades</Value>
</Value>
<Value name="2">
<Value>NrAreaAtuacao</Value>
</Value>
</Data>
<DefaultData>RequestAtuacaoEspecialidadeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
