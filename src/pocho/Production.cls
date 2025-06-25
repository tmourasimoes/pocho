Class pocho.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="pocho.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="apiservice" Category="" ClassName="pocho.api.api" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="BOAtivo">AcessoDB</Setting>
    <Setting Target="Host" Name="ResourcePaciente">HS.FHIR.DTL.vR4.Model.Resource.Patient</Setting>
  </Item>
  <Item Name="apiPub.tracer.bs" Category="" ClassName="apiPub.tracer.bs" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="apiPub.tracer.bo" Category="" ClassName="apiPub.tracer.bo" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="JGS" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="apiPub.tracer.bm" Category="" ClassName="apiPub.tracer.bm" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="BOOracle" Category="" ClassName="pocho.bo.BOOracle" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="DSN">ORACLE</Setting>
    <Setting Target="Adapter" Name="JGService">JGS</Setting>
  </Item>
  <Item Name="pocho.wsdl.WSDLApi" Category="" ClassName="pocho.wsdl.WSDLApi" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="EnableStandardRequests">1</Setting>
  </Item>
  <Item Name="JGSPOSTGRE" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Port">55558</Setting>
  </Item>
  <Item Name="BOBanco" Category="" ClassName="pocho.bo.BOBanco" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Schema">public</Setting>
    <Setting Target="Adapter" Name="DSN">POSTGRES</Setting>
    <Setting Target="Adapter" Name="JGService">JGSPOSTGRE</Setting>
  </Item>
  <Item Name="pocho.wsdl.WSDL" Category="" ClassName="pocho.wsdl.WSDL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="EnableStandardRequests">1</Setting>
    <Setting Target="Adapter" Name="Port">1990</Setting>
    <Setting Target="Adapter" Name="JobPerConnection">0</Setting>
  </Item>
  <Item Name="BPProcesso" Category="" ClassName="pocho.bp.BPProcesso" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
</Production>
}

}
