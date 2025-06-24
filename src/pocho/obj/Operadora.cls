Class pocho.obj.Operadora Extends (%SerialObject, %XML.Adaptor)
{

Property NMOPERADORA As %String;

Property QTDIASRETORNO As %String;

Storage Default
{
<Data name="OperadoraState">
<Value name="1">
<Value>NMOPERADORA</Value>
</Value>
<Value name="2">
<Value>QTDIASRETORNO</Value>
</Value>
</Data>
<State>OperadoraState</State>
<StreamLocation>^pocho.obj.OperadoraS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
