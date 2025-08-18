Class FHIRFacade.DTL.FHIRInterop Extends Ens.DataTransformDTL [ DependsOn = (HS.FHIRServer.Interop.Request, HS.FHIRServer.Interop.Response) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HS.FHIRServer.Interop.Request' targetClass='HS.FHIRServer.Interop.Response' create='new' language='objectscript' >
<assign value='source.HSCoreVersion' property='target.HSCoreVersion' action='set' />
<assign value='source.HSMinVersion' property='target.HSMinVersionError' action='set' />
<assign value='source.QuickStreamId' property='target.QuickStreamId' action='set' />
</transform>
}

}
