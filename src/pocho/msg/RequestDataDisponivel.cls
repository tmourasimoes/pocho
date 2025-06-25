Class pocho.msg.RequestDataDisponivel Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "pocho.msg.ResponseDatasDisponiveis";

Property CdAgenda As %String;

Storage Default
{
<Data name="RequestDataDisponivelDefaultData">
<Subscript>"RequestDataDisponivel"</Subscript>
<Value name="1">
<Value>CdAgenda</Value>
</Value>
</Data>
<DefaultData>RequestDataDisponivelDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
