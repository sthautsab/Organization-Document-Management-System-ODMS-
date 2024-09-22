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
    //[BasicAuthentication]

    public class DocumentRegistrationController : ApiController
    {
        DocumentRegistrationDal dal = new DocumentRegistrationDal();
        [Route("api/GetListOfDocumentRegistration")]
        [HttpGet]
        public async Task<HttpResponseMessage> Get()
        {
            List<DocumentRegistration> documentRegistrations = new List<DocumentRegistration>();
            try
            {
                documentRegistrations = await dal.GetData();
                if (documentRegistrations != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, new { DocumentRegistration = documentRegistrations });
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

        [Route("api/GetDocumentRegistrationByDId")]
        public async Task<HttpResponseMessage> GetById(int DId)
        {
            List<DocumentRegistration> documentRegistrations = new List<DocumentRegistration>();
            List<DocumentRegistration> singledocumentRegistration = new List<DocumentRegistration>();

            try
            {
                DocumentRegistration dr = new DocumentRegistration();
                documentRegistrations = await dal.GetData();
                dr = documentRegistrations.FirstOrDefault(x => x.DId == DId);
                if (dr != null)
                {
                    singledocumentRegistration.Add(dr);
                    return Request.CreateResponse(HttpStatusCode.OK, new { documentRegistration = singledocumentRegistration });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Item with id " + DId + " does not exists");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }


        [HttpPost]
        [Route("api/InsertDocumentRegistration")]

        public async Task<HttpResponseMessage> Create()
        {
            try
            {
                DocumentRegistration receivedDocument = new DocumentRegistration();

                int? dartaNo = null;
                if (!string.IsNullOrEmpty(HttpContext.Current.Request.Form["DartaNo"]))
                {
                    dartaNo = Convert.ToInt32(HttpContext.Current.Request.Form["DartaNo"]);
                }

                receivedDocument.DartaNo = dartaNo;

                receivedDocument.DocumentTitle = HttpContext.Current.Request.Form["DocumentTitle"];
                receivedDocument.Organization = HttpContext.Current.Request.Form["Organization"];
                receivedDocument.StateId = Convert.ToInt32(HttpContext.Current.Request.Form["StateId"]);
                receivedDocument.DistrictId = Convert.ToInt32(HttpContext.Current.Request.Form["DistrictId"]);
                receivedDocument.VDCMUNId = Convert.ToInt32(HttpContext.Current.Request.Form["VDCMUNId"]);
                receivedDocument.WardNo = Convert.ToInt32(HttpContext.Current.Request.Form["WardNo"]);
                receivedDocument.Tole = HttpContext.Current.Request.Form["Tole"];
                receivedDocument.Email = HttpContext.Current.Request.Form["Email"];
                receivedDocument.Phone = HttpContext.Current.Request.Form["Phone"];
                receivedDocument.MobileNo = HttpContext.Current.Request.Form["MobileNo"];
                receivedDocument.EntryDate = DateTime.Parse(HttpContext.Current.Request.Form["EntryDate"]);
                receivedDocument.UserId = Convert.ToInt32(HttpContext.Current.Request.Form["UserId"]);
                receivedDocument.DocumentPath = HttpContext.Current.Request.Form["DocumentPath"];
                receivedDocument.IsActive = bool.Parse(HttpContext.Current.Request.Form["IsActive"]);
                receivedDocument.Remarks = HttpContext.Current.Request.Form["Remarks"];

                //Random random = new Random();
                //int rand = random.Next(100, 1000);
                if ((int?)receivedDocument.DartaNo == null)
                {
                    Guid uniqueId = Guid.NewGuid();
                    int rand = Math.Abs(uniqueId.GetHashCode());  //returns integer value

                    DocumentRegistration documentToCheckUniquDartaNo = new DocumentRegistration();
                    documentToCheckUniquDartaNo = (await dal.GetData()).Find(y => y.DartaNo == rand);
                    while (documentToCheckUniquDartaNo != null)
                    {
                        uniqueId = Guid.NewGuid();
                        //to avoid negative number generation absolute method is used
                        rand = Math.Abs(uniqueId.GetHashCode());
                        documentToCheckUniquDartaNo = (await dal.GetData()).Find(y => y.DartaNo == rand);
                    }
                    receivedDocument.DartaNo = rand;
                }

                var file = HttpContext.Current.Request.Files.Count > 0 ? HttpContext.Current.Request.Files[0] : null;
                if (file != null && file.ContentLength > 0)
                {

                    string fileName = Path.GetFileName(file.FileName);
                    //for changing file name 
                    string desiredFileName = "Main";
                    //get file extension
                    string fileExtension = Path.GetExtension(fileName);
                    string directoryPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Documents", receivedDocument.DartaNo.ToString());
                    //creates directory if not exists
                    if (!System.IO.Directory.Exists(directoryPath))
                    {
                        Directory.CreateDirectory(directoryPath);
                    }
                    //string filePath = Path.Combine(directoryPath, desiredFileName + fileExtension);
                    string filePath = Path.Combine(directoryPath, desiredFileName + fileExtension);
                    //save file in the filePath
                    await Task.Run(() => file.SaveAs(filePath));
                    //provides hosted url  https://.ip/directory/filename
                    string fileUrl = "/documents/" + receivedDocument.DartaNo.ToString() + "/" + desiredFileName + fileExtension;
                    receivedDocument.DocumentPath = fileUrl;
                }

                var x = await dal.CreateData(receivedDocument);
                if (x != 0)
                {
                    receivedDocument.DId = x;
                    //get number of department in departmentTable
                    DepartmentDal depDal = new DepartmentDal();
                    int numberOfDepartment = await depDal.GetNumberOfDepartment();
                    //to insert in the database
                    DocumentStatusDal statusDal = new DocumentStatusDal();

                    //to make status of a document in pending state for every department
                    for (int i = 1; i <= numberOfDepartment; i++)
                    {
                        DocumentStatus documentStatus = new DocumentStatus();

                        documentStatus.SId = 0; //for insert purpose (stored procedure condition)
                        documentStatus.DocumentId = receivedDocument.DId;
                        documentStatus.StatusId = 1;
                        documentStatus.DepartmentId = i;
                        documentStatus.EntryDate = receivedDocument.EntryDate;
                        documentStatus.ApprovedBy = "Collector";
                        documentStatus.UserId = receivedDocument.UserId;
                        await statusDal.insertUpdate(documentStatus);
                    }
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
        [Route("api/insertupdate")]
        public async Task<HttpResponseMessage> InsertUpdate()
        {
            try
            {
                DocumentRegistration receivedDocument = new DocumentRegistration();
                receivedDocument.DId = Convert.ToInt32(HttpContext.Current.Request.Form["DId"]);

                int? dartaNo = null;
                if (!string.IsNullOrEmpty(HttpContext.Current.Request.Form["DartaNo"]))
                {
                    dartaNo = Convert.ToInt32(HttpContext.Current.Request.Form["DartaNo"]);
                }

                receivedDocument.DartaNo = dartaNo;

                receivedDocument.DocumentTitle = HttpContext.Current.Request.Form["DocumentTitle"];
                receivedDocument.Organization = HttpContext.Current.Request.Form["Organization"];
                receivedDocument.StateId = Convert.ToInt32(HttpContext.Current.Request.Form["StateId"]);
                receivedDocument.DistrictId = Convert.ToInt32(HttpContext.Current.Request.Form["DistrictId"]);
                receivedDocument.VDCMUNId = Convert.ToInt32(HttpContext.Current.Request.Form["VDCMUNId"]);
                receivedDocument.WardNo = Convert.ToInt32(HttpContext.Current.Request.Form["WardNo"]);
                receivedDocument.Tole = HttpContext.Current.Request.Form["Tole"];
                receivedDocument.Email = HttpContext.Current.Request.Form["Email"];
                receivedDocument.Phone = HttpContext.Current.Request.Form["Phone"];
                receivedDocument.MobileNo = HttpContext.Current.Request.Form["MobileNo"];
                receivedDocument.EntryDate = DateTime.Parse(HttpContext.Current.Request.Form["EntryDate"]);
                receivedDocument.UserId = Convert.ToInt32(HttpContext.Current.Request.Form["UserId"]);
                receivedDocument.DocumentPath = HttpContext.Current.Request.Form["DocumentPath"];
                receivedDocument.IsActive = bool.Parse(HttpContext.Current.Request.Form["IsActive"]);
                receivedDocument.Remarks = HttpContext.Current.Request.Form["Remarks"];

                if (receivedDocument.DId == 0)
                {
                    if ((int?)receivedDocument.DartaNo == null)
                    {
                        Guid uniqueId = Guid.NewGuid();
                        int rand = Math.Abs(uniqueId.GetHashCode());  //returns integer value

                        DocumentRegistration documentToCheckUniquDartaNo = new DocumentRegistration();
                        documentToCheckUniquDartaNo = (await dal.GetData()).Find(y => y.DartaNo == rand);
                        while (documentToCheckUniquDartaNo != null)
                        {
                            uniqueId = Guid.NewGuid();
                            rand = Math.Abs(uniqueId.GetHashCode());
                            documentToCheckUniquDartaNo = (await dal.GetData()).Find(y => y.DartaNo == rand);

                        }
                        receivedDocument.DartaNo = rand;
                    }

                }

                if (receivedDocument.DId != 0)
                {
                    DocumentRegistration documentToCheckExistence = new DocumentRegistration();
                    documentToCheckExistence = (await dal.GetData()).Find(y => y.DId == receivedDocument.DId);
                    if (documentToCheckExistence == null)
                    {
                        return Request.CreateResponse(HttpStatusCode.NotFound, "no data found");
                    }
                }
                var file = HttpContext.Current.Request.Files.Count > 0 ? HttpContext.Current.Request.Files[0] : null;
                if (file != null && file.ContentLength > 0)
                {

                    string fileName = Path.GetFileName(file.FileName);
                    //for changing file name 
                    string desiredFileName = "Main";
                    //get file extension
                    string fileExtension = Path.GetExtension(fileName);
                    string directoryPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Documents", receivedDocument.DartaNo.ToString());
                    //creates directory if not exists
                    if (!System.IO.Directory.Exists(directoryPath))
                    {
                        Directory.CreateDirectory(directoryPath);
                    }

                    string filePath = Path.Combine(directoryPath, desiredFileName + fileExtension);
                    //save file in the filePath
                    await Task.Run(() => file.SaveAs(filePath));
                    //provides hosted url  https://.ip/directory/filename
                    //as the url or ip can change the path in database should be save like this
                    string fileUrl = "/documents/" + receivedDocument.DartaNo.ToString() + "/" + desiredFileName + fileExtension;
                    receivedDocument.DocumentPath = fileUrl;
                }
                int x = await dal.InsertUpdate(receivedDocument);
                if (x != 0)
                {
                    //if not done returns 0 as DId
                    receivedDocument.DId = x;

                    //get numbers of department in departmentTable
                    DepartmentDal depDal = new DepartmentDal();
                    int numberOfDepartment = await depDal.GetNumberOfDepartment();
                    //to insert in the database
                    DocumentStatusDal statusDal = new DocumentStatusDal();

                    //to make status of a document in pending state for every department
                    for (int i = 1; i <= numberOfDepartment; i++)
                    {
                        DocumentStatus documentStatus = new DocumentStatus();

                        documentStatus.SId = 0; //for insert purpose (stored procedure condition)
                        documentStatus.DocumentId = receivedDocument.DId;
                        documentStatus.StatusId = 1;
                        documentStatus.DepartmentId = i;
                        documentStatus.EntryDate = receivedDocument.EntryDate;
                        documentStatus.ApprovedBy = "Collector";
                        documentStatus.UserId = receivedDocument.UserId;
                        await statusDal.insertUpdate(documentStatus);
                    }
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

        //commented update method
        //[HttpPut]
        //[Route("api/EditDocumentRegistrationByDId")]
        //public async Task<HttpResponseMessage> Update(int DId)
        //{
        //    DocumentRegistration rf = new DocumentRegistration();
        //    rf = (await dal.GetData()).Find(o => o.DId == DId);
        //    try
        //    {
        //        //HttpContext.Current.Request.Form is used to extract the form data of current http request
        //        DocumentRegistration receivedDocument = new DocumentRegistration();
        //        receivedDocument.DartaNo = Convert.ToInt32(HttpContext.Current.Request.Form["DartaNo"]);
        //        receivedDocument.DocumentTitle = HttpContext.Current.Request.Form["DocumentTitle"];
        //        receivedDocument.Organization = HttpContext.Current.Request.Form["Organization"];
        //        receivedDocument.StateId = Convert.ToInt32(HttpContext.Current.Request.Form["StateId"]);
        //        receivedDocument.DistrictId = Convert.ToInt32(HttpContext.Current.Request.Form["DistrictId"]);
        //        receivedDocument.VDCMUNId = Convert.ToInt32(HttpContext.Current.Request.Form["VDCMUNId"]);
        //        receivedDocument.WardNo = Convert.ToInt32(HttpContext.Current.Request.Form["WardNo"]);
        //        receivedDocument.Tole = HttpContext.Current.Request.Form["Tole"];
        //        receivedDocument.Email = HttpContext.Current.Request.Form["Email"];
        //        receivedDocument.Phone = HttpContext.Current.Request.Form["Phone"];
        //        receivedDocument.MobileNo = HttpContext.Current.Request.Form["MobileNo"];
        //        receivedDocument.EntryDate = DateTime.Parse(HttpContext.Current.Request.Form["EntryDate"]);

        //        receivedDocument.UserId = Convert.ToInt32(HttpContext.Current.Request.Form["UserId"]);
        //        receivedDocument.DocumentPath = HttpContext.Current.Request.Form["DocumentPath"];
        //        receivedDocument.IsActive = bool.Parse(HttpContext.Current.Request.Form["IsActive"]);
        //        receivedDocument.Remarks = HttpContext.Current.Request.Form["Remarks"];

        //        var file = HttpContext.Current.Request.Files.Count > 0 ? HttpContext.Current.Request.Files[0] : null;
        //        if (file != null && file.ContentLength > 0)
        //        {

        //            string fileName = Path.GetFileName(file.FileName);
        //            //for changing file name 
        //            // string desiredFileName = re.DartaNo.ToString();
        //            //get file extension
        //            string fileExtension = Path.GetExtension(fileName);
        //            string directoryPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Documents", receivedDocument.DartaNo.ToString());
        //            //creates directory if not exists
        //            if (!System.IO.Directory.Exists(directoryPath))
        //            {
        //                Directory.CreateDirectory(directoryPath);
        //            }

        //            //string filePath = Path.Combine(directoryPath, desiredFileName + fileExtension);
        //            string filePath = Path.Combine(directoryPath, "Main" + fileExtension);

        //            await Task.Run(() => file.SaveAs(filePath));
        //            //provides hosted url  https://.ip/directory/filename
        //            string fileUrl = Request.RequestUri.Scheme + "://" + Request.RequestUri.Authority + "/documents/" + receivedDocument.DartaNo.ToString() + "/" + "Main" + fileExtension;
        //            receivedDocument.DocumentPath = fileUrl;
        //        }

        //        if (rf != null)
        //        {
        //            int x = await dal.Edit(DId, receivedDocument);
        //            receivedDocument.DId = x;
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

        [HttpPut]
        [Route("api/DeleteDocumentRegistration")]
        public async Task<HttpResponseMessage> DeleteDocumentRegistration(int DId)
        {
            try
            {
                //DocumentRegistration receivedDocument = new DocumentRegistration();
                //receivedDocument.DId = Convert.ToInt32(HttpContext.Current.Request.Form["DId"]);

                DocumentRegistration checkDocument = new DocumentRegistration();
                checkDocument = (await dal.GetData()).Find(o => o.DId == DId);
                if (checkDocument != null)
                {
                    await Task.Run(() => dal.DeleteData(DId));
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
