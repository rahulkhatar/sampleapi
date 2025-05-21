using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace SampleApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class PersonsController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            var persons = new string[]
            {
                "Donald Duck",
                "Mickey Mouse",
                "Batman",
                "Spiderman",
                "Robbin",                
            };
            return Ok(persons);
        }
    }
}
