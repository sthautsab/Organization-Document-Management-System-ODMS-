using ODMS.Dal;
using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ODMS.Controllers
{
    //[Authorize]
    public class TrackDocumentController : ApiController
    {
        DocumentTrackDal trackDal = new DocumentTrackDal();
        [HttpGet]
        [Route("api/trackOfDocument")]
        public HttpResponseMessage Track()
        {
            DocumentTrackDal dtdal = new DocumentTrackDal();
            List<DocumentTrack> documentTracks = new List<DocumentTrack>();
            try
            {
                documentTracks = dtdal.GetDocument();
                if (documentTracks != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, new { documents = documentTracks });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NoContent, "No Content Found");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }


        [HttpGet]
        [Route("api/getDocumentStatusByDepartmentId")]
        public async Task<HttpResponseMessage> GetDocumentByDepartment(int DepartmentId)
        {
            List<DocumentTrackInDepartment> trackDocuments = new List<DocumentTrackInDepartment>();
            try
            {

                trackDocuments = await trackDal.GetDocumentInDepartment(DepartmentId);
                if (trackDocuments != null)
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.OK, new { documents = trackDocuments });
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



        [HttpPost]
        [Route("api/updateDcumentStatusForDepartment")]
        public async Task<HttpResponseMessage> InsertUpdatedStatusByDepartment(ReceiveStatusAccordingToDepartment received)
        {

            try
            {
                int x = await trackDal.InsertUpdatedStatusIntoDocumentStatus(received);
                if (x > 0)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, received);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.OK, ex.Message);
            }
        }
        //[Authorize]
        [HttpGet]
        [Route("api/getDocumentStatusForAllDeparments")]
        public async Task<HttpResponseMessage> GetDocumentStatusForEachDepartment()
        {
            try
            {
                List<DocumentStatusForEachDepartment> list = new List<DocumentStatusForEachDepartment>();
                list = await trackDal.GetDocumentStatusForEachDepartment();
                if (list != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, new { statusData = list });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NoContent);
                }

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.OK, ex.Message);
            }
        }

        [HttpGet]
        [Route("api/getDocumentStatusForAllDeparmentsByDocumentId")]
        public async Task<HttpResponseMessage> GetDocumentStatusForEachDepartmentByDocumentId(int documentId)
        {
            try
            {
                List<DocumentStatusForEachDepartment> list = new List<DocumentStatusForEachDepartment>();
                DocumentStatusForEachDepartment documentStatus = new DocumentStatusForEachDepartment();
                list = await trackDal.GetDocumentStatusForEachDepartment();
                if (list != null)
                {
                    documentStatus = list.Find(x => x.DocumentId == documentId);
                    return Request.CreateResponse(HttpStatusCode.OK, new { documentStatus });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NoContent);
                }

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.OK, ex.Message);
            }
        }



    }
}
