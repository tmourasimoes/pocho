Class FHIRFacade.RES.FindPatient Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor)
{

/// whether found patient
Property PatientFound As %Boolean;

Property InternalId As %Integer;

Property FirstName As %String;

Property LastName As %String;

Property SSN As %String;

Property Gender As %String;

Property DOB As %String;

Property Deceased As %Boolean;

Storage Default
{
<Data name="FindPatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientFound</Value>
</Value>
<Value name="3">
<Value>InternalId</Value>
</Value>
<Value name="4">
<Value>FirstName</Value>
</Value>
<Value name="5">
<Value>LastName</Value>
</Value>
<Value name="6">
<Value>SSN</Value>
</Value>
<Value name="7">
<Value>Gender</Value>
</Value>
<Value name="8">
<Value>DOB</Value>
</Value>
<Value name="9">
<Value>Deceased</Value>
</Value>
</Data>
<DataLocation>^FHIRFacade.RES.FindPatientD</DataLocation>
<DefaultData>FindPatientDefaultData</DefaultData>
<IdLocation>^FHIRFacade.RES.FindPatientD</IdLocation>
<IndexLocation>^FHIRFacade.RES.FindPatientI</IndexLocation>
<StreamLocation>^FHIRFacade.RES.FindPatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
