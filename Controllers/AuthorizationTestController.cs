using System;
using System.Net.Http;
using System.Web.Http;
using System.Web.Security;

namespace ODMS.Controllers
{
    public class AuthorizationTestController : ApiController
    {
        [Authorize]
        [HttpGet]
        [Route("api/getDataOnlyAfterProvidingToken")]
        public HttpResponseMessage Get()
        {
            string[] value = { "hello", "hyy", "hello again" };
            return Request.CreateResponse(System.Net.HttpStatusCode.OK, value);
        }
        [HttpGet]
        [Route("api/insertintomembership")]

        public HttpResponseMessage InsertIntoMembership()
        {
            //try
            //{
            //    Membership.ApplicationName = "Casefinder";
            //    MembershipCreateStatus status;
            //    Membership.CreateUser("utsab@gmail.com", "Utsab@123");
            //    return Request.CreateResponse(System.Net.HttpStatusCode.OK);
            //}
            //catch (Exception ex)
            //{
            //    // Log or inspect the exception to understand the specific failure.
            //    // You can also return an error response with details.
            //    return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest, ex.Message);

            //}
            try
            {
                string username = "kal";
                string password = "Kal@123";
                string email = "kal@gmail.com";
                string passwordQuestion = "Your Name"; // Provide a valid password recovery question.
                string passwordAnswer = "kal";     // Provide a valid answer to the question.

                //Membership.ApplicationName = "Casefinder";
                MembershipCreateStatus status;

                Membership.CreateUser(username, password, email, passwordQuestion, passwordAnswer, true, null, out status);

                if (status == MembershipCreateStatus.Success)
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.OK);
                }
                else
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest, ex.Message);
            }
        }



        [HttpGet]
        [Route("api/login")]

        public HttpResponseMessage LoginMembership()
        {
            //try
            //{
            //    Membership.ApplicationName = "Casefinder";
            //    MembershipCreateStatus status;
            //    Membership.CreateUser("utsab@gmail.com", "Utsab@123");
            //    return Request.CreateResponse(System.Net.HttpStatusCode.OK);
            //}
            //catch (Exception ex)
            //{
            //    // Log or inspect the exception to understand the specific failure.
            //    // You can also return an error response with details.
            //    return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest, ex.Message);

            //}
            try
            {

                if (Membership.ValidateUser("utsab", "Utsab@123"))
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.OK);
                }
                else
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}
