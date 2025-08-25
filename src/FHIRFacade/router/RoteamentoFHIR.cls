/// 
Class FHIRFacade.router.RoteamentoFHIR Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="FHIRFacade.Production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="RoteamentoFHIR" disabled="false">
<constraint name="source" value="BSPatient"></constraint>
<constraint name="msgClass" value="FHIRFacade.REQ.ReqFHIRJSON"></constraint>
<when condition="RedirecionarRota(Document,&quot;Patient&quot;)" comment="">
<send transform="" target="BPFHIRDynamic"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
