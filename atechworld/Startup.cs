using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(atechworld.Startup))]
namespace atechworld
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
