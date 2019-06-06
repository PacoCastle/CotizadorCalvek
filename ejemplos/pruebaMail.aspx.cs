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
using System.Net.Mail;

public partial class ejemplos_pruebaMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            MailAddress de = new MailAddress("ismael.rojas" + (char)64 + "calvek.com", "CALVEK TI");
            MailAddress para = new MailAddress("ismael.rojas" + (char)64 + "calvek.com", "yo");
            MailMessage mensaje = new MailMessage(de, para);
            // mensaje.Bcc.Add(txtEmail.Text);
            mensaje.Subject = "prueba de correo - Aplicacion";
            mensaje.BodyEncoding = System.Text.Encoding.Default;
            mensaje.IsBodyHtml = false;
            mensaje.Body = "<p>(1) HOla calvek.com 587</p>";
            mensaje.IsBodyHtml = true;
            mensaje.Priority = System.Net.Mail.MailPriority.Normal;
            SmtpClient cliente = new SmtpClient("mail.calvek.com.mx");
            cliente.Port = 587;
            cliente.Credentials = new System.Net.NetworkCredential("ismael.rojas@calvek.com", "r0ja5");
            //cliente.EnableSsl = true;

            cliente.Send(mensaje);
            // procesado = true;
        }
        catch (Exception ex)
        {
              lblError.Text = ex.Message;
        }
    }
}
