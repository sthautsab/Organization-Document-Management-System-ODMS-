using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace ODMS.Dal
{
    public class DepartmentDal
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        public async Task<List<Department>> GetData()
        {
            List<Department> data = new List<Department>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_readDepartment]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        data.Add(new Department()
                        {
                            DeportId = Convert.ToInt32(row["DeportId"]),
                            OrgId = Convert.ToInt32(row["OrgId"]),
                            DepartmentName = (string)row["DepartmentName"],
                            DepartmentCode = Convert.ToInt32(row["DepartmentCode"]),
                            EntryDate = Convert.ToDateTime(row["EntryDate"]),
                            UserId = Convert.ToInt32(row["UserId"]),
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

        public async Task<int> GetNumberOfDepartment()
        {
            List<Department> data = new List<Department>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_readDepartment]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                return dt.Rows.Count;

            }
        }

        public async Task<int> CreateData(Department receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (con)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_createDepartment]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OrgId", receivedDocument.OrgId);
                cmd.Parameters.AddWithValue("@DepartmentName", receivedDocument.DepartmentName);
                cmd.Parameters.AddWithValue("@DepartmentCode", receivedDocument.DepartmentCode);
                cmd.Parameters.AddWithValue("@EntryDate", receivedDocument.EntryDate);
                cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);
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


        public async Task<int> insertUpdate(Department receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (con)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_insertUpdateDepartment]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeportId", receivedDocument.DeportId);
                cmd.Parameters.AddWithValue("@OrgId", receivedDocument.OrgId);
                cmd.Parameters.AddWithValue("@DepartmentName", receivedDocument.DepartmentName);
                cmd.Parameters.AddWithValue("@DepartmentCode", receivedDocument.DepartmentCode);
                cmd.Parameters.AddWithValue("@EntryDate", receivedDocument.EntryDate);
                cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);
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


        public async Task<int> Edit(int id, Department receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_editDepartment]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeportId", id);
                cmd.Parameters.AddWithValue("@OrgId", receivedDocument.OrgId);
                cmd.Parameters.AddWithValue("@DepartmentName", receivedDocument.DepartmentName);
                cmd.Parameters.AddWithValue("@DepartmentCode", receivedDocument.DepartmentCode);
                cmd.Parameters.AddWithValue("@EntryDate", receivedDocument.EntryDate);
                cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);
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

        public void DeleteData(int id)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_deleteDepartment]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeportId", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

    }
}