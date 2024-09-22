using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace ODMS.MessageHandler
{

    public class DisableCorsForDeleteHandler : DelegatingHandler
    {
        protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {
            if (request.Method == HttpMethod.Delete)
            {
                var response = await base.SendAsync(request, cancellationToken);
                response.Headers.Add("Access-Control-Allow-Origin", "*");
                response.Headers.Add("Access-Control-Allow-Methods", "DELETE");
                return response;
            }
            else
            {
                return await base.SendAsync(request, cancellationToken);
            }
        }
    }

}