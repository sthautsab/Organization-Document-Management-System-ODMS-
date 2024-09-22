using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace ODMS.Dal
{
    public class DocumentTrackDal
    {
        public List<DocumentTrack> GetDocument()
        {
            List<DocumentTrack> documentTracks = new List<DocumentTrack>();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            SqlCommand cmd = new SqlCommand("[dbo].[sp_trackDocument]", con);
            cmd.CommandType = CommandType.StoredProcedure;

            DataTable dt = new DataTable();
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    documentTracks.Add(new DocumentTrack()
                    {
                        DId = Convert.ToInt32(row["DId"]),
                        SId = Convert.ToInt32(row["SId"]),
                        DocumentTitle = Convert.ToString(row["DocumentTitle"]),
                        IsActive = (bool)row["IsActive"],
                        DepartmentName = (string)row["DepartmentName"],
                        ApprovedBy = (string)row["ApprovedBy"],
                        Status = (string)row["Status"],
                        DocumentPath = (string)row["DocumentPath"],
                        EntryDate = (DateTime)row["EntryDate"]
                    });
                }
                return documentTracks;

            }
            else
            {
                return null;
            }
        }

        public async Task<List<DocumentTrackInDepartment>> GetDocumentInDepartment(int DId)
        {
            List<DocumentTrackInDepartment> documentTracks = new List<DocumentTrackInDepartment>();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            SqlCommand cmd = new SqlCommand("[dbo].[sp_trackDocumentByDepartment]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DepartmentId", DId);
            DataTable dt = new DataTable();
            await con.OpenAsync();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    documentTracks.Add(new DocumentTrackInDepartment()
                    {
                        DId = Convert.ToInt32(row["DId"]),
                        SId = Convert.ToInt32(row["SId"]),
                        DepartmentId = Convert.ToInt32(row["DepartmentId"]),
                        DocumentTitle = Convert.ToString(row["DocumentTitle"]),
                        IsActive = (bool)row["IsActive"],
                        DepartmentName = (string)row["DepartmentName"],
                        ApprovedBy = (string)row["ApprovedBy"],
                        Status = (string)row["Status"],
                        DocumentPath = (string)row["DocumentPath"],
                        EntryDate = (DateTime)row["EntryDate"]
                    });
                }
                return documentTracks;
            }
            else
            {
                return null;
            }
        }


        public async Task<int> InsertUpdatedStatusIntoDocumentStatus(ReceiveStatusAccordingToDepartment receive)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            SqlCommand cmd = new SqlCommand("[dbo].[sp_updateDocumentStatusInDepartment]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DocumentId", receive.DId);
            cmd.Parameters.AddWithValue("@DepartmentId", receive.DepartmentId);
            cmd.Parameters.AddWithValue("@StatusId", receive.StatusId);
            cmd.Parameters.AddWithValue("@ApprovedBy", receive.ApprovedBy);
            cmd.Parameters.AddWithValue("@Remarks", receive.Remarks);
            await con.OpenAsync();

            int x = await cmd.ExecuteNonQueryAsync();
            con.Close();
            return x;
        }

        public async Task<List<DocumentStatusForEachDepartment>> GetDocumentStatusForEachDepartment()
        {
            List<DocumentStatusForEachDepartment> list = new List<DocumentStatusForEachDepartment>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            SqlCommand cmd = new SqlCommand("[dbo].[sp_statusOfEachDocumentWithEachDepartment]", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            await con.OpenAsync();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    list.Add(new DocumentStatusForEachDepartment()
                    {
                        DocumentId = Convert.ToInt32(row["DocId"]),
                        DepartmentID1 = row.IsNull("Department1") ? null : row.Field<string>("Department1"),
                        DepartmentID2 = row.IsNull("Department2") ? null : row.Field<string>("Department2"),
                        DepartmentID3 = row.IsNull("Department3") ? null : row.Field<string>("Department3"),
                        DepartmentID4 = row.IsNull("Department4") ? null : row.Field<string>("Department4")
                    });
                }
                return list;
            }
            else
            {
                return null;
            }
        }
    }
}