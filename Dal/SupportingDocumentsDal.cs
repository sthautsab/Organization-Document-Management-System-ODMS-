using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace ODMS.Dal
{
    public class SupportingDocumentsDal
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        public async Task<List<SupportingDocuments>> GetData()
        {
            List<SupportingDocuments> data = new List<SupportingDocuments>();
            using (con)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_readSupportingDocuments]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        data.Add(new SupportingDocuments()
                        {
                            SDId = Convert.ToInt32(row["SDId"]),
                            DocId = Convert.ToInt32(row["DocId"]),
                            DocumentTitle = (string)row["DocumentTitle"],
                            DocumentPath = (string)row["DocumentPath"],
                            UserId = Convert.ToInt32(row["UserId"]),
                            UploadedDate = Convert.ToDateTime(row["UploadedDate"]),
                            IsActive = (bool)row["IsActive"]
                        }); ;
                    }
                    return data;
                }
                else
                {
                    return null;
                }
            }
        }


        public async Task<int> CreateData(SupportingDocuments receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);

            SqlCommand cmd = new SqlCommand("[dbo].[sp_createSupportingDocuments]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DocId", receivedDocument.DocId);
            cmd.Parameters.AddWithValue("@DocumentTitle", receivedDocument.DocumentTitle);
            cmd.Parameters.AddWithValue("@DocumentPath", receivedDocument.DocumentPath);
            cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);
            cmd.Parameters.AddWithValue("@UploadedDate", receivedDocument.UploadedDate);
            cmd.Parameters.AddWithValue("@IsActive", receivedDocument.IsActive);

            //my stored procedure returns recently created identity ie primary key of current created tuple
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

        public async Task<int> InsertUpdate(SupportingDocuments receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);

            SqlCommand cmd = new SqlCommand("[dbo].[sp_insertUpdateSupportingDocuments]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SDId", receivedDocument.SDId);
            cmd.Parameters.AddWithValue("@DocId", receivedDocument.DocId);
            cmd.Parameters.AddWithValue("@DocumentTitle", receivedDocument.DocumentTitle);
            cmd.Parameters.AddWithValue("@DocumentPath", receivedDocument.DocumentPath);
            cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);
            cmd.Parameters.AddWithValue("@UploadedDate", receivedDocument.UploadedDate);
            cmd.Parameters.AddWithValue("@IsActive", receivedDocument.IsActive);

            //my stored procedure returns recently created identity ie primary key of current created tuple
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

        public async Task<int> Edit(int id, SupportingDocuments receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_editSupportingDocuments]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SDId", id);
                cmd.Parameters.AddWithValue("@DocId", receivedDocument.DocId);
                cmd.Parameters.AddWithValue("@DocumentTitle", receivedDocument.DocumentTitle);

                cmd.Parameters.AddWithValue("@DocumentPath", receivedDocument.DocumentPath);
                cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);
                cmd.Parameters.AddWithValue("@UploadedDate", receivedDocument.UploadedDate);

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
                SqlCommand cmd = new SqlCommand("[dbo].[sp_deleteSupportingDocuments]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SDId", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public async Task<int> GetDartanoByDocId(int docId)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_getDartanoByDocId]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DocId", docId);
                await con.OpenAsync();
                object dartano = await cmd.ExecuteScalarAsync();

                con.Close();
                return Convert.ToInt32(dartano);
            }
        }

    }
}