/// 
Class FHIRFacade.BP.BPConsultarPaciente Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='FHIRFacade.REQ.ReqTbPaciente' response='FHIRFacade.RES.ResJSON' height='2000' width='2000' >
<context>
<property name='TbPaciente' type='FHIRFacade.RES.ResTbPaciente' initialexpression='""' instantiate='0' />
<property name='FHIRPaciente' type='HS.FHIR.DTL.vR4.Model.Resource.Patient' initialexpression='""' instantiate='0' />
</context>
<sequence xend='200' yend='750' >
<trace name='TrcEntrada' value='request' xpos='200' ypos='250' />
<call name='CallPaciente' target='AcessoDBPostgres' async='0' xpos='200' ypos='350' >
<request type='FHIRFacade.REQ.ReqTbPaciente' >
<assign property="callrequest.Codigo" value="request.Codigo" action="set" />
</request>
<response type='FHIRFacade.RES.ResTbPaciente' >
<assign property="context.TbPaciente" value="callresponse" action="set" />
</response>
</call>
<transform name='DTLPacToFHIR' class='FHIRFacade.DTL.PacToFHIRPatient' source='context.TbPaciente' target='context.FHIRPaciente' xpos='200' ypos='450' />
<code name='ObjToJSON' xpos='200' ypos='550' >
<![CDATA[ Set response.JSON = {}.%FromJSON(context.FHIRPaciente.ToJSON())]]>
</code>
<trace name='TrcRetorno' value='"Resultado..:"_response.JSON.%ToJSON()' xpos='200' ypos='650' />
</sequence>
</process>
}

}
