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
using BDOPERACION2009TableAdapters;


public partial class Admin_ControlCartera_formularioDetalleCartera : System.Web.UI.Page
{

    private sp_listadoFacturasPendientesTableAdapter sp_listadoFacturasPendientes = new sp_listadoFacturasPendientesTableAdapter();
    private DataTable datos = null;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAsignar_Click(object sender, EventArgs e)
    {

        //controlCarteraVO ccVO = new controlCarteraVO();
        //controlCarteraBL ccBL = new controlCarteraBL();
        //ccVO.Operacion = cotizacionVO.INSERTAR;
        //ccVO.IntIdAdmin = ;
        //ccVO.IntFolio = ;
        //ccVO.StrSerie = ;
        //ccVO.UsuarioIdInserto = Int32.Parse(Session["usuarioID"].ToString());
        //VO = (cotizacionVO)BL.execute(VO);
        //if (VO.Resultado == 0)
        //{

        //    //return true;
        //}
        //else
        //{

        //    //return false;
        //}

    }

    protected void GridView1_RowUpdating(Object sender, GridViewUpdateEventArgs e)
    {
        int index = GridView1.EditIndex;
        GridViewRow row = GridView1.Rows[index];
        DropDownList IdAdmin = (DropDownList)row.FindControl("IdAdmin");
        e.NewValues["IdAdmin"] = IdAdmin.SelectedItem.Value.Split('-')[0];
        
    }

    public ListItemCollection ListaEstatus(int intCliente)
    {

        ListItem li = null;
        ListItemCollection liC = new ListItemCollection();

        int a = 0;
        datos = sp_listadoFacturasPendientes.GetData(intCliente);
        if (datos.Rows.Count > 0)
        {
            while (a < datos.Rows.Count)
            {
                // datos.Rows[a]["IdAdmin"].ToString() + "-" + 
                li = new ListItem(datos.Rows[a]["IdAdmin"].ToString() + "-" + datos.Rows[a]["Folio"].ToString(), datos.Rows[a]["IdAdmin"].ToString());
                liC.Add(li);
                li = null;
                a++;
            }
        }

        return liC;

    }

}
