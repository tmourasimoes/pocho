Class FHIRFacade.REQ.FindPatientByInternalId Extends (%Persistent, Ens.Request, %JSON.Adaptor, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "FHIRFacade.RES.FindPatient";

Property PatientInternalId As %String;

Storage Default
{
<Data name="FindPatientByInternalIdDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientInternalId</Value>
</Value>
</Data>
<DataLocation>^FHIRFacade8FDF.FindPatient8E41D</DataLocation>
<DefaultData>FindPatientByInternalIdDefaultData</DefaultData>
<IdLocation>^FHIRFacade8FDF.FindPatient8E41D</IdLocation>
<IndexLocation>^FHIRFacade8FDF.FindPatient8E41I</IndexLocation>
<StreamLocation>^FHIRFacade8FDF.FindPatient8E41S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
