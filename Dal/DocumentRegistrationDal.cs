using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace ODMS.Dal
{
    public class DocumentRegistrationDal
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        public async Task<List<DocumentRegistration>> GetData()
        {
            List<DocumentRegistration> data = new List<DocumentRegistration>();
            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString)
)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_read]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        data.Add(new DocumentRegistration()
                        {
                            DId = Convert.ToInt32(row["DId"]),
                            DartaNo = Convert.ToInt32(row["DartaNo"]),
                            DocumentTitle = (string)row["DocumentTitle"],
                            Organization = (string)row["Organization"],
                            StateId = Convert.ToInt32(row["StateId"]),
                            DistrictId = Convert.ToInt32(row["DistrictId"]),
                            VDCMUNId = Convert.ToInt32(row["VDCMUNId"]),
                            WardNo = Convert.ToInt32(row["WardNo"]),

                            Tole = (string)row["Tole"],
                            Email = (string)row["Email"],
                            Phone = (string)row["Phone"],

                            MobileNo = (string)row["MobileNo"],

                            EntryDate = (DateTime)row["EntryDate"],
                            UserId = Convert.ToInt32(row["UserId"]),
                            DocumentPath = (string)row["DocumentPath"],

                            IsActive = (bool)row["IsActive"],
                            Remarks = (string)row["Remarks"]


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

        public async Task<int> InsertUpdate(DocumentRegistration receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);

            using (con)
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_InsertUpdate]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DId", receivedDocument.DId);
                cmd.Parameters.AddWithValue("@DartaNo", receivedDocument.DartaNo);
                cmd.Parameters.AddWithValue("@DocumentTitle", receivedDocument.DocumentTitle);
                cmd.Parameters.AddWithValue("@Organization", receivedDocument.Organization);
                cmd.Parameters.AddWithValue("@StateId", receivedDocument.StateId);
                cmd.Parameters.AddWithValue("@DistrictId", receivedDocument.DistrictId);
                cmd.Parameters.AddWithValue("@VDCMUNId", receivedDocument.VDCMUNId);
                cmd.Parameters.AddWithValue("@WardNo", receivedDocument.WardNo);
                cmd.Parameters.AddWithValue("@Tole", receivedDocument.Tole);
                cmd.Parameters.AddWithValue("@Email", receivedDocument.Email);
                cmd.Parameters.AddWithValue("@Phone", receivedDocument.Phone);
                cmd.Parameters.AddWithValue("@MobileNo", receivedDocument.MobileNo);
                cmd.Parameters.AddWithValue("@EntryDate", receivedDocument.EntryDate);
                cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);
                cmd.Parameters.AddWithValue("@DocumentPath", receivedDocument.DocumentPath);
                cmd.Parameters.AddWithValue("@IsActive", receivedDocument.IsActive);
                cmd.Parameters.AddWithValue("@Remarks", receivedDocument.Remarks);

                SqlParameter returnParameter = new SqlParameter();
                returnParameter.ParameterName = "@id";
                returnParameter.SqlDbType = SqlDbType.Int;
                returnParameter.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnParameter);
                await con.OpenAsync();
                int x = await cmd.ExecuteNonQueryAsync();
                con.Close();
                //return x;
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
        public async Task<int> CreateData(DocumentRegistration receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (con)
            {
                SqlCommand cmd = new SqlCommand("dbo.sp_create", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DartaNo", receivedDocument.DartaNo);
                cmd.Parameters.AddWithValue("@DocumentTitle", receivedDocument.DocumentTitle);
                cmd.Parameters.AddWithValue("@Organization", receivedDocument.Organization);
                cmd.Parameters.AddWithValue("@StateId", receivedDocument.StateId);
                cmd.Parameters.AddWithValue("@DistrictId", receivedDocument.DistrictId);
                cmd.Parameters.AddWithValue("@VDCMUNId", receivedDocument.VDCMUNId);
                cmd.Parameters.AddWithValue("@WardNo", receivedDocument.WardNo);
                cmd.Parameters.AddWithValue("@Tole", receivedDocument.Tole);
                cmd.Parameters.AddWithValue("@Email", receivedDocument.Email);
                cmd.Parameters.AddWithValue("@Phone", receivedDocument.Phone);
                cmd.Parameters.AddWithValue("@MobileNo", receivedDocument.MobileNo);
                cmd.Parameters.AddWithValue("@EntryDate", receivedDocument.EntryDate);
                cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);
                cmd.Parameters.AddWithValue("@DocumentPath", receivedDocument.DocumentPath);
                cmd.Parameters.AddWithValue("@IsActive", receivedDocument.IsActive);
                cmd.Parameters.AddWithValue("@Remarks", receivedDocument.Remarks);

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

        public async Task<int> Edit(int id, DocumentRegistration receivedDocument)
        {
            if (receivedDocument == null)
            {
                throw new InvalidExpressionException("Empty Object");
            }
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_edit]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DId", id);
                cmd.Parameters.AddWithValue("@DartaNo", receivedDocument.DartaNo);
                cmd.Parameters.AddWithValue("@DocumentTitle", receivedDocument.DocumentTitle);
                cmd.Parameters.AddWithValue("@Organization", receivedDocument.Organization);
                cmd.Parameters.AddWithValue("@StateId", receivedDocument.StateId);
                cmd.Parameters.AddWithValue("@DistrictId", receivedDocument.DistrictId);
                cmd.Parameters.AddWithValue("@VDCMUNId", receivedDocument.VDCMUNId);
                cmd.Parameters.AddWithValue("@WardNo", receivedDocument.WardNo);
                cmd.Parameters.AddWithValue("@Tole", receivedDocument.Tole);
                cmd.Parameters.AddWithValue("@Email", receivedDocument.Email);
                cmd.Parameters.AddWithValue("@Phone", receivedDocument.Phone);
                cmd.Parameters.AddWithValue("@MobileNo", receivedDocument.MobileNo);
                cmd.Parameters.AddWithValue("@EntryDate", receivedDocument.EntryDate);
                cmd.Parameters.AddWithValue("@UserId", receivedDocument.UserId);
                cmd.Parameters.AddWithValue("@DocumentPath", receivedDocument.DocumentPath);
                cmd.Parameters.AddWithValue("@IsActive", receivedDocument.IsActive);
                cmd.Parameters.AddWithValue("@Remarks", receivedDocument.Remarks);

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
                SqlCommand cmd = new SqlCommand("[dbo].[sp_delete]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DId", id);
                await con.OpenAsync();
                await cmd.ExecuteNonQueryAsync();
                con.Close();
            }
        }

    }
}