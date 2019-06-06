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

public partial class Cotizador_CreditCheck : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ReturnURL.Text = Request.Form["ReturnURL"];
            MerchantID.Text = Request.Form["MerchantID"];
            CustomerID.Text = Request.Form["CustomerID"];
            OrderTotal.Text = String.Format("{0:C}", Request.Form["OrderTotal"]);
        }
    }

    public void Check_Credit(Object Src, EventArgs Args)
    {
        Boolean ValidEmail = true;
        if (Email.Text.Equals(""))
        {
            if (!Email.Text.Contains("@"))
            {
                ValidEmail = false;
                Message.Text = "Invalid email address";
            }
            else if (Email.Text.Substring((Email.Text.Length - 3), 1).Equals("."))
            {
                ValidEmail = false;
                Message.Text = "Invalid email address";
            }
        }
        else
        {
            ValidEmail = false;
            Message.Text = "Missing email address";
        }

        if (ValidEmail == true)
        {
            CreditCard.Enabled = false;
            Account.Enabled = false;
            ExpMonth.Enabled = false;
            ExpYear.Enabled = false;
            Name.Enabled = false;
            Address.Enabled = false;
            City.Enabled = false;
            State.Enabled = false;
            Zip.Enabled = false;
            Email.Enabled = false;
            Instructions.Text = "Click the Complete Order button to complete your order with ";
            Approved.Text = "Approved";
            ContinuePanel.Visible = false;
            CompletePanel.Visible = true;
        }
    }

    /*
     * Dim SubmitForm As Boolean = False

Sub Submit_Order (Src As Object, Args As EventArgs)
  SubmitForm = True
End Sub

Sub Cancel_Order (Src As Object, Args As EventArgs)
  Approved.Text = "Cancel"
  Submit_Order(Nothing, Nothing)
End Sub

     * */
    public Boolean SubmitForm = false;

    public void Submit_Order(Object Src, EventArgs Args)
    {
        SubmitForm = true;
    }

    public void Cancel_Order(Object Src, EventArgs Args)
    {
        Approved.Text = "Cancel";
        Submit_Order(null, null);
    }
}
