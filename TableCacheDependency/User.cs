using System.Web.Caching;

namespace FWSync.TableCacheDependency
{
    /// <summary>
    /// Implementation of Category Cache Dependency for SQL Server 2000
    /// </summary>
    public class User : TableDependency
    {
        /// <summary>
        /// Call its base constructor by passing its specific configuration key
        /// </summary>
        public User() : base("UserTableDependency") { }
    }
}
