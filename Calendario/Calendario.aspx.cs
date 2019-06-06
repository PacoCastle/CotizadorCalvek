using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Calendario_Calendario : System.Web.UI.Page
{
    protected void cal_SelectionChanged(object sender, EventArgs e)
    {
        txtFecha.Text = cal.SelectedDate.ToShortDateString();

        string devuelveFecha = "<script language='JavaScript'>" +
          "returnValue = document.getElementById('txtFecha').value;" +
          "close();</script>";

        ClientScript.RegisterStartupScript(this.GetType(), "Devolver", devuelveFecha);
    }

}

