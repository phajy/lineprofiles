//
// Code auto-generated by initpackage (XSPEC12 local 
// model package code generator).  Do not edit.
// Package: klineprofiles
// Function body: klineprofilesFunctionMap.cxx

#include    "klineprofilesFunctionMap.h"

#include    <XSFunctions/Utilities/XSModelFunction.h>
#include    <XSFunctions/Utilities/XSCall.h>

void 
createklineprofilesFunctionMap()
{


	XSModelFunction::addFunctionPointer( "kline",      new XSCall<xsccCall>(kline) );
	XSModelFunction::addFunctionPointer( "kline5",     new XSCall<xsccCall>(kline5) );

}