Class pocho.msg.ResponseAtuacaoEspecialidade Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property AtuacaoEspecialidades As list Of pocho.obj.AtuacaoEspecialidade;

Storage Default
{
<Data name="ResponseAtuacaoEspecialidadeDefaultData">
<Subscript>"ResponseAtuacaoEspecialidade"</Subscript>
<Value name="1">
<Value>AtuacaoEspecialidades</Value>
</Value>
</Data>
<DefaultData>ResponseAtuacaoEspecialidadeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
