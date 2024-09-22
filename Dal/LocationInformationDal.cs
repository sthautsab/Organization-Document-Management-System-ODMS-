using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace ODMS.Dal
{
    public class LocationInformationDal
    {
        public async Task<List<State>> GetStateInformation()
        {
            List<State> states = new List<State>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            using (con)
            {
                SqlCommand cmd = new SqlCommand("sp_getStateData", con);
                cmd.CommandType = CommandType.StoredProcedure;

                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        states.Add(new State()
                        {
                            Id = Convert.ToInt32(row["Id"]),
                            StateName = (string)row["StateName"],
                            StateId = Convert.ToInt32(row["StateId"])

                        });
                    }
                    return states;
                }
                else
                {
                    return null;
                }

            }

        }

        public async Task<List<DistrictData>> GetDistrictDataByStateId(int StateId)
        {
            List<DistrictData> districts = new List<DistrictData>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            using (con)
            {
                SqlCommand cmd = new SqlCommand("sp_getDistrictByStateId", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@StateId", StateId);

                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        districts.Add(new DistrictData()
                        {
                            DId = Convert.ToInt32(row["DId"]),
                            District = (string)row["District"]

                        });
                    }
                    return districts;
                }
                else
                {
                    return null;
                }

            }
        }

        public async Task<List<VdcMun>> GetVdcMunDataByDistrictId(int DistrictId)
        {
            List<VdcMun> vdcMuns = new List<VdcMun>();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
            using (con)
            {
                SqlCommand cmd = new SqlCommand("sp_getVdcByDistrictId", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DistrictId", DistrictId);

                DataTable dt = new DataTable();
                await con.OpenAsync();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        vdcMuns.Add(new VdcMun()
                        {
                            VdcID = Convert.ToInt32(row["VdcID"]),
                            Name = (string)row["Name"]

                        });
                    }
                    return vdcMuns;
                }
                else
                {
                    return null;
                }

            }
        }
    }
}