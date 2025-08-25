/// 
Class FHIRFacade.BP.GetPatient Extends Ens.BusinessProcessBPL
{

Property DataSourceSystem As %String(VALUELIST = ",REST API,MS SQL");

Parameter SETTINGS = "DataSourceSystem";

Storage Default
{
<Data name="GetPatientDefaultData">
<Subscript>"GetPatient"</Subscript>
<Value name="1">
<Value>DataSourceSystem</Value>
</Value>
</Data>
<DefaultData>GetPatientDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='FHIRFacade.RES.RetPatient' height='2000' width='2000' >
<context>
<property name='PatientInfo' type='FHIRFacade.RES.FindPatient' instantiate='0' />
<property name='PatientResource' type='HS.FHIR.DTL.vR4.Model.Resource.Patient' instantiate='0' />
<property name='JSONPayloadStream' type='%Library.DynamicObject' instantiate='0' />
<property name='ResourceId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1450' >
<assign name="PId" property="context.ResourceId" value="request.PatientInternalId" action="set" xpos='200' ypos='350' />
<if name='No Resource Id?' condition='context.ResourceId=""' xpos='200' ypos='450' xend='200' yend='1350' >
<true>
<assign name="Not Found Response" property="response.Response.Status" value="404" action="set" xpos='200' ypos='600' />
</true>
<false>
<call name='Get Patient Info' target='BOPatient' async='0' xpos='470' ypos='600' >
<annotation><![CDATA[Call out to Data Source to fetch patient data]]></annotation>
<request type='FHIRFacade.REQ.FindPatientByInternalId' >
<assign property="callrequest.PatientInternalId" value="context.ResourceId" action="set" />
</request>
<response type='FHIRFacade.RES.FindPatient' >
<assign property="context.PatientInfo" value="callresponse" action="set" />
</response>
</call>
<if name='Patient Found?' condition='context.PatientInfo.PatientFound' xpos='470' ypos='700' xend='470' yend='1250' >
<annotation><![CDATA[Was the patient found in the DB?]]></annotation>
<true>
<trace name='Encontrou' value='"1"' xpos='740' ypos='850' />
<transform name='Patient Info to Resource' class='FHIRFacade.DTL.Patient2FHIR' source='context.PatientInfo' target='context.PatientResource' xpos='740' ypos='950' >
<annotation><![CDATA[Transform the Patient info returned into a FHIR Patient Resource]]></annotation>
</transform>
<trace name='Paciente' value='"Paciente:"_context.PatientInfo.PatientFound' xpos='740' ypos='1050' />
<code name='SetObjJSON2' xpos='740' ypos='1150' >
<![CDATA[ set response.JSON = {}.%FromJSON(context.PatientResource.ToJSON()) ]]>
</code>
</true>
<false>
<assign name="Not Found Response" property="response.Response.Status" value="404" action="set" xpos='470' ypos='850' />
</false>
</if>
</false>
</if>
</sequence>
</process>
}

}
