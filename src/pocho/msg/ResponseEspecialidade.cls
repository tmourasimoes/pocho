Class pocho.msg.ResponseEspecialidade Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Especialidades As list Of pocho.obj.Especialidade;

Storage Default
{
<Data name="ResponseEspecialidadeDefaultData">
<Subscript>"ResponseEspecialidade"</Subscript>
<Value name="1">
<Value>Especialidades</Value>
</Value>
</Data>
<DefaultData>ResponseEspecialidadeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
