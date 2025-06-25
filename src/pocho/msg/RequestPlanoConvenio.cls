Class pocho.msg.RequestPlanoConvenio Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As %String = "pocho.msg.ResponsePlanoConvenio";

Property CdConvenio As %String;

Property CdPlano As %String;

Storage Default
{
<Data name="RequestPlanoConvenioDefaultData">
<Subscript>"RequestPlanoConvenio"</Subscript>
<Value name="1">
<Value>CdConvenio</Value>
</Value>
<Value name="2">
<Value>CdPlano</Value>
</Value>
</Data>
<DefaultData>RequestPlanoConvenioDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
