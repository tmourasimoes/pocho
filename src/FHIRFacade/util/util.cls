Class FHIRFacade.util.util Extends %RegisteredObject
{

ClassMethod RetornarResourceFHIR(pInput As %Library.DynamicObject) As %String
{
        Set tSC                  = ##class(Ens.Util.JSON).JSONStreamToObject(pInput.%ToJSON(), .pRet,, 0)
        Set pResource            = pRet.resourceType
        Set RetornoClassResource = "" 


        Try {

            Set RetornoClassResource = "HS.FHIR.DTL.vR4.Model.Resource."_pResource
        }

        Catch tException {
            Set tSC = tException.AsStatus()
        }

        Return RetornoClassResource
}

ClassMethod RetornarResourceType(pInput As %Library.DynamicObject) As %String
{
        Set tSC                  = ##class(Ens.Util.JSON).JSONStreamToObject(pInput.%ToJSON(), .pRet,, 0)
        Return pRet.resourceType
}

/// Converte EnsLib.SQL.Snapshot para %Library.DynamicObject
ClassMethod SnapToDyna(pInput As EnsLib.SQL.Snapshot) As %Library.DynamicObject
{
        Set pOutput = {"Response":[]}
                
        while pInput.Next() {
            set tObj = {}
            
            for x=1:1:pInput.GetColumnCount() 
            {
                Set tVal =  pInput.GetData(x)
                Set tCol =  pInput.GetColumnName(x)
                
                If ((pInput.GetColumnType(x) = "BIGINT") || (pInput.GetColumnType(x) = "INTEGER") || (pInput.GetColumnType(x) = "DECIMAL")  || (pInput.GetColumnType(x) = "NUMERIC" ))
                {
                    Do tObj.%Set(tCol,+tVal,"number")
                }
                elseif (pInput.GetColumnType(x) = "BOOLEAN")
                {
                    Do tObj.%Set(tCol,tVal, "boolean")
                }
                else
                {
                    Do tObj.%Set(tCol,tVal)
                }
                
                
                //Write tVal,",", tCol ,",", pInput.GetColumnType(x),  ! 
            }

            do pOutput.%Get("Response").%Push(tObj)           
        }
        
        return pOutput
}

// Converter arquivo em Base65

ClassMethod ConverterArquivoToBase64(pCaminhoArquivo As %String(MAXLEN=1000)) As %GlobalCharacterStream
{
	
	Set stream=##class(%Library.FileCharacterStream).%New()
	Set stream.Filename=pCaminhoArquivo
	Set line = ""
	Do stream.Rewind()
	
    While 'stream.AtEnd {
		Set line=line_stream.ReadLine()
    }
    
    Set BinaryText		=	$ZCONVERT(line,"O","UTF8")
	Set Base64Encoded	=	$system.Encryption.Base64Encode(BinaryText)
	
	set tStream = ##class(%GlobalCharacterStream).%New()
	Do tStream.WriteLine(Base64Encoded)		
	
	Quit tStream
}

// Print BASE65

ClassMethod CarregarBase64(pStreamArquivo As %GlobalCharacterStream) As %String
{
	Do pStreamArquivo.Rewind()
		
	Set tLine = ""
	While 'pStreamArquivo.AtEnd
	{
		Set tLine = tLine _ pStreamArquivo.ReadLine()
	}
	
	
	return tLine
}

ClassMethod CarregarString(pStreamArquivo As %Library.DynamicObject) As %String
{
	Do pStreamArquivo.Rewind()
		
	Set tLine = ""
	While 'pStreamArquivo.AtEnd
	{
		Set tLine = tLine _ pStreamArquivo.ReadLine()
	}
	
	
	return tLine
}

ClassMethod ConverterGCSToString(pEntrada As %Stream) As %String
{
	Do pEntrada.Rewind()
	Set tObjGBS = ##class(%Stream).%New()
	set lenBloco = 5700 //Para gravação do PDF em blocos
	While 'pEntrada.AtEnd {
		Do tObjGBS.Write(pEntrada.Read(lenBloco))
	}
	Do tObjGBS.Rewind()
	Quit tObjGBS.Read()
}

}
