Class FHIRFacade.DTL.PacToFHIRPatient Extends Ens.DataTransformDTL [ DependsOn = (FHIRFacade.RES.ResTbPaciente, HS.FHIR.DTL.vR4.Model.Resource.Patient) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='FHIRFacade.RES.ResTbPaciente' targetClass='HS.FHIR.DTL.vR4.Model.Resource.Patient' create='new' language='objectscript' >
<assign value='source.Codigo' property='target.id' action='set' />
<assign value='source.Codigo' property='target.name.(1).id' action='set' />
<assign value='source.Sobrenome' property='target.name.(1).family' action='set' />
<assign value='source.Nome' property='target.name.(1).given.(1)' action='set' />
<assign value='source.Sexo' property='target.gender' action='set' />
</transform>
}

}
