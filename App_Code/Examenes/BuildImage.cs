using System;
using System.Web;
using System.IO;
using Ghostscript.NET;/// <summary>
using Ghostscript.NET.Rasterizer;
using System.Drawing;
using System.Drawing.Imaging;
using CotizadorCalvek.Blob_Storage;

/// Descripción breve de BuildImage
/// </summary>
public class BuildImage
{
    public BuildImage()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public string convertFileToImage(byte[] buffer, string Url, string UrlFileOld = null)
    {
        System.Drawing.Image imgRe = null;
        BlobManager blob = new BlobManager();
        Rectangle rec = new Rectangle();
        string urlImage = "";
        try
        {
            int desired_x_dpi = 96;
            int desired_y_dpi = 96;

            using (GhostscriptRasterizer rasterizer = new GhostscriptRasterizer())
            {
                MemoryStream ms = new MemoryStream(buffer);

                string gsdll = HttpContext.Current.Request.MapPath("~/Dlls/gsdll32.dll");

                GhostscriptVersionInfo gvi =
                new GhostscriptVersionInfo(gsdll);

                rasterizer.Open(ms, gvi, true);

                //for (int pageNumber = 1; pageNumber <= rasterizer.PageCount; pageNumber++)
                //{


                System.Drawing.Image img = rasterizer.GetPage(desired_x_dpi, desired_y_dpi, 1);

                //Rectangle rec = new Rectangle(20, 200, 790, 400);
                if (getNamePage(Url) == 1)
                    rec = new Rectangle(20, 145, 790, 620);
                else if (getNamePage(Url) == 2)
                    rec = new Rectangle(20, 89, 790, 750);


                System.Drawing.Image imgCrop = cropimage(img, rec);

                if (UrlFileOld != null)
                {
                    if (blob.DeleteByResourceId(UrlFileOld))
                        urlImage = saveImageBlob(imgCrop);
                }
                else
                {

                    urlImage = saveImageBlob(imgCrop);
                }

            }
        

            return urlImage;
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    public string saveImageBlob(Image imgCrop)
    {

        BlobManager blob = new BlobManager();
        var msStream = new MemoryStream();
      
        imgCrop.Save(msStream, ImageFormat.Jpeg);
        msStream.Close();

        //Se obtiene el buffer de la imagen construida.
        var bu = msStream.GetBuffer();
        MemoryStream mst = new MemoryStream(bu);


        return blob.UploadImageByStream(mst, "Audiometria_Usuario_.JPG");
    }

    public Image cropimage(Image img, Rectangle cropArea)
    {
        Bitmap bmpImage = new Bitmap(img);
        Bitmap bmpCrop = bmpImage.Clone(cropArea,
        bmpImage.PixelFormat);
        int wi = bmpImage.Width;
        int he = bmpImage.Height;

        return (Image)(bmpCrop);
    }

    public int numPapeleta(String name)
    {
        int IdPaciente = 0;
        String[] numero = name.Split('-');

        IdPaciente = string.IsNullOrEmpty(numero[0]) ? 0 : Convert.ToInt32(numero[0]);
        return IdPaciente;
    }

    private int getNamePage(string Url)
    {
        int option = 0;
        switch (Url)
        {
            case "Audiometria.aspx":
                option = 1;
                break;
            case "Espirometria.aspx":
                option = 2;
                break;
            default:
                break;
        }

        return option;
    }


}