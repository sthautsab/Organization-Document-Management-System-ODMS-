using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace ODMS.Dal
{
    public class DocumentStatusDal
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        public async Task<List<DocumentStatus>> GetData()
        {
            List<DocumentStatus> data = new List<DocumentStatus>();
            using (con)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_readDocumentStatus]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        data.Add(new DocumentStatus()
                        {
                            SId = Convert.ToInt32(row["SId"]),
                            DocumentId = Convert.ToInt32(row["DocumentId"]),
                            DepartmentId = Convert.ToInt32(row["DepartmentId"]),
                            ApprovedBy = row.IsNull("ApprovedBy") ? null : row.Field<string>("ApprovedBy"),
                            StatusId = Convert.ToInt32(row["StatusId"]),
                            Remarks = row.IsNull("Remarks") ? null : row.Field<string>("Remarks"),
                            // Remarks = (string)row["Remarks"],
                            EntryDate = Convert.ToDateTime(row["EntryDate"]),
                            UserId = Convert.ToInt32(row["UserId"])

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

        public async Task<int> CreateData(DocumentStatus receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (con)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_createDocumentStatus]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DocumentId", receivedDocument.DocumentId);
                cmd.Parameters.AddWithValue("@DepartmentId", receivedDocument.DepartmentId);
                cmd.Parameters.AddWithValue("@ApprovedBy", receivedDocument.ApprovedBy);
                cmd.Parameters.AddWithValue("@StatusId", receivedDocument.StatusId);
                cmd.Parameters.AddWithValue("@Remarks", receivedDocument.Remarks);
                cmd.Parameters.AddWithValue("@EntryDate", receivedDocument.EntryDate);
                cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);

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

        public async Task<int> insertUpdate(DocumentStatus receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_insertUpdateDocumentStatus]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                //incase to update null value in the cell
                object parameterRemarks = receivedDocument.Remarks;
                if (string.IsNullOrEmpty(receivedDocument.Remarks))
                    parameterRemarks = DBNull.Value;
                cmd.Parameters.AddWithValue("@Remarks", parameterRemarks);

                object parameterUserId = receivedDocument.UserId;
                if (string.IsNullOrEmpty(Convert.ToString(receivedDocument.UserId)))
                    parameterUserId = DBNull.Value;
                cmd.Parameters.AddWithValue("@UserId", parameterUserId);

                //object parameterUserId = !string.IsNullOrEmpty(Convert.ToString(receivedDocument.UserId)) ? receivedDocument.UserId : (object)DBNull.Value;
                //cmd.Parameters.AddWithValue("@UserId", parameterUserId);

                object parameterApprovedBy = receivedDocument.ApprovedBy;
                if (string.IsNullOrEmpty(Convert.ToString(receivedDocument.ApprovedBy)))
                    parameterApprovedBy = DBNull.Value;
                cmd.Parameters.AddWithValue("@ApprovedBy", parameterApprovedBy);

                cmd.Parameters.AddWithValue("@SId", receivedDocument.SId);
                cmd.Parameters.AddWithValue("@DocumentId", receivedDocument.DocumentId);
                cmd.Parameters.AddWithValue("@DepartmentId", receivedDocument.DepartmentId);
                //   cmd.Parameters.AddWithValue("@ApprovedBy", receivedDocument.ApprovedBy);
                cmd.Parameters.AddWithValue("@StatusId", receivedDocument.StatusId);
                // cmd.Parameters.AddWithValue("@Remarks", receivedDocument.Remarks);
                cmd.Parameters.AddWithValue("@EntryDate", receivedDocument.EntryDate);
                //  cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);

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

        public async Task<int> Edit(int id, DocumentStatus receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_editDocumentStatus]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SId", id);
                cmd.Parameters.AddWithValue("@DocumentId", receivedDocument.DocumentId);
                cmd.Parameters.AddWithValue("@DepartmentId", receivedDocument.DepartmentId);
                cmd.Parameters.AddWithValue("@ApprovedBy", receivedDocument.ApprovedBy);
                cmd.Parameters.AddWithValue("@StatusId", receivedDocument.StatusId);
                cmd.Parameters.AddWithValue("@Remarks", receivedDocument.Remarks);
                cmd.Parameters.AddWithValue("@EntryDate", receivedDocument.EntryDate);
                cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);

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
        //public int GetDocumentStatus(int DId)
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        //    SqlCommand cmd = new SqlCommand("[dbo].[sp_getDocumentStatus]");
        //    cmd.CommandType = CommandType.StoredProcedure;

        //    cmd.Parameters.AddWithValue("@DId", DId);


        //}

    }
}