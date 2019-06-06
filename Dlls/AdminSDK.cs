// Win32API: wrapper for selected Win32 API functions
// To compile:
//    csc /t:library /out:AdminSDK.dll AdminSDK.cs
//
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Runtime.InteropServices;
/// <summary>
/// Summary description for AdminSDK
/// </summary>
public class AdminSDK
{
    //Declare Function fInicializaSDK Lib "MGW_SDK.DLL" () As Long
    [DllImport("MGW_SDK.DLL", CharSet = CharSet.Auto, CallingConvention = CallingConvention.Winapi)]
    public static extern long fInicializaSDK();
    //Public Declare Sub fTerminaSDK Lib "MGW_SDK.DLL" ()
    [DllImport("MGW_SDK.DLL")]
    public static extern void fTerminaSDK();

}
