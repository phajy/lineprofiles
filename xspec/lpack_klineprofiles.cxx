//
// Code auto-generated by initpackage (XSPEC12 local model package 
// code generator).  Do not edit
// Package: klineprofiles Created :
// Initializer: klineprofiles.cxx

#include <XSUser/UserInterface/xstcl.h>

#include  "klineprofilesFunctionMap.h"
#include  <XSFunctions/Utilities/XSCall.h>
#include  <XSFunctions/Utilities/XSModelFunction.h>

extern "C" int Klineprofiles_Init(Tcl_Interp* tclInterp);
extern "C" int Klineprofiles_SafeInit(Tcl_Interp* tclInterp);

int Klineprofiles_Init(Tcl_Interp* tclInterp)
{
        return Klineprofiles_SafeInit(tclInterp);
}

int Klineprofiles_SafeInit(Tcl_Interp* tclInterp)
{

        char PACKAGE[] = "klineprofiles";
        char VERSION[] = "1.0";
        Tcl_PkgProvide(tclInterp, PACKAGE, VERSION);
        XSModelFunction::updateComponentList
              ("/home/heasoft/datasets/lineprofiles-model/lmodel.dat");
        createklineprofilesFunctionMap();
        return TCL_OK;

}
