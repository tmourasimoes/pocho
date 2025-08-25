Class FHIRFacade.DTL.FHIRToFHIR Extends Ens.DataTransformDTL [ DependsOn = (HS.FHIR.DTL.vR4.Model.Resource.Patient, FHIRFacade.REQ.InserirPaciente) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.FHIR.DTL.vR4.Model.Resource.Patient' targetClass='FHIRFacade.REQ.InserirPaciente' create='new' language='objectscript' >
<assign value='source.name.(1).family' property='target.Sobrenome' action='set' />
<assign value='source.identifier.(1).value' property='target.Codigo' action='set' />
<assign value='source.name.(1).given.(1)' property='target.Nome' action='set' />
<assign value='source.gender' property='target.Sexo' action='set' />
</transform>
}

}
