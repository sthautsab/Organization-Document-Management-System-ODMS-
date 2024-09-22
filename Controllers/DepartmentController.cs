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
    public class DepartmentController : ApiController
    {


        DepartmentDal dal = new DepartmentDal();
        [Route("api/GetListOfDepartment")]

        // GET: DocumentRegistrationApi
        public async Task<HttpResponseMessage> Get()
        {
            List<Department> departmentdata = new List<Department>();
            try
            {
                departmentdata = await dal.GetData();
                if (departmentdata != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, new { department = departmentdata });
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
        [Route("api/GetDepartmentByDeportId")]
        public async Task<HttpResponseMessage> GetById(int DeportId)
        {
            List<Department> departmentdata = new List<Department>();
            List<Department> singledepartmentdata = new List<Department>();


            try
            {
                Department dr = new Department();
                departmentdata = await dal.GetData();
                dr = departmentdata.FirstOrDefault(x => x.DeportId == DeportId);
                if (dr != null)
                {
                    singledepartmentdata.Add(dr);
                    return Request.CreateResponse(HttpStatusCode.OK, new { department = singledepartmentdata });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Item with id " + DeportId + " does not exists");
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
        }

        //[HttpPost]
        //[Route("api/InsertDepartment")]

        //public async Task<HttpResponseMessage> Create(Department receivedDocument)
        //{
        //    try
        //    {
        //        int x = await dal.CreateData(receivedDocument);
        //        if (x != 0)
        //        {
        //            receivedDocument.DeportId = x;
        //            return Request.CreateResponse(HttpStatusCode.OK, receivedDocument);
        //        }
        //        else
        //        {
        //            return Request.CreateResponse(HttpStatusCode.BadRequest);
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
        //    }
        //}


        //[HttpPost]
        //[Route("api/insertUpdateDepartment")]
        //public async Task<HttpResponseMessage> insertUpdate(Department receivedDocument)
        //{
        //    try
        //    {
        //        if (receivedDocument.DeportId != 0)
        //        {
        //            Department department = new Department();
        //            department = (await dal.GetData()).Find(y => y.DeportId == receivedDocument.DeportId);
        //            if (department == null)
        //            {
        //                return Request.CreateResponse(HttpStatusCode.NotFound);
        //            }
        //        }
        //        int x = await dal.insertUpdate(receivedDocument);
        //        if (x != 0)
        //        {
        //            receivedDocument.DeportId = x;
        //            return Request.CreateResponse(HttpStatusCode.OK, receivedDocument);
        //        }
        //        else
        //        {
        //            return Request.CreateResponse(HttpStatusCode.BadRequest);
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
        //    }
        //}


        //[HttpPut]
        //[Route("api/EditDepartmentByDeportId")]
        //public async Task<HttpResponseMessage> Update(int DeportId, Department receivedDocument)
        //{
        //    Department rf = new Department();
        //    rf = (await dal.GetData()).Find(o => o.DeportId == DeportId);
        //    try
        //    {
        //        if (rf != null)
        //        {
        //            int x = await dal.Edit(DeportId, receivedDocument);
        //            receivedDocument.DeportId = x;
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

        //[HttpPut]
        //[Route("api/DeleteDepartmentByDeportId")]
        //public async Task<HttpResponseMessage> DeleteDepartment(int DeportId)
        //{
        //    try
        //    {
        //        Department rf = new Department();
        //        rf = (await dal.GetData()).Find(o => o.DeportId == DeportId);
        //        if (rf != null)
        //        {
        //            dal.DeleteData(DeportId);
        //            return Request.CreateResponse(HttpStatusCode.OK);
        //        }
        //        else
        //        {
        //            return Request.CreateResponse(HttpStatusCode.NotFound);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return Request.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
        //    }
        //}
    }
}
