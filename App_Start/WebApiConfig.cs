using Microsoft.Owin.Security.OAuth;
using System.Web.Http;

namespace ODMS
{
    public static class WebApiConfig
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="config"></param>
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services
            //config.Filters.Add(new BasicAuthenticationAttribute());

            //configure Cors
            //var cors = new EnableCorsAttribute("*", "*", "*");
            //cors.SupportsCredentials = true;
            //config.EnableCors(cors);


            config.SuppressDefaultHostAuthentication();
            config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType));

            //to support file type
            config.Formatters.XmlFormatter.SupportedMediaTypes.Add(new System.Net.Http.Headers.MediaTypeHeaderValue("multipart/form-data"));




            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
           name: "DocumentRegistrationByIdApi",
           routeTemplate: "api/DocumentRegistrationById",
           defaults: new { controller = "DocumentRegistrationApi", action = "GetById" }
       );


            //     config.Routes.MapHttpRoute(
            //    name: "EditDocumentRegistrationById",
            //    routeTemplate: "EditDocumentRegistrationById",
            //    defaults: new { controller = "DocumentRegistrationApi", action = "Update" }
            //);

        }
    }
}
