Class FHIRFacade.RES.ResTbPaciente Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor)
{

Property Codigo As %Integer;

Property Nome As %String;

Property Sobrenome As %String;

Property Sexo As %String;

Storage Default
{
<Data name="ResTbPacienteDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Codigo</Value>
</Value>
<Value name="3">
<Value>Nome</Value>
</Value>
<Value name="4">
<Value>Sobrenome</Value>
</Value>
<Value name="5">
<Value>Sexo</Value>
</Value>
</Data>
<DataLocation>^FHIRFacade.RES.ResTbPacienteD</DataLocation>
<DefaultData>ResTbPacienteDefaultData</DefaultData>
<IdLocation>^FHIRFacade.RES.ResTbPacienteD</IdLocation>
<IndexLocation>^FHIRFacade.RES.ResTbPacienteI</IndexLocation>
<StreamLocation>^FHIRFacade.RES.ResTbPacienteS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
