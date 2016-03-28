using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc;
using System.Text;
using System.Collections;

namespace WorksOnMyMachine.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }
        public IActionResult About()
        {
            ViewData["HostName"] = Environment.GetEnvironmentVariable("HOSTNAME") ??
                Environment.GetEnvironmentVariable("COMPUTERNAME");

            ViewData["OS"] = Environment.GetEnvironmentVariable("OS") ??
                Environment.GetEnvironmentVariable("DNX_RUNTIME_ID");

            ViewData["PROCESSORARCH"] = Environment.GetEnvironmentVariable("PROCESSOR_ARCHITEW6432");
            ViewData["HOSTING_ENVIRONMENT"] = Environment.GetEnvironmentVariable("Hosting:Environment");

            StringBuilder envVars = new StringBuilder();
            foreach (DictionaryEntry de in Environment.GetEnvironmentVariables())
                envVars.Append(string.Format("<strong>{0}</strong>:{1}<br \\>", de.Key, de.Value));

            ViewData["ENV_VARS"] = envVars.ToString();

            return View();
        }
        public IActionResult Error()
        {
            return View();
        }
    }
}
