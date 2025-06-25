Class pocho.msg.RequestEspecialidades Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME As STRING = "pocho.msg.ResponseEspecialidade";

Property IdEspecialidades As %String;

Storage Default
{
<Data name="RequestEspecialidadesDefaultData">
<Subscript>"RequestEspecialidades"</Subscript>
<Value name="1">
<Value>IdEspecialidades</Value>
</Value>
</Data>
<DefaultData>RequestEspecialidadesDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
