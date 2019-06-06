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

public partial class Seguridad_Perfiles_FormularioPerfil : System.Web.UI.Page
{

    private static int NUMFUNCION = 7;

    protected void Page_Load(object sender, EventArgs e)
    {

        String error = Utilis.validaPermisos(Session, NUMFUNCION);
        if (!error.Equals(""))
        {
            Response.Redirect(error);
        }

        if (Request["perfilid"] != null && !IsPostBack)
        {
            cargaDatosActualiza();
        }
    }

    private void cargaDatosActualiza()
    {
        int perfilid = 0;
        PerfilVO VO = new PerfilVO();
        PerfilBL BL = new PerfilBL();

        Button1.Text = "Procesar Cambio";
        Label1.Text = "Cambio de Informacion del Perfil";
        perfilid = Int32.Parse(Request["perfilid"]);

        VO.Operacion = PerfilVO.BUSCAR;
        VO.Perfilid = perfilid;

        VO = (PerfilVO)BL.execute(VO);

        txtNombreP.Text = VO.Nombre;
        listEstatus.SelectedValue = VO.Estatus.ToString();
        cargaCheckbox(VO.ListaFuncVO.Funciones);                
    }

    private void cargaCheckbox(ArrayList array)
    {
        if (array != null && array.Count > 0)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                String index = GridView1.DataKeys[row.RowIndex].Value.ToString();

                if (array.Contains(index))
                {
                    CheckBox myCheckBox = (CheckBox)row.FindControl("CheckBox1");
                    myCheckBox.Checked = true;
                }
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int perfilid = 0;
        PerfilVO VO = new PerfilVO();
        PerfilBL BL = new PerfilBL();
        FuncionesPerfilVO FuncTempVO = new FuncionesPerfilVO();

        if (Request["perfilid"] != null)
        {
            Button1.Text = "Procesar Cambio";
            Label1.Text = "Cambio de Informacion del Perfil";
            perfilid = Int32.Parse(Request["perfilid"]);
            FuncTempVO.Funciones = getValoresCheckbox();

            VO.Nombre = txtNombreP.Text;
            VO.Estatus = Int32.Parse(listEstatus.SelectedValue);
            VO.Perfilid = perfilid;
            VO.ListaFuncVO = FuncTempVO;
            VO.Operacion = PerfilVO.ACTUALIZAR;

            VO = (PerfilVO)BL.execute(VO);
            if (VO.Resultado == 0)
            {
                Mensaje01.Text = "Los datos se actualizaron correctamente";
            }
            else
            {
                Mensaje01.Text = "Los datos NO se actualizaron correctamente";
            }
        }
        else
        {
            FuncTempVO.Funciones = getValoresCheckbox();
            VO.Nombre = txtNombreP.Text;
            VO.Estatus = Int32.Parse(listEstatus.SelectedValue);
            VO.Perfilid = perfilid;
            VO.ListaFuncVO = FuncTempVO;
            VO.Operacion = PerfilVO.INSERTAR;

            VO = (PerfilVO)BL.execute(VO);
            if (VO.Resultado > 0)
            {
                perfilid = (int)VO.Resultado;
                Mensaje01.Text = "Los datos se insertaron correctamente";
            }
            else
            {
                Mensaje01.Text = "Los datos NO se insertaron";
            }
        }
    }
    private ArrayList getValoresCheckbox()
    {
        ArrayList categoryIDList = new ArrayList();
        String index = "-1";
        foreach (GridViewRow row in GridView1.Rows)
        {
            index = GridView1.DataKeys[row.RowIndex].Value.ToString();

            bool result = ((CheckBox)row.FindControl("CheckBox1")).Checked;

            if (result)
            {
                    categoryIDList.Add(index);
            }
        }
        return categoryIDList;
    }

}
