using ODMS.Dal;
using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ODMS.Controllers
{
    //[Authorize]
    public class SearchDocumentsController : ApiController
    {
        DocumentSearchDal dal = new DocumentSearchDal();
        [HttpGet]
        [Route("api/getSearchedDocuments")]
        public async Task<HttpResponseMessage> GetSearchedDocuments(string DocumentTitle, string Organization, int? StateId, string DepartmentName)
        {
            List<DocumentSearch> searchedDocument = new List<DocumentSearch>();
            try
            {
                searchedDocument = await dal.GetSearchedDocuements(DocumentTitle, Organization, (int?)StateId, DepartmentName);
                if (searchedDocument != null)
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.OK, new { searchedDocument });
                }
                else
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.NoContent);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest, ex.Message);
            }
        }

        [HttpGet]
        [Route("api/mainViewWithDocumentSearch")]
        public async Task<HttpResponseMessage> GetMainViewWithDocumentSearch(int? DartaNo, string DocumentTitle, string Organization, string StateName, string District, string VDCName, string Status)
        {
            List<MainView> searchedDocument = new List<MainView>();
            try
            {
                searchedDocument = await dal.GetMainViewWithDocumentSearch((int?)DartaNo, DocumentTitle, Organization, StateName, District, VDCName, Status);
                if (searchedDocument != null)
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.OK, new { searchedDocument });
                }
                else
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.NoContent);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest, ex.Message);
            }
        }

    }
}
