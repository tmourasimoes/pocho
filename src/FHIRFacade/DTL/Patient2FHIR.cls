Class FHIRFacade.DTL.Patient2FHIR Extends Ens.DataTransformDTL [ DependsOn = (FHIRFacade.RES.FindPatient, HS.FHIR.DTL.vR4.Model.Resource.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='FHIRFacade.RES.FindPatient' targetClass='HS.FHIR.DTL.vR4.Model.Resource.Patient' create='new' language='objectscript' >
<assign value='source.SSN' property='target.identifier.(1).value' action='set' />
<assign value='"SSN"' property='target.identifier.(1).type.text' action='set' />
<assign value='##class(FHIRFacade.DateToString).ConvertDateToString(source.DOB)' property='target.birthDate' action='set' />
<assign value='source.Gender' property='target.gender' action='set' />
<assign value='source.LastName' property='target.name.(1).family' action='set' />
<assign value='source.FirstName' property='target.name.(1).given.(1)' action='set' />
<assign value='source.Deceased' property='target.deceasedBoolean' action='set' />
</transform>
}

}
