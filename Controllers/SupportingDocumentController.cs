using ODMS.Dal;
using ODMS.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace ODMS.Controllers
{
    // [EnableCors(origins: "*", headers: "*", methods: "*")]
    //[Authorize]
    public class SupportingDocumentController : ApiController
    {
        SupportingDocumentsDal dal = new SupportingDocumentsDal();
        [Route("api/GetListOfSupportingDocument")]

        // GET: DocumentRegistrationApi
        public async Task<HttpResponseMessage> Get()
        {
            List<SupportingDocuments> supportingDocumentsdata = new List<SupportingDocuments>();
            try
            {
                supportingDocumentsdata = await dal.GetData();
                if (supportingDocumentsdata != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, new { supportingDocuments = supportingDocumentsdata });
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
        [Route("api/GetSupportingDocumentBySDId")]
        public async Task<HttpResponseMessage> GetById(int SDId)
        {
            List<SupportingDocuments> supportingDocumentsdata = new List<SupportingDocuments>();
            List<SupportingDocuments> singlesupportingDocumentsdata = new List<SupportingDocuments>();


            try
            {
                SupportingDocuments dr = new SupportingDocuments();
                supportingDocumentsdata = await dal.GetData();
                dr = supportingDocumentsdata.FirstOrDefault(x => x.SDId == SDId);
                if (dr != null)
                {
                    singlesupportingDocumentsdata.Add(dr);
                    return Request.CreateResponse(HttpStatusCode.OK, new { SupportingDocument = singlesupportingDocumentsdata });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Item with id " + SDId + " does not exists");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        [HttpPost]
        [Route("api/InsertSupportingDocument")]
        public async Task<HttpResponseMessage> Create()
        {
            try
            {
                //receiving form fields data of current http request
                //get the corresponding dartano of the DocId
                //int docid = receivedDocument.DocId;
                int count = HttpContext.Current.Request.Files.Count;
                //var file1 = HttpContext.Current.Request.Files[0];
                //var file2 = HttpContext.Current.Request.Files[1];
                if (HttpContext.Current.Request.Files.Count > 0)
                {
                    List<SupportingDocuments> supportingDocumentsList = new List<SupportingDocuments>();
                    for (int i = 0; i < HttpContext.Current.Request.Files.Count; i++)
                    {
                        SupportingDocuments receivedDocument = new SupportingDocuments();
                        receivedDocument.DocId = Convert.ToInt32(HttpContext.Current.Request.Form["DocId"]);
                        receivedDocument.DocumentTitle = HttpContext.Current.Request.Form["DocumentTitle"];
                        receivedDocument.DocumentPath = HttpContext.Current.Request.Form["DocumentPath"];
                        receivedDocument.UserId = Convert.ToInt32(HttpContext.Current.Request.Form["UserId"]);
                        receivedDocument.UploadedDate = DateTime.Parse(HttpContext.Current.Request.Form["UploadedDate"]);
                        receivedDocument.IsActive = bool.Parse(HttpContext.Current.Request.Form["IsActive"]);
                        int dartano = await dal.GetDartanoByDocId(receivedDocument.DocId);

                        var file = HttpContext.Current.Request.Files[i];
                        if (file != null && file.ContentLength > 0)
                        {
                            string fileName = Path.GetFileName(file.FileName);
                            string desiredFileName = $"Supporting{i + 1}";
                            string fileExtension = Path.GetExtension(fileName);
                            string directoryPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Documents", dartano.ToString());
                            Directory.CreateDirectory(directoryPath);
                            string filePath = Path.Combine(directoryPath, desiredFileName + fileExtension);
                            file.SaveAs(filePath);
                            string fileUrl = "/Documents/" + dartano.ToString() + "/" + desiredFileName + fileExtension;
                            receivedDocument.DocumentPath = fileUrl;
                            int x = await dal.CreateData(receivedDocument);
                            //if (x != 0){}                         
                            receivedDocument.SDId = x;
                            supportingDocumentsList.Add(receivedDocument);
                        }
                    }
                    return Request.CreateResponse(HttpStatusCode.OK, supportingDocumentsList);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "no file to upload");
                }

                //return Request.CreateResponse(HttpStatusCode.InternalServerError, "An error occurred while processing the request.");

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        [HttpPost]
        [Route("api/insertUpdateSupportingDocument")]
        public async Task<HttpResponseMessage> InsertUpdate()
        {
            if (HttpContext.Current.Request.Files.Count > 0)
            {
                List<SupportingDocuments> supportingDocumentsList = new List<SupportingDocuments>();
                for (int i = 0; i < HttpContext.Current.Request.Files.Count; i++)
                {
                    SupportingDocuments receivedDocument = new SupportingDocuments();
                    receivedDocument.SDId = Convert.ToInt32(HttpContext.Current.Request.Form["SDId"]);
                    receivedDocument.DocId = Convert.ToInt32(HttpContext.Current.Request.Form["DocId"]);
                    receivedDocument.DocumentTitle = HttpContext.Current.Request.Form["DocumentTitle"];
                    receivedDocument.DocumentPath = HttpContext.Current.Request.Form["DocumentPath"];
                    receivedDocument.UserId = Convert.ToInt32(HttpContext.Current.Request.Form["UserId"]);
                    receivedDocument.UploadedDate = DateTime.Parse(HttpContext.Current.Request.Form["UploadedDate"]);
                    receivedDocument.IsActive = bool.Parse(HttpContext.Current.Request.Form["IsActive"]);
                    int dartano = await dal.GetDartanoByDocId(receivedDocument.DocId);

                    string supportingDocumentFileName = "";

                    //incase of edit check for if the record exists in the table

                    if (receivedDocument.SDId != 0)
                    {
                        SupportingDocuments supportingDocumentsForCheck = new SupportingDocuments();
                        supportingDocumentsForCheck = (await dal.GetData()).Find(y => y.SDId == receivedDocument.SDId);
                        if (supportingDocumentsForCheck != null)
                        {
                            receivedDocument.DocId = supportingDocumentsForCheck.DocId;
                            dartano = await dal.GetDartanoByDocId(receivedDocument.DocId);
                            supportingDocumentFileName = Path.GetFileNameWithoutExtension(supportingDocumentsForCheck.DocumentPath);
                        }
                        else
                        {
                            return Request.CreateResponse(HttpStatusCode.NotFound);
                        }
                    }


                    var file = HttpContext.Current.Request.Files[i];
                    if (file != null && file.ContentLength > 0)
                    {
                        string fileName = Path.GetFileName(file.FileName);
                        string desiredFileName;
                        if (receivedDocument.SDId == 0)
                        {
                            desiredFileName = $"Supporting{i + 1}";
                        }
                        else
                        {
                            desiredFileName = supportingDocumentFileName;
                        }

                        string fileExtension = Path.GetExtension(fileName);
                        string directoryPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Documents", dartano.ToString());
                        Directory.CreateDirectory(directoryPath);
                        string filePath = Path.Combine(directoryPath, desiredFileName + fileExtension);
                        //await file.SaveAs(filePath);
                        await Task.Run(() => file.SaveAs(filePath));
                        string fileUrl = "/Documents/" + dartano.ToString() + "/" + desiredFileName + fileExtension;  //Request.RequestUri.Scheme + "://" + Request.RequestUri.Authority + "/odms" + 
                        receivedDocument.DocumentPath = fileUrl;

                        //here x receives the primary key value of the edited row
                        int x = await dal.InsertUpdate(receivedDocument);
                        //if (x != 0){}                         
                        receivedDocument.SDId = x;
                        supportingDocumentsList.Add(receivedDocument);
                    }
                }
                return Request.CreateResponse(HttpStatusCode.OK, new { supportingDocuments = supportingDocumentsList });
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "no file to upload");
            }
        }

        //[HttpPut]
        //[Route("api/EditSupportingDocumentsBySDId")]
        //public async Task<HttpResponseMessage> Update(int SDId)
        //{
        //    SupportingDocuments rf = new SupportingDocuments();
        //    rf = (await dal.GetData()).Find(o => o.SDId == SDId);
        //    try
        //    {
        //        if (rf != null)
        //        {
        //            string supportingDocumentFileName = Path.GetFileNameWithoutExtension(rf.DocumentPath);
        //            SupportingDocuments receivedDocument = new SupportingDocuments();
        //            //receivedDocument.DocId = Convert.ToInt32(HttpContext.Current.Request.Form["DocId"]);
        //            receivedDocument.DocId = rf.DocId;
        //            receivedDocument.DocumentTitle = HttpContext.Current.Request.Form["DocumentTitle"];
        //            receivedDocument.DocumentPath = HttpContext.Current.Request.Form["DocumentPath"];
        //            receivedDocument.UserId = Convert.ToInt32(HttpContext.Current.Request.Form["UserId"]);
        //            receivedDocument.UploadedDate = DateTime.Parse(HttpContext.Current.Request.Form["UploadedDate"]);
        //            receivedDocument.IsActive = bool.Parse(HttpContext.Current.Request.Form["IsActive"]);

        //            int dartano = await dal.GetDartanoByDocId(receivedDocument.DocId);
        //            // List<SupportingDocuments> supportingDocumentsList = new List<SupportingDocuments>();
        //            var file = HttpContext.Current.Request.Files.Count > 0 ? HttpContext.Current.Request.Files[0] : null;
        //            if (file != null)
        //            {
        //                string fileName = Path.GetFileName(file.FileName);
        //                string desiredFileName = supportingDocumentFileName;
        //                string fileExtension = Path.GetExtension(fileName);
        //                string directoryPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Documents", dartano.ToString());
        //                if (!File.Exists(directoryPath))
        //                {
        //                    Directory.CreateDirectory(directoryPath);
        //                }
        //                string filePath = Path.Combine(directoryPath, desiredFileName + fileExtension);
        //                file.SaveAs(filePath);
        //                string fileUrl = Request.RequestUri.Scheme + "://" + Request.RequestUri.Authority + "/Documents/" + "/" + dartano.ToString() + "/" + desiredFileName + fileExtension;
        //                receivedDocument.DocumentPath = fileUrl;
        //            }
        //            int x = await dal.Edit(SDId, receivedDocument);
        //            receivedDocument.SDId = x;
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

        [HttpPost]
        [Route("api/DeleteSupportingDocumentBySDId")]
        public async Task<HttpResponseMessage> DeleteSupportingDocument(int SDId)
        {
            try
            {
                SupportingDocuments rf = new SupportingDocuments();
                rf = (await dal.GetData()).Find(o => o.SDId == SDId);
                if (rf != null)
                {
                    dal.DeleteData(SDId);
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


