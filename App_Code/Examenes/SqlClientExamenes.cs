using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de SqlClientExamenes
/// </summary>
public class SqlClientExamenes
{
    public SqlClientExamenes()
    {
        //
        // TODO: Agregar aquí la lógica del constructor

        //
    }

    public int  changeProspecto(String StoredProcedure, Dictionary<string, object> DicValor)
    {
        int result;
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand(StoredProcedure, con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = StoredProcedure;

                    foreach (var Dic in DicValor)
                    {
                        cmd.Parameters.AddWithValue(Dic.Key, Dic.Value);
                    }

                    result = cmd.ExecuteNonQuery();
                    con.Close();
                    return result;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        //return oDataTable;
    }

    public int changeProspectoByEstatus(String StoredProcedure, Dictionary<string, object> DicValor)
    {
        int result;
        DataTable oData = new DataTable();
        SqlDataReader oReader;
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand(StoredProcedure, con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = StoredProcedure;

                    foreach (var Dic in DicValor)
                    {
                        cmd.Parameters.AddWithValue(Dic.Key, Dic.Value);
                    }

                    oReader = cmd.ExecuteReader();
                    oData.Load(oReader);

                    result = Convert.ToInt32(oData.Rows[0][0].ToString());
                    con.Close();
                    return result;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public DataTable  getDataDropDown(String Instruccion)
    {
        DataTable oDataTable = new DataTable();
        SqlDataReader oReader;
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand(Instruccion, con))
                {
                    con.Open();
                    oReader = cmd.ExecuteReader();
                    oDataTable.Load(oReader);
                    con.Close();
                }
            }

            return oDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public DataTable getDataProspect(String StoredProcedure, Dictionary<string, object> DicValor = null)
    {
        DataTable oDataTable = new DataTable(); 
        SqlDataReader oReader;

        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cotizadorCS"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand(StoredProcedure, con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = StoredProcedure;


                    if (DicValor != null)
                    {
                        foreach (var Dic in DicValor)
                        {
                            cmd.Parameters.AddWithValue(Dic.Key, Dic.Value);
                        }
                    }

                    oReader = cmd.ExecuteReader();
                    oDataTable.Load(oReader);
                    con.Close();
                }
            }
            return oDataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
       
    }

}