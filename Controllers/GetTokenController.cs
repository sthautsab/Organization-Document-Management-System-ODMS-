using Basic_Authentication.Models;
using ODMS.JWT_Logic;
using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Http;

namespace ODMS.Controllers
{
    public class TokenResponse
    {
        public int UserId;
        public DateTime AccessTokenExpiryDate;
        public string AccessToken;
        public string RefreshToken;
        public DateTime RefreshTokenExpiryDate;
        public bool Success;
    }

    public class RefreshTokenResponse
    {
        public DateTime AccessTokenExpiryDate;
        public string AccessToken;
        public bool success;
    }

    [AllowAnonymous]
    public class GetTokenController : ApiController
    {
        DataAccess dal = new DataAccess();
        GenerateToken generateToken = new GenerateToken();

        [HttpPost]
        [Route("api/loginToGetAccessToken")]
        public HttpResponseMessage Login(User user)                        //credential provided during login
        {
            UserModel validUser = new UserModel();                         //to store all the information of logged in user
            try
            {
                var username = user.Username;
                var password = user.Password;
                validUser = dal.validateUser(username, password);     //returns user data if the user data during login exists
                if (validUser != null && ModelState.IsValid)
                {
                    List<string> token = generateToken.GetToken(validUser);                 //token with it's expiry date is received

                    List<string> refreshToken = generateToken.GetRefreshToken(validUser);

                    TokenResponse tokens = new TokenResponse();
                    tokens.UserId = validUser.Uid;
                    tokens.AccessTokenExpiryDate = DateTime.Parse(token[0]);
                    tokens.AccessToken = token[1];
                    tokens.RefreshToken = refreshToken[1];
                    tokens.RefreshTokenExpiryDate = DateTime.Parse(refreshToken[0]);
                    tokens.Success = true;
                    return Request.CreateResponse(System.Net.HttpStatusCode.OK, new { tokens });
                }
                else
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.Unauthorized, "Invalid Username or Password");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest, ex.Message);
            }
        }

        [HttpGet]
        [Route("api/getRefreshedAccessToken")]
        public HttpResponseMessage RefreshToken(string refreshToken)
        {

            try
            {
                RefreshToken refToken = new RefreshToken();

                refToken = dal.GetRefreshTokens(refreshToken);                                        //query returns only one refresh token
                bool validateRefreshToken()
                {
                    if (refToken.refreshToken == refreshToken && refToken.expiryDate > DateTime.Now)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                if (refToken != null && validateRefreshToken())
                {
                    UserModel user = new UserModel();
                    int UserId = refToken.UserId;
                    user = dal.GetData().Find(x => x.Uid == UserId);                            //gets the user credential info for adding claims for new accessToken
                    List<string> tokenData = generateToken.GetToken(user);
                    //Dictionary<string, string> token = new Dictionary<string, string>();
                    //token.Add("accessTokenExpiryDate", tokenData[0]);
                    //token.Add("accessToken", tokenData[1]);

                    RefreshTokenResponse token = new RefreshTokenResponse();
                    token.AccessTokenExpiryDate = DateTime.Parse(tokenData[0]);
                    token.AccessToken = tokenData[1];
                    token.success = true;

                    return Request.CreateResponse(System.Net.HttpStatusCode.OK, new { token });
                }
                else
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.NotFound, "Refresh Token not Found Or is Expired");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest, ex.Message);
            }
        }

    }
}
