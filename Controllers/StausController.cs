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
    public class StausController : ApiController
    {
        StatusDal dal = new StatusDal();
        // GET: DocumentRegistrationApi
        [Route("api/GetListOfStatus")]

        public async Task<HttpResponseMessage> Get()
        {
            List<tbl_Status> statusdata = new List<tbl_Status>();
            try
            {
                statusdata = await dal.GetData();
                if (statusdata != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, new { documentStatus = statusdata });
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
        [Route("api/GetStatusBySId")]
        public async Task<HttpResponseMessage> GetById(int SId)
        {
            List<tbl_Status> statusdata = new List<tbl_Status>();
            List<tbl_Status> singlestatusdata = new List<tbl_Status>();

            try
            {
                tbl_Status dr = new tbl_Status();
                statusdata = await dal.GetData();
                dr = statusdata.FirstOrDefault(x => x.SId == SId);
                if (dr != null)
                {
                    singlestatusdata.Add(dr);
                    return Request.CreateResponse(HttpStatusCode.OK, new { documentStatus = singlestatusdata });
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
        [Route("api/InsertStatus")]

        public async Task<HttpResponseMessage> Create(tbl_Status receivedDocument)
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
        [Route("api/insertUpdateStatus")]
        public async Task<HttpResponseMessage> insertUpdate(tbl_Status receivedDocument)
        {
            try
            {
                if (receivedDocument.SId != 0)
                {
                    tbl_Status status = new tbl_Status();
                    status = (await dal.GetData()).Find(y => y.SId == receivedDocument.SId);
                    if (status == null)
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

        [HttpPut]
        [Route("api/EditStatusBySId")]
        public async Task<HttpResponseMessage> Update(int SId, tbl_Status receivedDocument)
        {
            tbl_Status rf = new tbl_Status();
            rf = (await dal.GetData()).Find(o => o.SId == SId);
            try
            {
                if (rf != null)
                {
                    int x = await dal.Edit(SId, receivedDocument);
                    receivedDocument.SId = x;
                    return Request.CreateResponse(HttpStatusCode.OK, receivedDocument);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Record not found to edit");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        [HttpDelete]
        [Route("api/DeleteStatusBySId")]
        public async Task<HttpResponseMessage> Delete(int SId)
        {
            try
            {
                tbl_Status rf = new tbl_Status();
                rf = (await dal.GetData()).Find(o => o.SId == SId);
                if (rf != null)
                {
                    dal.DeleteData(SId);
                    return Request.CreateResponse(HttpStatusCode.OK);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}
