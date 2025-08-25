/// 
Class FHIRFacade.BP.BPFHIRDynamic Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='FHIRFacade.REQ.ReqFHIRJSON' response='FHIRFacade.RES.ResJSON' height='2000' width='2000' >
<context>
<property name='FHIRObj' type='HS.FHIR.DTL.vR4.Model.Resource.Patient' initialexpression='""' instantiate='0' />
<property name='FHIRObjRet' type='HS.FHIR.DTL.vR4.Model.Resource.Patient' initialexpression='""' instantiate='0' />
<property name='ObjPac' type='FHIRFacade.REQ.InserirPaciente' initialexpression='""' instantiate='0' />
<property name='RetIsGravou' type='FHIRFacade.RES.IsGravou' initialexpression='""' instantiate='0' />
</context>
<sequence xend='200' yend='1250' >
<trace name='FHIRRersource' value='"Trc...:FHIRResource"_request.JSON.%ToJSON()' xpos='200' ypos='250' />
<trace name='TrcResource' value='"Resource...:"_request.ResourceName' xpos='200' ypos='350' />
<trace name='TrcresourceType' value='"resourceType..:"_request.resourceType' xpos='200' ypos='450' />
<code name='CnvFHIRtoOBJ' xpos='200' ypos='550' >
<![CDATA[ Do ##class(Ens.Util.JSON).JSONStreamToObject(request.JSON.%ToJSON(), .pRet, request.ResourceName, 0)
 Set context.FHIRObj = pRet

 ]]>
</code>
<trace name='TrcFHIR' value='"TrcFHIR....:" _ context.FHIRObj' xpos='200' ypos='650' />
<transform name='FHIRtoFHIR' class='FHIRFacade.DTL.FHIRToFHIR' source='context.FHIRObj' target='context.ObjPac' xpos='200' ypos='750' />
<call name='InserirPac' target='AcessoDBPostgres' async='0' xpos='200' ypos='850' >
<request type='FHIRFacade.REQ.InserirPaciente' >
<assign property="callrequest.Codigo" value="context.ObjPac.Codigo" action="set" />
<assign property="callrequest.Nome" value="context.ObjPac.Nome" action="set" />
<assign property="callrequest.Sobrenome" value="context.ObjPac.Sobrenome" action="set" />
<assign property="callrequest.Sexo" value="context.ObjPac.Sexo" action="set" />
</request>
<response type='FHIRFacade.RES.IsGravou' >
<assign property="context.RetIsGravou.IsGravou" value="callresponse.IsGravou" action="set" />
<assign property="context.RetIsGravou.DsErro" value="callresponse.DsErro" action="set" />
</response>
</call>
<code name='SetRet' xpos='200' ypos='950' disabled="true">
<![CDATA[ set response.JSON = {}.%FromJSON(context.FHIRObj.ToJSON()) ]]>
</code>
<code name='SetRet2' xpos='200' ypos='1050' >
<![CDATA[ do context.RetIsGravou.%JSONExportToString(.pW)
 Set response.JSON = {}.%FromJSON(pW)]]>
</code>
<trace name='Fim' value='"Fim processo."' xpos='200' ypos='1150' />
</sequence>
</process>
}

/// BPL Definition

}
