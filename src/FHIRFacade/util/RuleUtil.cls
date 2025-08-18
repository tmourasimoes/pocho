Class FHIRFacade.util.RuleUtil Extends Ens.Rule.FunctionSet
{

ClassMethod RedirecionarRota(pInput As FHIRFacade.REQ.ReqFHIRJSON, pModel As %String) As %Boolean
{
        #dim IsModelFHIR As %Boolean
        Set IsModelFHIR = 0

        $$$TRACE(pInput.resourceType)

        Try {

            if (pInput.resourceType = pModel)
            {
                Set IsModelFHIR = 1
            }
            if (pModel = "ALL")
            {
                Set IsModelFHIR = 0
            }
        }

        Catch tException {
            Set tSC = tException.AsStatus()
        }

        Return IsModelFHIR
}

}
