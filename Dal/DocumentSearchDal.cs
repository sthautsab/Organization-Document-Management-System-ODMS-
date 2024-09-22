using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace ODMS.Dal
{
    public class DocumentSearchDal
    {
        public async Task<List<DocumentSearch>> GetSearchedDocuements(string DocumentTitle, string Organization, int? StateId, string DepartmentName)
        {
            List<DocumentSearch> searchedDocuments = new List<DocumentSearch>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_searchDocument]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DocumentTitle", DocumentTitle);
                cmd.Parameters.AddWithValue("@Organization", Organization);
                cmd.Parameters.AddWithValue("@StateId", StateId);
                cmd.Parameters.AddWithValue("@DepartmentName", DepartmentName);

                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        searchedDocuments.Add(new DocumentSearch()
                        {
                            DId = Convert.ToInt32(row["DId"]),
                            DartaNo = Convert.ToInt32(row["DartaNo"]),
                            DocumentTitle = row.IsNull("DocumentTitle") ? null : row.Field<string>("DocumentTitle"),
                            Organization = row.IsNull("Organization") ? null : row.Field<string>("Organization"),
                            StateId = row.IsNull("StateId") ? 0 : row.Field<int>("StateId"),
                            DistrictId = row.IsNull("DistrictId") ? 0 : row.Field<int>("DistrictId"),
                            VDCMUNId = row.IsNull("VDCMUNId") ? 0 : row.Field<int>("VDCMUNId"),
                            MobileNo = row.IsNull("MobileNo") ? null : row.Field<string>("MobileNo"),
                            DepartmentName = row.IsNull("DepartmentName") ? null : row.Field<string>("DepartmentName"),
                            Status = row.IsNull("Status") ? null : row.Field<string>("Status")
                        });
                    }
                    return searchedDocuments;
                }
                else
                {
                    return null;
                }
            }
        }

        public async Task<List<MainView>> GetMainViewWithDocumentSearch(int? DartaNo, string DocumentTitle, string Organization, string StateName, string District, string VDCName, string Status)
        {
            List<MainView> mainViewSearchedDocuments = new List<MainView>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_mainViewWithDocumentstatus", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DartaNo", DartaNo);
                cmd.Parameters.AddWithValue("@DocumentTitle", DocumentTitle);
                cmd.Parameters.AddWithValue("@Organization", Organization);
                cmd.Parameters.AddWithValue("@StateName", StateName);
                cmd.Parameters.AddWithValue("@District", District);
                cmd.Parameters.AddWithValue("@VDCName", VDCName);
                cmd.Parameters.AddWithValue("@Status", Status);

                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        string supportingDocumentString = row.IsNull("SupportingDocuments") ? null : row.Field<string>("SupportingDocuments");
                        List<string> supportingDocuments = new List<string>();
                        if (supportingDocumentString != null)
                        {
                            supportingDocuments = supportingDocumentString.Split('`').ToList();
                            foreach (var st in supportingDocuments)
                            {
                                Debug.WriteLine(st);
                            }
                        }
                        else
                        {
                            supportingDocuments = null;
                        }

                        mainViewSearchedDocuments.Add(new MainView()
                        {
                            DId = Convert.ToInt32(row["DId"]),
                            DartaNo = Convert.ToInt32(row["DartaNo"]),
                            DocumentTitle = row.IsNull("DocumentTitle") ? null : row.Field<string>("DocumentTitle"),
                            DocumentPath = row.IsNull("DocumentPath") ? null : row.Field<string>("DocumentPath"),
                            Organization = row.IsNull("Organization") ? null : row.Field<string>("Organization"),
                            StateId = row.IsNull("StateId") ? 0 : row.Field<int>("StateId"),
                            StateName = row.IsNull("StateName") ? null : row.Field<string>("StateName"),
                            DistrictId = row.IsNull("DistrictId") ? 0 : row.Field<int>("DistrictId"),
                            District = row.IsNull("District") ? null : row.Field<string>("District"),
                            VDCMUNId = row.IsNull("VDCMUNId") ? 0 : row.Field<int>("VDCMUNId"),
                            VDCName = row.IsNull("VDCName") ? null : row.Field<string>("VDCName"),
                            MobileNo = row.IsNull("MobileNo") ? null : row.Field<string>("MobileNo"),
                            Status = row.IsNull("Status") ? null : row.Field<string>("Status"),
                            SupportingDocuments = supportingDocuments
                        });
                    }
                    return mainViewSearchedDocuments;
                }
                else
                {
                    return null;
                }
            }
        }

    }
}