using ODMS.Dal;
using ODMS.Models;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace ODMS.Controllers
{

    public class LocationInformationController : ApiController
    {

        LocationInformationDal dal = new LocationInformationDal();
        [HttpGet]
        [Route("api/getStateInformation")]
        public async Task<HttpResponseMessage> GetState()
        {
            try
            {
                List<State> states = new List<State>();
                states = await dal.GetStateInformation();
                if (states != null)
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.OK, new { states });
                }
                else
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.NoContent);
                }
            }
            catch
            {
                return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest);
            }
        }

        [HttpGet]
        [Route("api/getDistrictByStateId")]
        public async Task<HttpResponseMessage> GetDistrict(int StateId)
        {
            try
            {
                List<DistrictData> districts = new List<DistrictData>();
                districts = await dal.GetDistrictDataByStateId(StateId);
                if (districts != null)
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.OK, new { districts });
                }
                else
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.NoContent);
                }
            }
            catch
            {
                return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest);
            }

        }
        [HttpGet]
        [Route("api/getVdcMunByDistrictId")]
        public async Task<HttpResponseMessage> GetVdcMun(int DistrictId)
        {
            try
            {
                List<VdcMun> vdcMuns = new List<VdcMun>();
                vdcMuns = await dal.GetVdcMunDataByDistrictId(DistrictId);
                if (vdcMuns != null)
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.OK, new { vdcMuns });
                }
                else
                {
                    return Request.CreateResponse(System.Net.HttpStatusCode.NoContent);
                }
            }
            catch
            {
                return Request.CreateResponse(System.Net.HttpStatusCode.BadRequest);
            }

        }
    }


}
