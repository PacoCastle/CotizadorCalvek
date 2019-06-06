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
using log4net;
using System.Text;



public partial class Seguridad_Login : System.Web.UI.Page
{
    private string loc;
    private static readonly ILog log = LogManager.GetLogger(typeof(Seguridad_Login));
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
       

        if (Page.IsValid)
        {
            Session["usuarioID"] = null;
            Session["InfoSession"] = null;
            Session["OrderNumber"] = null;
            Session["usuarioIDCotizacion"] = null;
            Session["oficinaId"] = null;
            Session["perfilID"] = null;
            Session["ubicacion"] = null;

            LoginBL accesar = new LoginBL();
            LoginVO loginVO = new LoginVO();
            InfoSessionVO info = new InfoSessionVO();
            

            loginVO.Usuario_login = Login1.UserName;
            loginVO.Usuario_contrasena = Login1.Password;
            
            loc = ubicacion.Text.Trim();

            //verifica que el usuario tenga acceso
            loginVO = (LoginVO)accesar.execute(loginVO);

            if (loginVO.Resultado.Equals(1))
            {
                
                info.setValor(InfoSessionVO.NOMBRECOMPLETO, loginVO.Usuario_nombrecompleto);
                info.setValor(InfoSessionVO.ESTATUSUSUARIO, loginVO.Usuario_estatusId);
                info.setValor(InfoSessionVO.PERFIL, loginVO.Usuario_perfilid);
                info.setValor(InfoSessionVO.OFICINA, loginVO.Usuario_oficinaId);
                info.setValor(InfoSessionVO.FUNCIONES, loginVO.FuncionPerfil);
                info.setValor(InfoSessionVO.USUARIOID, loginVO.Usuarioid);
                info.setValor(InfoSessionVO.CODIGOUSUARIOADMIN, loginVO.Usuario_codigoUsuarioAdmin);
                info.setValor(InfoSessionVO.CORREOELECTRONICO, loginVO.Usuario_correoElectronico);

                Session["nombreCompleto"] = loginVO.Usuario_nombrecompleto;
                Session["Usuario_codigoUsuarioAdmin"] = loginVO.Usuario_codigoUsuarioAdmin;
                Session["usuarioID"] = loginVO.Usuarioid;
                Session["ubicacion"] =  loc;

                //saludo nuevo = new saludo();
                //Session.Add("nuevo", nuevo);

                Session.Add("InfoSession", info);
                log4net.Config.DOMConfigurator.Configure();
                log.Info("Entrando en la aplicacion - Login");
                if (loginVO.Usuario_perfilid == 2)
                {
                    Response.Redirect("~/Cotizador/Default.aspx");
                    return;
                }
                if (loginVO.Usuario_perfilid == 8)
                {
                    Response.Redirect("~/OrdenesCompra/listadoOrdenesCompra.aspx");
                    return;
                }
               
                Response.Redirect("~/Principal/Default.aspx");
        
            }
            else
            {
                Response.Redirect("~/Seguridad/Login.aspx");
                Login1.FailureText = "<br>Usuario/Contraseña Invalidos";
            }
        }
    }
}
