Class FHIRFacade.DB.FHIRFacadePatient Extends %Persistent
{

Property InternalId As %Integer;

Property SSN As %String;

Property FirstName As %String;

Property LastName As %String;

Property DOB As %String;

Property Gender As %String;

Property Deceased As %String;

Storage Default
{
<Data name="FHIRFacadePatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>InternalId</Value>
</Value>
<Value name="3">
<Value>SSN</Value>
</Value>
<Value name="4">
<Value>FirstName</Value>
</Value>
<Value name="5">
<Value>LastName</Value>
</Value>
<Value name="6">
<Value>DOB</Value>
</Value>
<Value name="7">
<Value>Gender</Value>
</Value>
<Value name="8">
<Value>Deceased</Value>
</Value>
</Data>
<DataLocation>^FHIRFacade.DB.FHIRFacadePF282D</DataLocation>
<DefaultData>FHIRFacadePatientDefaultData</DefaultData>
<IdLocation>^FHIRFacade.DB.FHIRFacadePF282D</IdLocation>
<IndexLocation>^FHIRFacade.DB.FHIRFacadePF282I</IndexLocation>
<StreamLocation>^FHIRFacade.DB.FHIRFacadePF282S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
