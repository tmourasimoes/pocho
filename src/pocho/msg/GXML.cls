Class pocho.msg.GXML Extends (%Persistent, %Populate, %XML.Adaptor)
{

Property Nome As %String(XMLPROJECTION = "NONE");

Property CPF As %String(XMLPROJECTION = "ATTRIBUTE");

Property Telefone As %String;

Storage Default
{
<Data name="GXMLDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Nome</Value>
</Value>
<Value name="3">
<Value>CPF</Value>
</Value>
<Value name="4">
<Value>Telefone</Value>
</Value>
</Data>
<DataLocation>^pocho.msg.GXMLD</DataLocation>
<DefaultData>GXMLDefaultData</DefaultData>
<IdLocation>^pocho.msg.GXMLD</IdLocation>
<IndexLocation>^pocho.msg.GXMLI</IndexLocation>
<StreamLocation>^pocho.msg.GXMLS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
