using ODMS.Dal;
using ODMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ODMS.Controllers
{
    [Authorize]
    public class DocumentStatusController : ApiController
    {
        DocumentStatusDal dal = new DocumentStatusDal();
        // GET: DocumentRegistrationApi
        [Route("api/GetListOfDocumentStatus")]
        public async Task<HttpResponseMessage> Get()
        {
            List<DocumentStatus> documentstatusdata = new List<DocumentStatus>();
            try
            {
                documentstatusdata = await dal.GetData();
                if (documentstatusdata != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, new { documentStatus = documentstatusdata });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "No data found in table");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }

        }
        [HttpGet]
        [Route("api/GetDocumentStatusBySId")]
        public async Task<HttpResponseMessage> GetById(int SId)
        {
            List<DocumentStatus> documentstatusdata = new List<DocumentStatus>();
            List<DocumentStatus> singledocumentstatusdata = new List<DocumentStatus>();
            try
            {
                DocumentStatus dr = new DocumentStatus();
                documentstatusdata = await dal.GetData();
                dr = documentstatusdata.FirstOrDefault(x => x.SId == SId);
                if (dr != null)
                {
                    singledocumentstatusdata.Add(dr);
                    return Request.CreateResponse(HttpStatusCode.OK, new { documentStatus = singledocumentstatusdata });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Item with id " + SId + " does not exists");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        [HttpPost]
        [Route("api/InsertDocumentStatus")]

        public async Task<HttpResponseMessage> Create(DocumentStatus receivedDocument)
        {
            try
            {
                int x = await dal.CreateData(receivedDocument);
                if (x != 0)
                {
                    receivedDocument.SId = x;
                    return Request.CreateResponse(HttpStatusCode.OK, receivedDocument);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        [HttpPost]
        [Route("api/insertUpdateDocumentStatus")]
        public async Task<HttpResponseMessage> insertUpdate(DocumentStatus receivedDocument)
        {
            try
            {
                if (receivedDocument.SId != 0)
                {
                    DocumentStatus documentStatus = new DocumentStatus();
                    documentStatus = (await dal.GetData()).Find(y => y.SId == receivedDocument.SId);
                    if (documentStatus == null)
                    {
                        return Request.CreateResponse(HttpStatusCode.NotFound);
                    }
                }
                int x = await dal.insertUpdate(receivedDocument);
                if (x != 0)
                {
                    receivedDocument.SId = x;
                    return Request.CreateResponse(HttpStatusCode.OK, receivedDocument);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        //[HttpPut]
        //[Route("api/EditDocumentStatusBySId")]
        //public async Task<HttpResponseMessage> Update(int SId, DocumentStatus receivedDocument)
        //{
        //    DocumentStatus rf = new DocumentStatus();
        //    rf = (await dal.GetData()).Find(o => o.SId == SId);
        //    try
        //    {
        //        if (rf != null)
        //        {
        //            int x = await dal.Edit(SId, receivedDocument);
        //            receivedDocument.SId = x;
        //            return Request.CreateResponse(HttpStatusCode.OK, receivedDocument);
        //        }
        //        else
        //        {
        //            return Request.CreateResponse(HttpStatusCode.NotFound, "Record not found to edit");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
        //    }
        //}


    }
}
