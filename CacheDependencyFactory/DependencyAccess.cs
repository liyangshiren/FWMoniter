using System;
using System.Reflection;
using System.Configuration;
using FWSync.ICacheDependency;

namespace FWSync.CacheDependencyFactory
{
    public static class DependencyAccess
    {
        private static readonly string path = ConfigurationSettings.AppSettings["Cache"];

        private static IFWSyncCacheDependency LoadInstance(string className)
        {

            string path = ConfigurationManager.AppSettings["CacheDependencyAssembly"];
            string fullyQualifiedClass = path + "." + className;

            // Using the evidence given in the config file load the appropriate assembly and class
            return (IFWSyncCacheDependency)Assembly.Load(path).CreateInstance(fullyQualifiedClass);
        }

        public static IFWSyncCacheDependency CreateDependency()
        {
            string className = path + ".TableDependency";
            return (IFWSyncCacheDependency)Assembly.Load(path).CreateInstance(className);
        }




        /// <summary>
        /// Method to create an instance of Device dependency implementation
        /// </summary>
        /// <returns>Category Dependency Implementation</returns>
        public static IFWSyncCacheDependency CreateDeviceDependency()
        {
            return LoadInstance("Device");
        }

        /// <summary>
        /// Method to create an instance of OriginalData dependency implementation
        /// </summary>
        /// <returns>Product Dependency Implementation</returns>
        public static IFWSyncCacheDependency CreateOriginalDataDependency()
        {
            return LoadInstance("OriginalData");
        }

        /// <summary>
        /// Method to create an instance of Param dependency implementation
        /// </summary>
        /// <returns>Product Dependency Implementation</returns>
        public static IFWSyncCacheDependency CreateParamDependency()
        {
            return LoadInstance("Param");
        }

        /// <summary>
        /// Method to create an instance of User dependency implementation
        /// </summary>
        /// <returns>Item Dependency Implementation</returns>
        public static IFWSyncCacheDependency CreateUserDependency()
        {
            return LoadInstance("User");
        }
    }
}






