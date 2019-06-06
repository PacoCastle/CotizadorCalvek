using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de EnumMessage
/// </summary>
public class EnumMessage
{
    public EnumMessage()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    public static readonly string DatosGenerales = "DatosGenerales.aspx";
    public static readonly string ExamenGeneral = "ExamenGral.aspx";
    public static readonly string Laboratorios = "Laboratorios.aspx";
    public static readonly string Toxicologico = "Toxicologico.aspx";
    public static readonly string Interpretacion = "Interpretacion.aspx";


    public enum  Message
    {
        ShowAlertSucess = 1,
        ShowAlertSucesseEdit = 2,
        ShowAlertError = 3,
        ShowAlertInfo = 4,
        ShowAlertErrorUrl = 5,
        ShowAlertCotizadorSucess = 6
    }

    public String buildMessage(String newMessage)
    {
        String message = String.Empty;

        message = newMessage.Replace("'", "");
        message = message.Replace(Environment.NewLine, "");
        return message.Trim();
    }
}