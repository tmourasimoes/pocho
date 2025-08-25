Class FHIRFacade.BO.PatientDB Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method FindPatientByInternalId(pRequest As FHIRFacade.REQ.FindPatientByInternalId, Output pResponse As FHIRFacade.RES.FindPatient) As %Status
{
    set pResponse = ##class(FHIRFacade.RES.FindPatient).%New()
    set pResponse.PatientFound = 0
    
    if ##class(FHIRFacade.DB.FHIRFacadePatient).%ExistsId(pRequest.PatientInternalId) {
		// Patient Found
        set obj=##class(FHIRFacade.DB.FHIRFacadePatient).%OpenId(pRequest.PatientInternalId)
        set pResponse.PatientFound 	= 1
        set pResponse.InternalId 	= obj.InternalId
        set pResponse.SSN 			= obj.SSN
        set pResponse.FirstName 	= obj.FirstName
        set pResponse.LastName 		= obj.LastName
        set pResponse.DOB 			= obj.DOB
        set pResponse.Gender 		= obj.Gender
        //set pResponse.Deceased 		= obj.Deceased
    }
    quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="FHIRFacade.REQ.FindPatientByInternalId">
        <Method>FindPatientByInternalId</Method>
    </MapItem>
    
</MapItems>
}

}
