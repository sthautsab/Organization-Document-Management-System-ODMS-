using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace ODMS.Dal
{
    public class StatusDal
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        public async Task<List<tbl_Status>> GetData()
        {
            List<tbl_Status> data = new List<tbl_Status>();
            using (con)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_readStatus]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        data.Add(new tbl_Status()
                        {
                            SId = Convert.ToInt32(row["SId"]),
                            Status = (string)row["Status"],
                            IsActive = (bool)row["IsActive"]

                        });
                    }
                    return data;
                }
                else
                {
                    return null;
                }
            }
        }

        public async Task<int> CreateData(tbl_Status receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (con)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_createStatus]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Status", receivedDocument.Status);
                cmd.Parameters.AddWithValue("@IsActive", receivedDocument.IsActive);


                SqlParameter returnParameter = new SqlParameter();
                returnParameter.ParameterName = "@id";
                returnParameter.SqlDbType = SqlDbType.Int;
                returnParameter.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnParameter);
                await con.OpenAsync();
                int x = await cmd.ExecuteNonQueryAsync();
                con.Close();
                if (x > 0)
                {
                    return (int)returnParameter.Value;
                }
                else
                {
                    return 0;
                }
            }
        }

        public async Task<int> insertUpdate(tbl_Status receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (con)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_insertUpdateStatus]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SId", receivedDocument.SId);

                cmd.Parameters.AddWithValue("@Status", receivedDocument.Status);
                cmd.Parameters.AddWithValue("@IsActive", receivedDocument.IsActive);


                SqlParameter returnParameter = new SqlParameter();
                returnParameter.ParameterName = "@id";
                returnParameter.SqlDbType = SqlDbType.Int;
                returnParameter.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnParameter);
                await con.OpenAsync();
                int x = await cmd.ExecuteNonQueryAsync();
                con.Close();
                if (x > 0)
                {
                    return (int)returnParameter.Value;
                }
                else
                {
                    return 0;
                }
            }
        }

        public async Task<int> Edit(int id, tbl_Status receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_editStatus]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SId", id);
                cmd.Parameters.AddWithValue("@Status", receivedDocument.Status);
                cmd.Parameters.AddWithValue("@IsActive", receivedDocument.IsActive);

                SqlParameter returnParameter = new SqlParameter();
                returnParameter.ParameterName = "@idd";
                returnParameter.SqlDbType = SqlDbType.Int;
                returnParameter.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnParameter);
                await con.OpenAsync();
                int x = await cmd.ExecuteNonQueryAsync();
                con.Close();
                if (x > 0)
                {
                    return (int)returnParameter.Value;
                }
                else
                {
                    return 0;
                }
            }

        }

        public async void DeleteData(int id)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_deleteStatus]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SId", id);
                await con.OpenAsync();
                await cmd.ExecuteNonQueryAsync();
                con.Close();
            }
        }

    }
}