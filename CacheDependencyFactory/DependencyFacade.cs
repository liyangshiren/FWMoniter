using System.Configuration;
using System.Web.Caching;
using System.Collections.Generic;
using FWSync.ICacheDependency;

namespace FWSync.CacheDependencyFactory
{
    /// <summary>
    /// This class is provided to ease the usage of DependencyFactory from the client.
    /// It's main usage is to determine whether to invoke the DependencyFactory.  
    /// When no assembly is specified under CacheDependencyAssembly section in configuraion file, 
    /// then this class will return null
    /// Notice that this assembly reference System.Web
    /// </summary>
    public static class DependencyFacade
    {
        private static readonly string path = ConfigurationManager.AppSettings["CacheDependencyAssembly"];

        public static AggregateCacheDependency GetDependency()
        {
            return DependencyAccess.CreateDependency().GetDependency();
        }

        public static AggregateCacheDependency GetDeviceDependency()
        {
            if (!string.IsNullOrEmpty(path))
                return DependencyAccess.CreateDeviceDependency().GetDependency();
            else
                return null;
        }

        public static AggregateCacheDependency GetOriginalDataDependency()
        {
            if (!string.IsNullOrEmpty(path))
                return DependencyAccess.CreateOriginalDataDependency().GetDependency();
            else
                return null;
        }

        public static AggregateCacheDependency GetParamDependency()
        {
            if (!string.IsNullOrEmpty(path))
                return DependencyAccess.CreateParamDependency().GetDependency();
            else
                return null;
        }

        public static AggregateCacheDependency GetUserDependency()
        {
            if (!string.IsNullOrEmpty(path))
                return DependencyAccess.CreateUserDependency().GetDependency();
            else
                return null;
        }
    }
}
