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
</Production>
}

}
