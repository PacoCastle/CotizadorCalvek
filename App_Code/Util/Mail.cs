using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
/// <summary>
/// Summary description for sendMail
/// </summary>
public class Mail
{
    public static String sendMail(String strDe, String strTituloDe, String strPara, String strTituloPara, String strPara2, String strTituloPara2, String strPara3, String strTituloPara3 , String strSubject, String strBody, Boolean blnIsBodyHtml)
	{
        //------------------------------------------------
        try
        {
            MailAddress de = new MailAddress(strDe, strTituloDe);
            MailAddress para = new MailAddress(strPara, strTituloPara);

            Boolean bdnCorreo2 = true;
            if (strPara2.Trim().Length == 0)
            {
                bdnCorreo2 = false;
                strPara2 = strPara;
                strTituloPara2 = strTituloPara;
            }

            MailAddress para2 = new MailAddress(strPara2, strTituloPara2);

            Boolean bdnCorreo3=true;
            if (strPara3.Trim().Length == 0)
            {
                bdnCorreo3 = false;
                strPara3 = strPara2;
                strTituloPara3 = strTituloPara2;
            }
            MailAddress para3 = new MailAddress(strPara3, strTituloPara3);

            MailMessage mensaje = new MailMessage(de, para);

            if (bdnCorreo2)
                    {
                        mensaje.To.Add(para2);
                    }

            if (bdnCorreo3)
                    {
                    mensaje.To.Add(para3);
                    }

            // mensaje.Bcc.Add(txtEmail.Text);
            mensaje.Subject = strSubject;
            mensaje.BodyEncoding = System.Text.Encoding.Default;
            mensaje.IsBodyHtml = blnIsBodyHtml;
            mensaje.Body = strBody;
            mensaje.IsBodyHtml = blnIsBodyHtml;

            String[] strSalidaCorreo = System.Configuration.ConfigurationSettings.AppSettings["cuentaSalidaCorreo"].ToString().Split(',');
            SmtpClient cliente = new SmtpClient(strSalidaCorreo[0]);
           
            cliente.Port = Int32.Parse(strSalidaCorreo[1]);
            cliente.Credentials = new System.Net.NetworkCredential(strSalidaCorreo[2], strSalidaCorreo[3]);

            cliente.Send(mensaje);
            // procesado = true;
            return "";
        }
        catch (Exception ex)
        {
            //lblMensaje.Text = ex.Message;
            return ex.Message;
        }
        //------------------------------------------------

	}

}
