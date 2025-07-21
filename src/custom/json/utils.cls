Class custom.json.utils Extends %RegisteredObject
{

ClassMethod s(ByRef pJSON As %Library.DynamicObject, pNodePath As %String, pValue As %Library.DynamicObject, pType As %String = "", pDelim As %String = ".", pInferBoolean As %Boolean = 1) As %Status [ SqlProc ]
{
    Quit ..set(pJSON, pNodePath, pValue, pType, pDelim, pInferBoolean)
}

ClassMethod g(pJSON As %Library.DynamicObject, pNodePath As %String, pDelim As %String = ".") As %Library.DynamicObject [ SqlProc ]
{
    Quit ..get(pJSON, pNodePath, pDelim)
}

ClassMethod i(object, path As %String = "", Output idx, Output val, ByRef iterator, delim As %String = ".", ByRef pathObj) As %Boolean
{
    Quit ..iterate(object, path, .idx, .val, .iterator, delim, .pathObj)
}

ClassMethod r(pJSON As %Library.DynamicObject, pNodePath As %String, pDelim As %String = ".") As %Library.DynamicObject
{
    Quit ..remove(pJSON, pNodePath, pDelim)
}

ClassMethod nvl(value As %Library.DynamicObject, rplValue As %Library.DynamicObject) As %Library.DynamicObject [ SqlProc ]
{
    If (('$Data(value))||(value="")) quit rplValue
    Quit value
}

ClassMethod remove(pJSON As %Library.DynamicObject, pNodePath As %String, pDelim As %String = ".") As %Library.DynamicObject
{
    Set tRef=""
    Try
	{
        Set pNodePath = $Tr(pNodePath,"[]",pDelim)
        Set tRef=pJSON
        If pNodePath="" Quit
        For i=1:1:$Length(pNodePath,pDelim) {
            If $ClassName(tRef)'["%Library.Dynamic" Quit
            If $ClassName(tRef)="%Library.DynamicArray",$Piece(pNodePath,pDelim,i)'=+$Piece(pNodePath,pDelim,i) Quit
            If i=$Length(pNodePath,pDelim) {
                If tRef.%Get($Piece(pNodePath,pDelim,i))'="" Do tRef.%Remove($Piece(pNodePath,pDelim,i))
            } Else {
                Set tRef=tRef.%Get($Piece(pNodePath,pDelim,i))
            }
            If tRef="" Quit
        }
    }
	Catch(e)
	{
        Set tSC = e.AsStatus()
	}
    Quit pJSON
}

ClassMethod iterate(object, path As %String = "", Output idx, Output val, ByRef iterator, delim As %String = ".", ByRef pathObj) As %Boolean
{
    if '$IsObject(object) quit 0
    if '$Data(path) Set path=""
    if '$Data(iterator) {
        if path'="" {
            set pathObj=..g(object,path,delim)
        } Else {
            set pathObj=object
        }
        if '$IsObject(pathObj) return 0
        Set iterator = pathObj.%GetIterator()
    }
    Set st=iterator.%GetNext(.idx,.val)
    if st=0 k iterator
    Quit st
}

ClassMethod get(pJSON As %Library.DynamicObject, pNodePath As %String, pDelim As %String = ".") As %Library.DynamicObject
{
    Set tRef=""
    Try
	{
        Set pNodePath = $Tr(pNodePath,"[]",pDelim)
        Set tRef=pJSON
        If pNodePath="" Quit
        For i=1:1:$Length(pNodePath,pDelim) {
            If $ClassName(tRef)'["%Library.Dynamic" Set tRef = ""  Quit
            If $ClassName(tRef)="%Library.DynamicArray",$Piece(pNodePath,pDelim,i)'=+$Piece(pNodePath,pDelim,i) Set tRef = ""  Quit
            Set tRef=tRef.%Get($Piece(pNodePath,pDelim,i))
            If tRef="" Quit
        }
    }
	Catch(e)
	{
        Set tSC = e.AsStatus()
	}
    Quit tRef
}

ClassMethod set(ByRef pJSON As %Library.DynamicObject, pNodePath As %String, pValue As %Library.DynamicObject, pType As %String, pDelim As %String = ".", pInferBoolean As %Boolean = 1) As %Status [ SqlProc ]
{
	Set tSC = $System.Status.OK()
    Try
	{
        Set pNodePath = $Tr(pNodePath,"[]",pDelim)
        If $Piece(pNodePath,pDelim,1)="+" Set $Piece(pNodePath,pDelim,1) = $Select('$Data(pJSON):0,1:pJSON.%Size())
        If '$Data(pJSON),$Piece(pNodePath,pDelim,1)=+$Piece(pNodePath,pDelim,1) Set pJSON=[]
        If '$Data(pJSON) Set pJSON={}  
        Set tRef=pJSON
        For i=1:1:$Length(pNodePath,pDelim) {
            If $Piece(pNodePath,pDelim,i+1)="+",tRef.%Get($Piece(pNodePath,pDelim,i))="" Set $Piece(pNodePath,pDelim,i+1)=0
            If ($ClassName(tRef)="%Library.DynamicArray")&&($Piece(pNodePath,pDelim,i)="+") Set $Piece(pNodePath,pDelim,i)=tRef.%Size()
            Set tPiece = $Tr($Piece(pNodePath,pDelim,i),"*","")
            Set tNextPiece = $Piece(pNodePath,pDelim,i+1)
            If i=$Length(pNodePath,pDelim) {
                If pInferBoolean,($zConvert(pValue,"L")="true")||($zConvert(pValue,"L")="false") {
                    Set pValue=$Select($zConvert(pValue,"L")="true":1,1:0)
                    Set pType = "boolean"
                }
                If $Get(pType,"")'="" {
                    Do tRef.%Set(tPiece,pValue,pType)
                } Else {
                    Do tRef.%Set(tPiece,pValue)
                }
            } Else {
                If tRef.%Get(tPiece)="" Do tRef.%Set(tPiece,$Select(tNextPiece=+tNextPiece:[],1:{}))
                Set tRef = tRef.%Get(tPiece)
            }
        }
    }
	Catch(e)
	{
        Set tSC = e.AsStatus()
	}
    Quit tSC
}

ClassMethod findElement(arr As %Library.DynamicArray, value As %String) As %Numeric
{
    Set l = $listfromstring($e(arr.%ToJSON(),2,*-1),",")
    Quit $listfind(l,value)
}

ClassMethod top(arr As %Library.DynamicArray, number As %Library.DynamicArray = 1) As %Library.DynamicArray
{
    Set tResult = []
    Try
	{
        Set tCt = 0
        Set arrIt = arr.%GetIterator()
        While (arrIt.%GetNext(.arrKey,.arrValue)) {
            If tCt<number Do tResult.%Push(arrValue)
            Set tCt=tCt+1
        }
    }
	Catch(e)
	{
        Throw ##Class(%Exception.StatusException).CreateFromStatus(e.Status)
	}
     Quit tResult
}

ClassMethod select(arr As %Library.DynamicArray, props As %Library.DynamicArray, delim As %String = ".", nullProps As %Boolean = 1) As %Library.DynamicArray
{
    Set tResult = []
    Try
	{
        Set arrIt = arr.%GetIterator()
        While (arrIt.%GetNext(.arrKey,.arrValue)) {
            Set tObj={}
            Set tProps = props.%GetIterator()
            While (tProps.%GetNext(.prKey,.prValue)) {
                If $IsObject(arrValue),(..get(arrValue,prValue,delim)'="")||(nullProps) Do ..set(tObj,prValue,..get(arrValue,prValue,delim),,delim)
            }
            Do tResult.%Push(tObj)
        }
    }
	Catch(e)
	{
        Throw ##Class(%Exception.StatusException).CreateFromStatus(e.Status)
	}
     Quit tResult
}

ClassMethod find(arr As %Library.DynamicArray, whereClause As %String, elementName As %String = "value", keyName As %String = "key") As %String
{
    Set tResult = -1
    Try
	{
        Set arrIt = arr.%GetIterator()
        While (arrIt.%GetNext(.arrKey,.arrValue)) {
            Set tFilterCmd = "("_elementName_","_keyName_") If ("_whereClause_") {Quit 1} Else {Quit 0}"
            Set tFilter=$XECUTE(tFilterCmd,arrValue,arrKey)
            If tFilter=1 Return arrKey
        }
    }
	Catch(e)
	{
        Throw ##Class(%Exception.StatusException).CreateFromStatus($$$ERROR($$$GeneralError, "Invalid where clause [ "_whereClause_" ]"))
	}
     Quit tResult
}

ClassMethod join(arr As %Library.DynamicArray, arr2 As %Library.DynamicArray) As %Library.DynamicArray
{
    Set tResult = []
    Try
	{
        Set arrIt = arr.%GetIterator()
        While (arrIt.%GetNext(.arrKey,.arrValue)) {
            Do tResult.%Push(arrValue)
        }
        Set arrIt = arr2.%GetIterator()
        While (arrIt.%GetNext(.arrKey,.arrValue)) {
            Do tResult.%Push(arrValue)
        }
    }
	Catch(e)
	{
        Throw ##Class(%Exception.StatusException).CreateFromStatus(e.Status)
	}
     Quit tResult
}

ClassMethod filter(arr As %Library.DynamicArray, whereClause As %String, elementName As %String = "value", keyName As %String = "key") As %Library.DynamicArray
{
    Set tResult = []
    Try
	{
        Set arrIt = arr.%GetIterator()
        While (arrIt.%GetNext(.arrKey,.arrValue)) {
            Set tFilterCmd = "("_elementName_","_keyName_") If ("_whereClause_") {Quit 1} Else {Quit 0}"
            Set tFilter=$XECUTE(tFilterCmd,arrValue,arrKey)
            If tFilter=1 Do tResult.%Push(arrValue)
        }
    }
	Catch(e)
	{
        Throw ##Class(%Exception.StatusException).CreateFromStatus($$$ERROR($$$GeneralError, "Invalid where clause [ "_whereClause_" ]"))
	}
     Quit tResult
}

ClassMethod orderBy(arr As %Library.DynamicArray, sortBy As %Library.DynamicArray, nullsFirst As %Integer = 0) As %Library.DynamicArray
{
    If '$Data(sortBy) Set sortBy = []
    If sortBy.%Size() = 0 Set sortBy=["|1"]
    Set tResult = []
    Set tVar = ""
    K %tSortTab,%tSortTabAsc
    Set (%tSortTab,%tSortTabAsc) = ""
    Set arrIt = arr.%GetIterator()
    While (arrIt.%GetNext(.arrKey,.arrValue)) {
        Set (tVar,tVarOrd) = ""
        Set tSortBy = sortBy.%GetIterator()
        While (tSortBy.%GetNext(.srtKey,.srtValue)) {
            Set tValue = arrValue
            If $IsObject(arrValue) {
                Set tValue = ..get(arrValue,$Piece(srtValue,"|",1))
            }
            Set tAscDesc = $Piece(srtValue,"|",2)
            If tAscDesc'="1",tAscDesc'="-1" Set tAscDesc=1
            Set tCmd = "(value,ascDesc,sortOrd) Set tmpZ"_srtKey_"=value  Set sortOrd="_srtKey_"  Set sortOrd("_srtKey_")=ascDesc"
            Xecute (tCmd,$Select(tValue'="":tValue,1:$Select((nullsFirst=1):$Select(tAscDesc=1:0,1:..replChar("z",100)),1:$Select(tAscDesc=-1:0,1:..replChar("z",100)))),tAscDesc,.%tSortTabAsc)
            Set tVar = tVar_$Select(tVar="":"",1:",")_"tmpZ"_srtKey
        }
        Set tCmd = "(arrKey,SOrder) Set SOrder("_tVar_",arrKey)=""""  quit SOrder"
        SET %tSortTab=$XECUTE(tCmd,arrKey,.%tSortTab) 
    }
    Set %tSortTabAsc(%tSortTabAsc+1)=1
    Set tVar=tVar_",arrKey"
    Set tCmdOrd = ""
    For i = 1:1:$Length(tVar,",") {
        Set tCmdI="Set "_$Piece(tVar,",",i)_" = $Order(%tSortTab("_$Piece(tVar,",",1,i-1)_$Select(i=1:"",1:",")_"""""),"_%tSortTabAsc(i-1)_")  While "_$Piece(tVar,",",i)_"'="""" {**i**  Set "_$Piece(tVar,",",i)_" = $Order(%tSortTab("_$Piece(tVar,",",1,i)_"),"_%tSortTabAsc(i-1)_")}"
        Set tCmdOrd=$Select(tCmdOrd="":tCmdI,1:$Replace(tCmdOrd,"**i**",tCmdI))
    }
    Set tCmdOrd="(resArr,origArr) Set ("_tVar_")=""""  "_$Replace(tCmdOrd,"**i**","Do resArr.%Push(origArr.%Get(arrKey))")
    Xecute (tCmdOrd,.tResult,arr)
    K %tSortTab,%tSortTabAsc
    Quit tResult
}

ClassMethod replChar(char As %String, number As %Integer = 1)
{
    Set tResult = char
    For i=1:1:number-1 {Set tResult=tResult_char}
    Quit tResult
}

ClassMethod flat(pJSON As %Library.DynamicObject, Output pFlatJSON As %Library.DynamicObject, pParams As %Library.DynamicObject, pInternal As %Library.DynamicObject) As %Status
{
	Set tSC = $System.Status.OK()
	Try
	{
        //If not Defined The Params Set the Default Values
        If '$Data(pParams) Set pParams={}
        Set pDelim = $Select(pParams.keyDelimiter'="":pParams.keyDelimiter,1:".") 
        Set pPrintResults = $Select(pParams.printResults'="":pParams.printResults,1:0)
        Set pQueryConfig = $Select(pParams.queryConfig'="":pParams.queryConfig,1:{})

        //Internal Params
        If '$Data(pInternal) Set pInternal={"parentKey":"","parentSchem":"", "parentType":""}
        Set pParentKey = pInternal.parentKey
        Set pParentSchem = pInternal.parentSchem
        Set pParentType = pInternal.parentType
		If pParentType="" {
			Set pFlatJSON = {}
			Do ..flat(pJSON,.pFlatJSON,pParams,{"parentKey":"", "parentSchem":"", "parentType":($Select($ClassName(pJSON)="%Library.DynamicArray":"array",1:"object"))})
            If pPrintResults {
                Set tFormatter = ##class(%JSON.Formatter).%New(),jsonString=""
                Do tFormatter.FormatToString(pFlatJSON.%ToJSON(),.jsonString)
                Write jsonString,!
            }
		} Else {
			Set prop = pJSON.%GetIterator()
			While (prop.%GetNext(.key,.value)) {
				Set tKey = $Select(pParentKey'="":pParentKey_pDelim, 1:"")_$Select(key'="":key, 1:"")
				Set tSchem = $Select(pParentSchem'="":pParentSchem_pDelim, 1:"")_$Select(key'="":$Select(pInternal.parentType = "array":"[n]",1:key), 1:"")
                Set tType = ""
                If ..g(pQueryConfig,"groupType")'="" Set tType = ..g(pFlatJSON,..g(pQueryConfig,"groupType"))
                If $IsObject(value) {
                    Set tLabelKey = ""
                    If pQueryConfig.%Size()'=0 {
                        Set tLabelKey = ..g(pQueryConfig,"*|"_$Piece(pInternal.parentKey,pDelim,*))
                        If tLabelKey="",tType'="" Set tLabelKey = ..g(pQueryConfig,tType_"|"_$Piece(pInternal.parentKey,pDelim,*))
                    }
                    If pInternal.parentType = "array",tLabelKey'="" {
                        If $Piece(tLabelKey,"|",1) = 1 {
                            Do ..flat(value,.pFlatAux,pParams)
                            Do ..s(pFlatJSON,$Piece(tKey,pDelim,1,*-1)_"[+]",pFlatAux,,"~")
                        }
                        Set tLabel = key
                        If $Piece(tLabelKey,"|",2) '= "" {
                            If $Piece(tLabelKey,"|",2) '= "1" Set tLabel = $Piece(..g(value,$Piece(tLabelKey,"|",2),pDelim),"/",*)
                            If tLabel = "" Set tLabel = key
                        } 
                        If $Piece(tLabelKey,"|",2) '= "0" {
                            Do ..flat(value,.pFlatJSON,pParams,{"parentKey":($Piece(tKey,pDelim,1,*-1)_"Idx"_pDelim_tLabel), "parentSchem":($Piece(tSchem,pDelim,1,*-1)_"Idx"_pDelim_tLabel), "parentType":($Select($ClassName(value)="%Library.DynamicArray":"array",1:"object"))})
                        }
                    } Else {
                        Do ..flat(value,.pFlatJSON,pParams,{"parentKey":(tKey), "parentSchem":(tSchem), "parentType":($Select($ClassName(value)="%Library.DynamicArray":"array",1:"object"))})
                    }
				} Else {
                    Do ..s(pFlatJSON,tKey,value,pJSON.%GetTypeOf(key),"~")
	 			}
			}
		}
	}
	Catch(e)
	{
		Set tSC = e.AsStatus()
	}
	Quit tSC
}

/// Traverses all nodes of a JSON and allows manipulation (handleNode method) of each node (see default handle method) to a target json.
ClassMethod parse(pJSON As %Library.DynamicObject, Output pTargetJSON As %Library.DynamicObject, pHandleNodesMethod As %String = "custom.json.utils||handleNodes", pInputParam As %Library.DynamicObject, pParams As %Library.DynamicObject, pInternal As %Library.DynamicObject) As %Status
{
	Set tSC = $System.Status.OK()
	Try
	{
        //If not Defined The Params Set the Default Values
        If '$Data(pParams) Set pParams={}
        If '$Data(pInputParam) Set pInputParam={}
        Set pDelim = $Select(pParams.keyDelimiter'="":pParams.keyDelimiter,1:".") 
        Set pPrintResults = $Select(pParams.printResults'="":pParams.printResults,1:0)
        Set pQueryConfig = $Select(pParams.queryConfig'="":pParams.queryConfig,1:{})

        //Internal Params
        If '$Data(pInternal) Set pInternal={"parentKey":"","parentSchem":"", "parentType":""}
        Set pParentKey = pInternal.parentKey
        Set pParentSchem = pInternal.parentSchem
        Set pParentType = pInternal.parentType
		If pParentType="" {
			Set pTargetJSON = {}
			Do ..parse(pJSON,.pTargetJSON,pHandleNodesMethod,pInputParam,pParams,{"parentKey":"", "parentSchem":"", "parentType":($Select($ClassName(pJSON)="%Library.DynamicArray":"array",1:"object"))})
            If pPrintResults {
                Set tFormatter = ##class(%JSON.Formatter).%New(),jsonString=""
                Do tFormatter.FormatToString(pTargetJSON.%ToJSON(),.jsonString)
                Write jsonString,!
            }
		} Else {
			Set prop = pJSON.%GetIterator()
			While (prop.%GetNext(.key,.value)) {
				Set tKey = $Select(pParentKey'="":pParentKey_pDelim, 1:"")_$Select(key'="":key, 1:"")
				Set tSchem = $Select(pParentSchem'="":pParentSchem_pDelim, 1:"")_$Select(key'="":$Select(pInternal.parentType = "array":"[n]",1:key), 1:"")
                Set tType = ""
                If ..g(pQueryConfig,"groupType")'="" Set tType = ..g(pTargetJSON,..g(pQueryConfig,"groupType"))
                If $IsObject(value) {
                    Set tLabelKey = ""
                    If pQueryConfig.%Size()'=0 {
                        Set tLabelKey = ..g(pQueryConfig,"*|"_$Piece(pInternal.parentKey,pDelim,*))
                        If tLabelKey="",tType'="" Set tLabelKey = ..g(pQueryConfig,tType_"|"_$Piece(pInternal.parentKey,pDelim,*))
                    }
                    If pInternal.parentType = "array",tLabelKey'="" {
                        If $Piece(tLabelKey,"|",1) = 1 {
                            Do ..parse(value,.pFlatAux,pHandleNodesMethod,pInputParam,pParams)
                            Set tSC = $CLASSMETHOD($P(pHandleNodesMethod,"||",1),$P(pHandleNodesMethod,"||",2),pTargetJSON,pInputParam,$Piece(tKey,pDelim,1,*-1)_"[+]",pFlatAux) 
                            If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC)}
                        }
                        Set tLabel = key
                        If $Piece(tLabelKey,"|",2) '= "" {
                            If $Piece(tLabelKey,"|",2) '= "1" Set tLabel = $Piece(..g(value,$Piece(tLabelKey,"|",2),pDelim),"/",*)
                            If tLabel = "" Set tLabel = key
                        } 
                        If $Piece(tLabelKey,"|",2) '= "0" {
                            Do ..parse(value,.pTargetJSON,pHandleNodesMethod,pInputParam,pParams,{"parentKey":($Piece(tKey,pDelim,1,*-1)_"Idx"_pDelim_tLabel), "parentSchem":($Piece(tSchem,pDelim,1,*-1)_"Idx"_pDelim_tLabel), "parentType":($Select($ClassName(value)="%Library.DynamicArray":"array",1:"object"))})
                        }
                    } Else {
                        Do ..parse(value,.pTargetJSON,pHandleNodesMethod,pInputParam,pParams,{"parentKey":(tKey), "parentSchem":(tSchem), "parentType":($Select($ClassName(value)="%Library.DynamicArray":"array",1:"object"))})
                    }
				} Else {
                    Set tSC = $CLASSMETHOD($P(pHandleNodesMethod,"||",1),$P(pHandleNodesMethod,"||",2),pTargetJSON,pInputParam,tKey,value,pJSON.%GetTypeOf(key)) 
                    If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC)}
	 			}
			}
		}
	}
	Catch(e)
	{
		Set tSC = e.AsStatus()
	}
	Quit tSC
}

/// template of handleNode method (see parse method)
ClassMethod handleNodes(targetJSON As %DynamicObject, inputParam As %DynamicObject, nodePath As %String, value As %DynamicObject, type As %String = "") As %Status
{
    Set tSC = $$$OK
    Do ..s(targetJSON,nodePath,value,type)
    Quit tSC
}

ClassMethod jsonFromFile(path As %String) As %DynamicObject
{
    Set tFileStream=##class(%Stream.FileCharacter).%New()
    Set tSC=tFileStream.LinkToFile(path)
    If 'tSC { Throw ##Class(%Exception.StatusException).CreateFromStatus(tSC)}
    If tFileStream.SizeGet()=0 Throw ##Class(%Exception.StatusException).CreateFromStatus($$$ERROR($$$GeneralError, "<404> file "_path_" doesn't exist"))
    Quit {}.%FromJSON(tFileStream)
}

}
