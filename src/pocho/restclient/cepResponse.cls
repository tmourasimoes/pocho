Class pocho.restclient.cepResponse Extends (Ens.Response, %JSON.Adaptor, %XML.Adaptor)
{

/// código postal
Property cep As %String(MAXLEN = "");

/// nome do logradouro
Property logradouro As %String(MAXLEN = "");

/// nome do logradouro (EXEMPLO DE DOC)
Property logradouro2 As %String(MAXLEN = "");

Property complemento As %String(MAXLEN = "");

Property unidade As %String(MAXLEN = "");

Property bairro As %String(MAXLEN = "");

Property localidade As %String(MAXLEN = "");

Property uf As %String(MAXLEN = "");

Property estado As %String(MAXLEN = "");

Property regiao As %String(MAXLEN = "");

Property ibge As %String(MAXLEN = "");

Property gia As %String(MAXLEN = "");

Property ddd As %String(MAXLEN = "");

Property siafi As %String(MAXLEN = "");

Storage Default
{
<Data name="cepResponseDefaultData">
<Subscript>"cepResponse"</Subscript>
<Value name="1">
<Value>cep</Value>
</Value>
<Value name="2">
<Value>logradouro</Value>
</Value>
<Value name="3">
<Value>complemento</Value>
</Value>
<Value name="4">
<Value>unidade</Value>
</Value>
<Value name="5">
<Value>bairro</Value>
</Value>
<Value name="6">
<Value>localidade</Value>
</Value>
<Value name="7">
<Value>uf</Value>
</Value>
<Value name="8">
<Value>estado</Value>
</Value>
<Value name="9">
<Value>regiao</Value>
</Value>
<Value name="10">
<Value>ibge</Value>
</Value>
<Value name="11">
<Value>gia</Value>
</Value>
<Value name="12">
<Value>ddd</Value>
</Value>
<Value name="13">
<Value>siafi</Value>
</Value>
<Value name="14">
<Value>logradouro2</Value>
</Value>
</Data>
<DefaultData>cepResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
