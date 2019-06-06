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
using System.Data.SqlClient;
using System.IO;

public partial class MasterPage : System.Web.UI.MasterPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nombreCompleto"] == null)
        {
            //Response.Redirect("Default.aspx");
            Response.Redirect("../Seguridad/Login.aspx");
        }
        //else
        //{
        //    if (!this.IsPostBack)
        //    {
        //        DataTable dt = this.GetData(0);
        //        PopulateMenu(dt, 0, null);
        //    }
        //}
        
    }
    //private DataTable GetData(int parentMenuId)
    //{
    //    string query = "SELECT [MenuId], [Title], [Description], [Url] FROM [Menus] WHERE ParentMenuId = @ParentMenuId And Activo = 1";
    //    string constr = ConfigurationManager.ConnectionStrings["cotizadorCS"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        DataTable dt = new DataTable();
    //        using (SqlCommand cmd = new SqlCommand(query))
    //        {
    //            using (SqlDataAdapter sda = new SqlDataAdapter())
    //            {
    //                cmd.Parameters.AddWithValue("@ParentMenuId", parentMenuId);
    //                cmd.CommandType = CommandType.Text;
    //                cmd.Connection = con;
    //                sda.SelectCommand = cmd;
    //                sda.Fill(dt);
    //            }
    //        }
    //        return dt;
    //    }
    //}
    //private void PopulateMenu(DataTable dt, int parentMenuId, MenuItem parentMenuItem)
    //{
    //    string currentPage = Path.GetFileName(Request.Url.AbsolutePath);
    //    foreach (DataRow row in dt.Rows)
    //    {
    //        MenuItem menuItem = new MenuItem
    //        {
    //            Value = row["MenuId"].ToString(),
    //            Text = row["Title"].ToString(),
    //            NavigateUrl = row["Url"].ToString(),
    //            Selected = row["Url"].ToString().EndsWith(currentPage, StringComparison.CurrentCultureIgnoreCase)
    //        };
    //        if (parentMenuId == 0)
    //        {
    //            Menu1.Items.Add(menuItem);
    //            DataTable dtChild = this.GetData(int.Parse(menuItem.Value));
    //            PopulateMenu(dtChild, int.Parse(menuItem.Value), menuItem);
    //        }
    //        else
    //        {
    //            parentMenuItem.ChildItems.Add(menuItem);
    //        }
    //    }
    //}



    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
}
