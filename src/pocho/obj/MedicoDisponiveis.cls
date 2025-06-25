Class pocho.obj.MedicoDisponiveis Extends (%SerialObject, %XML.Adaptor)
{

Property IDMEDICO As %String;

Property HORARIO As %String;

Property DATA As %String;

Property IDESPECIALIDADE As %String;

Property NRSEQAREAATUACAO As %String;

Property CDAGENDA As %String;

Storage Default
{
<Data name="MedicoDisponiveisState">
<Value name="1">
<Value>IDMEDICO</Value>
</Value>
<Value name="2">
<Value>HORARIO</Value>
</Value>
<Value name="3">
<Value>DATA</Value>
</Value>
<Value name="4">
<Value>IDESPECIALIDADE</Value>
</Value>
<Value name="5">
<Value>NRSEQAREAATUACAO</Value>
</Value>
<Value name="6">
<Value>CDAGENDA</Value>
</Value>
</Data>
<State>MedicoDisponiveisState</State>
<StreamLocation>^pocho.obj.MedicoDisponiveisS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
