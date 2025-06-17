Class pocho.api.module Extends apiPub.core.service
{

/// Charset for Output
Parameter CHARSET = "UTF-8";

/// Target path for OAS Documentation
Parameter OASPath As %String = "Get:/_spec";

/// Target class that contains all API (Web Methods) for this module
Parameter DispatchClass As %String = "pocho.api.api";

/// When the class is also a Business Service
Parameter DispatchBSName As %String = "apiservice";

/// Use IRIS Production to generate tracing and monitoring (dashboards)
Parameter Traceable As %Boolean = 1;

/// Group for monitoring
Parameter APIDomain = "pocho";

/// If OASNestedMode=1 publisher avoid name conflict for OAS Schemas (Complex Requests and Responses)
Parameter OASNestedMode = 0;

/// format/prettify the JSON request body
Parameter BeautifyJsonBodyRequest = 1;

/// format/prettify the JSON response body
Parameter BeautifyJsonBodyResponse = 1;

}
