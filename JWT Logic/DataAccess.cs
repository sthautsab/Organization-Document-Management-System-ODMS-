using Basic_Authentication.Models;
using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace ODMS.JWT_Logic
{
    public class DataAccess
    {

        public List<UserModel> GetData()
        {
            List<UserModel> data = new List<UserModel>();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectBasic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_getUserData]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        data.Add(new UserModel()
                        {
                            Uid = (int)dr["Uid"],
                            Username = (string)dr["Username"],
                            Password = (string)dr["Password"],
                            Role = (string)dr["Role"]
                        });
                    }
                    Debug.WriteLine("hellooo");
                    return data;
                }
                else
                {
                    return null;
                }
            }
        }


        public UserModel validateUser(string username, string password)
        {
            //BasicAccess info = new BasicAccess();
            Cryptography cryptography = new Cryptography();
            UserModel user = new UserModel();
            user = GetData().Find(x => x.Username.ToLower() == username.ToLower() && x.Password == cryptography.Encrypt(password));
            return user;
        }

        //List<RefreshToken> tokens = new List<RefreshToken>();
        public RefreshToken GetRefreshTokens(string refreshToken)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectBasic"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[sp_getRefreshToken]", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("refreshToken", refreshToken);

                DataTable dt = new DataTable();
                con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    return new RefreshToken()
                    {
                        refreshToken = (string)dr["refreshToken"],
                        expiryDate = (DateTime)dr["expiryDate"],
                        entryDate = (DateTime)dr["entryDate"],
                        UserId = (int)dr["UserId"]
                    };
                }
                else
                {
                    return null;
                }
            }
        }

        public int SetRefreshToken(string refreshToken, DateTime expiryDate, int Uid)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectBasic"].ConnectionString);
            SqlCommand cmd = new SqlCommand("[dbo].[sp_insertRefreshToken]", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("refreshToken", refreshToken);
            cmd.Parameters.AddWithValue("expiryDate", expiryDate);
            cmd.Parameters.AddWithValue("UserId", Uid);
            con.Open();

            int x = cmd.ExecuteNonQuery();

            con.Close();
            return x;

        }
    }
}