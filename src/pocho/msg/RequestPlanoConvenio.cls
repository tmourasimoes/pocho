Class demoho.msg.RequestPlanoConvenio Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

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
