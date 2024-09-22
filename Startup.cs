using Microsoft.IdentityModel.Tokens;
using Microsoft.Owin;
using Microsoft.Owin.Cors;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Jwt;
using Owin;
using System.Configuration;
using System.Text;


[assembly: OwinStartup(typeof(ODMS.Startup))]

namespace ODMS
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCors(CorsOptions.AllowAll);
            app.UseJwtBearerAuthentication(
               new JwtBearerAuthenticationOptions
               {
                   AuthenticationMode = AuthenticationMode.Active,
                   TokenValidationParameters = new TokenValidationParameters()
                   {
                       ValidateIssuer = true,
                       ValidateAudience = false,
                       ValidateIssuerSigningKey = true,
                       ValidIssuer = ConfigurationManager.AppSettings["JwtIssuer"], //some string, normally web url,  
                       ValidAudience = ConfigurationManager.AppSettings["JwtIssuer"],
                       //IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("fkhsakdfh"))
                       IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(ConfigurationManager.AppSettings["JwtKey"]))
                   }
               });
        }
    }
}
