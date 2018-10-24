using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EMT_ADB.Startup))]
namespace EMT_ADB
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {

        }
    }
}
