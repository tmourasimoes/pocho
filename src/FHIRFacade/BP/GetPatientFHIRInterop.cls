/// 
Class FHIRFacade.BP.GetPatientFHIRInterop Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HS.FHIRServer.Interop.Request' response='HS.FHIRServer.Interop.Response' height='2000' width='2000' >
<context>
<property name='PatientInfo' type='FHIRFacade.RES.FindPatient' instantiate='0' />
<property name='PatientResource' type='HS.FHIR.DTL.vR4.Model.Resource.Patient' instantiate='0' />
<property name='ResourceId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1450' >
<assign name="Resource Id" property="context.ResourceId" value="$Piece(request.Request.RequestPath,&quot;/&quot;,2)" action="set" xpos='200' ypos='250' />
<if name='No Resource Id?' condition='context.ResourceId=""' xpos='200' ypos='350' xend='200' yend='1350' >
<true>
<assign name="Not Found Response" property="response.Response.Status" value="404" action="set" xpos='200' ypos='500' />
</true>
<false>
<call name='Get Patient Info' target='BOPatient' async='0' xpos='470' ypos='500' >
<annotation><![CDATA[Call out to Data Source to fetch patient data]]></annotation>
<request type='FHIRFacade.REQ.FindPatientByInternalId' >
<assign property="callrequest.PatientInternalId" value="context.ResourceId" action="set" />
</request>
<response type='FHIRFacade.RES.FindPatient' >
<assign property="context.PatientInfo" value="callresponse" action="set" />
</response>
</call>
<if name='Patient Found?' condition='context.PatientInfo.PatientFound' xpos='470' ypos='600' xend='470' yend='1250' >
<annotation><![CDATA[Was the patient found in the DB?]]></annotation>
<true>
<trace name='IsFound' value='"1"' xpos='740' ypos='750' />
<transform name='Patient Info to Resource' class='FHIRFacade.DTL.Patient2FHIR' source='context.PatientInfo' target='context.PatientResource' xpos='740' ypos='850' >
<annotation><![CDATA[Transform the Patient info returned into a FHIR Patient Resource]]></annotation>
</transform>
<trace name='Patient' value='"Paciente:"_context.PatientInfo.PatientFound' xpos='740' ypos='950' />
<transform name='FHIRInterop' class='FHIRFacade.DTL.FHIRInterop' source='request' target='response' xpos='740' ypos='1050' />
<code name='SetObjJSON2' xpos='740' ypos='1150' >
<![CDATA[ set response.Response.Json = {}.%FromJSON(context.PatientResource.ToJSON()) ]]>
</code>
</true>
<false>
<assign name="Not Found Response" property="response.Response.Status" value="404" action="set" xpos='470' ypos='750' />
</false>
</if>
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
