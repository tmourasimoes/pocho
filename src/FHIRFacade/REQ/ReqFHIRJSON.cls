Class FHIRFacade.REQ.ReqFHIRJSON Extends (%Persistent, Ens.Request, %JSON.Adaptor, %XML.Adaptor)
{

Property JSON As %Library.DynamicObject;

Property ResourceName As %String;

Property resourceType As %String;

Storage Default
{
<Data name="JSON">
<Attribute>JSON</Attribute>
<Structure>node</Structure>
<Subscript>"JSON"</Subscript>
</Data>
<Data name="ReqFHIRJSONDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ResourceName</Value>
</Value>
<Value name="3">
<Value>resourceType</Value>
</Value>
</Data>
<DataLocation>^FHIRFacade.REQ.ReqFHIRJSOND</DataLocation>
<DefaultData>ReqFHIRJSONDefaultData</DefaultData>
<IdLocation>^FHIRFacade.REQ.ReqFHIRJSOND</IdLocation>
<IndexLocation>^FHIRFacade.REQ.ReqFHIRJSONI</IndexLocation>
<StreamLocation>^FHIRFacade.REQ.ReqFHIRJSONS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
