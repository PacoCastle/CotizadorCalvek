using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Configuration;

/// <summary>
/// Descripción breve de encryption
/// </summary>
public class encryption
{
    public String key;
    public encryption()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
   /// <summary>
   /// Encripta la cadena 
   /// </summary>
   /// <param name="texto"></param>
   /// <returns></returns>
    public  string Encriptar(string texto)
    {
        try
        {

            key = ConfigurationManager.AppSettings["crypMd5"].ToString(); //llave para encriptar datos

            byte[] keyArray;

            byte[] Arreglo_a_Cifrar = UTF8Encoding.UTF8.GetBytes(texto);

            //Se utilizan las clases de encriptación MD5

            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();

            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));

            hashmd5.Clear();

            //Algoritmo TripleDES
            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();

            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateEncryptor();

            byte[] ArrayResultado = cTransform.TransformFinalBlock(Arreglo_a_Cifrar, 0, Arreglo_a_Cifrar.Length);

            tdes.Clear();

            //se regresa el resultado en forma de una cadena
            texto = Convert.ToBase64String(ArrayResultado, 0, ArrayResultado.Length);

        }
        catch (Exception ex)
        {
            throw ex;
        }
        return texto;
    }

    /// <summary>
    /// Desencripta la cadena 
    /// </summary>
    /// <param name="textoEncriptado"></param>
    /// <returns></returns>
    public  string Desencriptar(string textoEncriptado)
    {
        try
        {
            key = ConfigurationManager.AppSettings["crypMd5"].ToString(); //llave para encriptar datos
            byte[] keyArray;
            byte[] Array_a_Descifrar = Convert.FromBase64String(textoEncriptado);

            //algoritmo MD5
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();

            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));

            hashmd5.Clear();

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();

            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateDecryptor();

            byte[] resultArray = cTransform.TransformFinalBlock(Array_a_Descifrar, 0, Array_a_Descifrar.Length);

            tdes.Clear();
            textoEncriptado = UTF8Encoding.UTF8.GetString(resultArray);

        }
        catch (Exception ex)
        {

        }
        return textoEncriptado;
    }
}