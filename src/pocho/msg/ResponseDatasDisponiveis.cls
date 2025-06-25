Class pocho.msg.ResponseDatasDisponiveis Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property Datas As list Of pocho.obj.DataDisponivel;

Storage Default
{
<Data name="ResponseDatasDisponiveisDefaultData">
<Subscript>"ResponseDatasDisponiveis"</Subscript>
<Value name="1">
<Value>Datas</Value>
</Value>
</Data>
<DefaultData>ResponseDatasDisponiveisDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
