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

public partial class Cobranza_DepositosPendientes_FormularioDepositosPendientes : System.Web.UI.Page
{
    /*
     * Revisar por que no actualiza el grid
     * poner boton de terminar. con este se establece el documentosDepositosPendientesId que le corresponde.
     */
    private static int NUMFUNCION = 23;

    protected void Page_Load(object sender, EventArgs e)
    {
        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        DetalleDepositosSinIdentificarVO VO = new DetalleDepositosSinIdentificarVO();
        DetalleDepositosSinIdentificarBL BL = new DetalleDepositosSinIdentificarBL();
        VO.Operacion = DetalleDepositosSinIdentificarVO.INSERTAR;

        if (Request["pendienteId"] != null)
        {
            VO.DepositosPendientesId = Int32.Parse(Request["pendienteId"].ToString());
        }
        else
        {
            VO.DepositosPendientesId = 0;
        }

        VO.SerieFactura = ((TextBox)gwDocumentos.FooterRow.FindControl("txtSerie")).Text;
        VO.FolioFactura = Int32.Parse(((TextBox)gwDocumentos.FooterRow.FindControl("txtFolio")).Text);
        VO.UsuarioId = Int32.Parse(Session["usuarioID"].ToString());

            VO = (DetalleDepositosSinIdentificarVO)BL.execute(VO);
            if (VO.Resultado > 0)
            {
                // se inserto con exito
                gwDocumentos.DataBind();
            }
    }

}
