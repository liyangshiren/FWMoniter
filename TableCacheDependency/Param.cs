using System.Web.Caching;

namespace FWSync.TableCacheDependency
{
    public class Param : TableDependency
    {

        /// <summary>
        /// Call its base constructor by passing its specific configuration key
        /// </summary>
        public Param() : base("ParamTableDependency") { }

    }
}
