Class FHIRFacade.REQ.ReqTbPaciente Extends (%Persistent, Ens.Request, %JSON.Adaptor, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "FHIRFacade.RES.ResTbPaciente";

Property Codigo As %Integer;

Storage Default
{
<Data name="ReqTbPacienteDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Codigo</Value>
</Value>
</Data>
<DataLocation>^FHIRFacade.REQ.ReqTbPacienteD</DataLocation>
<DefaultData>ReqTbPacienteDefaultData</DefaultData>
<IdLocation>^FHIRFacade.REQ.ReqTbPacienteD</IdLocation>
<IndexLocation>^FHIRFacade.REQ.ReqTbPacienteI</IndexLocation>
<StreamLocation>^FHIRFacade.REQ.ReqTbPacienteS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
