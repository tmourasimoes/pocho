Class demoho.msg.RequestEspecialidades Extends (Ens.Request, %JSON.Adaptor, %Persistent, %XML.Adaptor)
{

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
