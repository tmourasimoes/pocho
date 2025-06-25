Class pocho.msg.ResponsePlanoConvenio Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Convenios As list Of pocho.obj.PlanoConvenio;

Storage Default
{
<Data name="ResponsePlanoConvenioDefaultData">
<Subscript>"ResponsePlanoConvenio"</Subscript>
<Value name="1">
<Value>Convenios</Value>
</Value>
</Data>
<DefaultData>ResponsePlanoConvenioDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
