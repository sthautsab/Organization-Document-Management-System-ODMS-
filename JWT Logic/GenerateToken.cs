using Basic_Authentication.Models;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;

namespace ODMS.JWT_Logic
{
    public class GenerateToken
    {
        DataAccess dal = new DataAccess();

        public List<string> GetToken(UserModel validUser)
        {

            var key = ConfigurationManager.AppSettings["JwtKey"];
            var issuer = ConfigurationManager.AppSettings["JwtIssuer"];
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            DateTime expiryDate = DateTime.Now.AddMinutes(2);                                         //done just to know the expiry date and pass it 

            string rolesString = validUser.Role;
            string[] roles = rolesString.Split(',')
                        .Select(r => r.Trim())
                        .Where(r => !string.IsNullOrWhiteSpace(r))
                        .ToArray();

            //Create a List of Claims, Keep claims name short    
            var permClaims = new List<Claim>();
            //custom claims
            permClaims.Add(new Claim("username", validUser.Username));
            //permClaims.Add(new Claim("password", validUser.Password));
            permClaims.Add(new Claim("expiryDate", expiryDate.ToString()));
            permClaims.Add(new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()));

            foreach (var role in roles)                                       //a user can have multiple roles
            {
                permClaims.Add(new Claim("role", role));
            }


            //Create Security Token object by giving required parameters    
            var token = new JwtSecurityToken(issuer, //Issure    
                            issuer,  //Audience    
                            permClaims,
                            expires: expiryDate,
                            signingCredentials: credentials);
            string jwt_token = new JwtSecurityTokenHandler().WriteToken(token);
            //DateTime expirationDate = (DateTime)token.ValidTo;
            //DateTime expirationDate = token.ValidTo ?? token.ValidFrom.AddMinutes(2);
            DateTime expirationDate;
            if (token.ValidTo != null)
            {
                expirationDate = token.ValidTo.ToLocalTime();
            }
            else
            {
                expirationDate = token.ValidFrom.AddMinutes(2);
            }
            List<string> data = new List<string>();                                //list made to return both token as well as the expiry date

            data.Insert(0, expiryDate.ToString());                           //for getting token expirydate and passing to the client side with token
            data.Insert(1, jwt_token);
            data.Insert(2, validUser.Username);                              //for passing username
            return data;

            //var response = new
            //{
            //    token,
            //    claims
            //};
        }

        public List<string> GetRefreshToken(UserModel validUser)
        {
            var key = ConfigurationManager.AppSettings["JwtKey"];
            var issuer = ConfigurationManager.AppSettings["JwtIssuer"];
            DateTime expiryDate = DateTime.Now.AddMinutes(30);

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            //Create a List of Claims, Keep claims name short    
            var permClaims = new List<Claim>();
            //custom claims
            permClaims.Add(new Claim("username", validUser.Username));
            permClaims.Add(new Claim("role", validUser.Role));

            permClaims.Add(new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()));

            //Create Security Token object by giving required parameters    
            var token = new JwtSecurityToken(issuer, //Issure    
                            issuer,  //Audience    
                            permClaims,
                            expires: expiryDate,
                            signingCredentials: credentials);
            string jwt_token = new JwtSecurityTokenHandler().WriteToken(token);
            DateTime expirationDate = (DateTime)token.ValidTo.ToLocalTime();
            dal.SetRefreshToken(jwt_token, expiryDate, validUser.Uid);       //refresh token gets saved to for getting 


            List<string> refreshToken = new List<string>();
            refreshToken.Insert(0, expirationDate.ToString());
            refreshToken.Insert(1, jwt_token);
            return refreshToken;
        }
    }
}