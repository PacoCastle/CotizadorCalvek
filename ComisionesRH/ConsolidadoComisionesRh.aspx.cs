using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoverScreen
{
    public partial class ComisionesRH_ConsolidadoComisionesRh : System.Web.UI.Page
    {
        private static int NUMFUNCION = 72;

        protected void Page_Load(object sender, EventArgs e)
        {
            String error = Utilis.validaPermisos(Session, NUMFUNCION);
            if (!error.Equals(""))
            {
                Response.Redirect(error);
            }

            if (!IsPostBack)
            {
                int añoActual = DateTime.Now.Year;
                if (añoActual == 2015)
                {
                    txtMesCong.Text = "Septiembre";
                }
                else if (añoActual > 2015)
                {
                    txtMesCong.Text = "Enero";
                }

            }
        }

        protected void ventasInternas_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Width = Unit.Pixel(50);
                e.Row.Cells[1].Width = Unit.Pixel(100);
                e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Left;

                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (e.Row.Cells[i].Text == "&nbsp;")
                    {
                        e.Row.Cells[i].Text = "0.00";
                    }
                }

                //Meta Personal + K
                string metPersonal = e.Row.Cells[6].Text;
                int noMetPersonal = metPersonal.Length;
                if (noMetPersonal > 3)
                {
                    e.Row.Cells[6].Text = metPersonal.Remove(metPersonal.Length - 3, 3) + "K";
                }

                //Meta Oficina + K
                string metOficina = e.Row.Cells[7].Text;
                int noMetOficina = metPersonal.Length;
                if (noMetOficina > 3)
                {
                    e.Row.Cells[7].Text = metOficina.Remove(metOficina.Length - 3, 3) + "K";
                }

            }
        }

        protected void oficnaCom_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Left;

                if (e.Row.Cells[1].Text == "&nbsp;")
                {
                    e.Row.Cells[1].Text = "0.00";
                }

                if (e.Row.Cells[3].Text == "&nbsp;")
                {
                    e.Row.Cells[3].Text = "0.00";
                }
            }
        }

        protected void ventasExternas_rowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Width = Unit.Pixel(50);
                e.Row.Cells[7].Width = Unit.Pixel(20);
                e.Row.Cells[9].Width = Unit.Pixel(100);
                e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Left;
                e.Row.Cells[1].Width = Unit.Pixel(65);

                for (int i = 0; i < e.Row.Cells.Count; i++)
                {
                    if (e.Row.Cells[i].Text == "&nbsp;")
                    {
                        e.Row.Cells[i].Text = "0.00";
                    }
                }

                if (e.Row.Cells[7].Text == "Aplica")
                {
                    e.Row.Cells[7].Text = "";
                    e.Row.Cells[7].Text = "SI";
                }

                if (e.Row.Cells[7].Text == "No Aplica")
                {
                    e.Row.Cells[7].Text = "";
                    e.Row.Cells[6].Text = "0.00";
                    e.Row.Cells[7].Text = "NO";
                }

                if (e.Row.Cells[7].Text == "SG")
                {
                    e.Row.Cells[7].Text = "N/A";
                }
            }
        }

        protected void lstMes_onChange(object sender, EventArgs e)
        {
            txtMesCong.Text = lstMes.SelectedItem.ToString();
        }

        protected void congelaCom_OnClick(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(3000);

            //Se recuperan los parametros
            int mesStr = Int32.Parse(lstMes.SelectedValue.ToString());
            int anioStr = Int32.Parse(lstYear.SelectedItem.ToString());

            //Comienza el insert de datos
            ComisionesVO VO = new ComisionesVO();
            ComisionesBL BL = new ComisionesBL();

            VO.Año = anioStr;
            VO.Mes = mesStr;

            VO.Operacion = ComisionesVO.CONGELAR;
            VO = (ComisionesVO)BL.execute(VO);

            if (VO.Resultado == 1)
            {
                this.ctrPopup1.Show();

            }
            else if (VO.Resultado == -1)
            {
                this.ctrPopup2.Show();
            }
        }

        protected void popupClose_Click(object sender, EventArgs e)
        {
            ctrPopup1.Hide();
            ctrPopup2.Hide();
        }

        protected void lstAnio_onChange(object sender, EventArgs e)
        {
            int anioSelected = Int32.Parse(lstYear.SelectedItem.ToString());
            if (anioSelected == 2015)
            {
                txtMesCong.Text = "Septiembre";
            }
            else if (anioSelected > 2015)
            {
                txtMesCong.Text = "Enero";
            }
        }
    }
}