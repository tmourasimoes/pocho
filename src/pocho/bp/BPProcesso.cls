/// 
Class pocho.bp.BPProcesso Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='pocho.msg.RequestPaciente' response='pocho.msg.ResponsePaciente' height='2000' width='2000' >
<sequence xend='200' yend='550' >
<trace name='Inicio' value='"Inicio Processo Paciente"' xpos='200' ypos='250' />
<call name='Chamada BOBanco' target='BOBanco' async='0' xpos='200' ypos='350' >
<request type='pocho.msg.RequestPaciente' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='pocho.msg.ResponsePaciente' >
<assign property="callresponse" value="response" action="set" />
</response>
</call>
<trace name='Fim' value='"Fim Processo Paciente"' xpos='200' ypos='450' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
