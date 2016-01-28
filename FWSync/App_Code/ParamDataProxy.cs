using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Web.Caching;
using FWSync.Model;
using FWSync.BLL;
using FWSync.CacheDependencyFactory;

/// <summary>
/// AlarmDataProxy 的摘要说明
/// </summary>
namespace FWSync.Web
{
    public static class ParamDataProxy
    {
        private static readonly int ParamTimeout = int.Parse(ConfigurationManager.AppSettings["ParamCacheDuration"]);
        private static readonly bool enableCaching = bool.Parse(ConfigurationManager.AppSettings["EnableCaching"]);

        public static IList<ParamInfo> GetParams()
        {
            Param pra = new Param();

            if (!enableCaching)
                return pra.GetParams();

            string key = "param_all";

            IList<ParamInfo> data = (IList<ParamInfo>)HttpRuntime.Cache[key];

            // Check if the data exists in the data cache
            if (data == null)
            {
                // If the data is not in the cache then fetch the data from the business logic tier
                data = pra.GetParams();

                // Create a AggregateCacheDependency object from the factory
                AggregateCacheDependency cd = DependencyFacade.GetParamDependency();

                // Store the output in the data cache, and Add the necessary AggregateCacheDependency object
                HttpRuntime.Cache.Add(key, data, cd, DateTime.Now.AddHours(ParamTimeout), Cache.NoSlidingExpiration, CacheItemPriority.High, null);
            }

            return data;

        }


        public static ParamInfo GetParamByID(int paramid)
        {
            Param pra = new Param();

            if (!enableCaching)
                return pra.GetParamByID(paramid);

            string key = "param_" + paramid;

            ParamInfo data = (ParamInfo)HttpRuntime.Cache[key];

            // Check if the data exists in the data cache
            if (data == null)
            {
                // If the data is not in the cache then fetch the data from the business logic tier
                data = pra.GetParamByID(paramid);

                // Create a AggregateCacheDependency object from the factory
                AggregateCacheDependency cd = DependencyFacade.GetDeviceDependency();

                // Store the output in the data cache, and Add the necessary AggregateCacheDependency object
                HttpRuntime.Cache.Add(key, data, cd, DateTime.Now.AddHours(ParamTimeout), Cache.NoSlidingExpiration, CacheItemPriority.High, null);
            }

            return data;

        }




    }
}