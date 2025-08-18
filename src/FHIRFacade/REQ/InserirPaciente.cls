Class FHIRFacade.REQ.InserirPaciente Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "FHIRFacade.RES.IsGravou";

Property Codigo As %Integer;

Property Nome As %String(MAXLEN = 255, TRUNCATE = 1);

Property Sobrenome As %String(MAXLEN = 255, TRUNCATE = 1);

Property Sexo As %String(MAXLEN = 255, TRUNCATE = 1);

Storage Default
{
<Data name="InserirPacienteDefaultData">
<Subscript>"InserirPaciente"</Subscript>
<Value name="1">
<Value>Codigo</Value>
</Value>
<Value name="2">
<Value>Nome</Value>
</Value>
<Value name="3">
<Value>Sobrenome</Value>
</Value>
<Value name="4">
<Value>Sexo</Value>
</Value>
</Data>
<DefaultData>InserirPacienteDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
