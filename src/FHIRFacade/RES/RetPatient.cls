Class FHIRFacade.RES.RetPatient Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor)
{

Property JSON As %Library.DynamicObject;

Property JSONStr As %String(MAXLEN = 25000, TRUNCATE = 1);

Storage Default
{
<Data name="JSON">
<Attribute>JSON</Attribute>
<Structure>node</Structure>
<Subscript>"JSON"</Subscript>
</Data>
<Data name="RetPatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>JSONStr</Value>
</Value>
</Data>
<DataLocation>^FHIRFacade.RES.RetPatientD</DataLocation>
<DefaultData>RetPatientDefaultData</DefaultData>
<IdLocation>^FHIRFacade.RES.RetPatientD</IdLocation>
<IndexLocation>^FHIRFacade.RES.RetPatientI</IndexLocation>
<StreamLocation>^FHIRFacade.RES.RetPatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
