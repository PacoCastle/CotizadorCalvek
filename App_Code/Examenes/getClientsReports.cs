using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


/// <summary>
/// Descripción breve de getClientsReports
/// </summary>
public class getClientsReports
{
    public getClientsReports()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public DataTable getRowClientTable(int id)
    {

        DataTable oDataTableGridView = (DataTable)HttpContext.Current.Session["TableSelect"];
        DataTable oDataResult = new DataTable();
        IEnumerable<DataRow> query = from examen in oDataTableGridView.AsEnumerable()
                                     where examen.Field<Int32>("ID_DG") == Convert.ToInt32(id)
                                     select examen;
        oDataResult = query.CopyToDataTable<DataRow>();

        return oDataResult;
    }
}