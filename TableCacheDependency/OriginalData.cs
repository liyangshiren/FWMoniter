using System.Web.Caching;


namespace FWSync.TableCacheDependency
{
    public class OriginalData : TableDependency
    {
        /// <summary>
        /// Call its base constructor by passing its specific configuration key
        /// </summary>
        public OriginalData() : base("OriginalDataTableDependency") { }
    }
}

