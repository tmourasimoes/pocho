Class FHIRFacade.RES.ResJSON Extends (Ens.Response, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Property JSON As %Library.DynamicObject;

Storage Default
{
<Data name="JSON">
<Attribute>JSON</Attribute>
<Structure>node</Structure>
<Subscript>"FHIRFacade.RES.ResJSON.JSON"</Subscript>
</Data>
<Type>%Storage.Persistent</Type>
}

}
