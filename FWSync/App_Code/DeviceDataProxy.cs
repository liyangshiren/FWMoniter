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
    public static class DeviceDataProxy
    {
        private static readonly int DeviceTimeout = int.Parse(ConfigurationManager.AppSettings["DeviceCacheDuration"]);
        private static readonly bool enableCaching = bool.Parse(ConfigurationManager.AppSettings["EnableCaching"]);

        public static IList<DeviceInfo> GetDevices()
        {
            Device dev = new Device();

            if (!enableCaching)
                return dev.GetDevices();

            string key = "device_all";

            IList<DeviceInfo> data = (IList<DeviceInfo>)HttpRuntime.Cache[key];

            // Check if the data exists in the data cache
            if (data == null)
            {
                // If the data is not in the cache then fetch the data from the business logic tier
                data = dev.GetDevices();

                // Create a AggregateCacheDependency object from the factory
                AggregateCacheDependency cd = DependencyFacade.GetDeviceDependency();

                // Store the output in the data cache, and Add the necessary AggregateCacheDependency object
                HttpRuntime.Cache.Add(key, data, cd, DateTime.Now.AddHours(DeviceTimeout), Cache.NoSlidingExpiration, CacheItemPriority.High, null);
            }

            return data;

        }


        public static DeviceInfo GetDeviceByID(int deviceid)
        {
            Device dev = new Device();

            if (!enableCaching)
                return dev.GetDeviceByID(deviceid);

            string key = "device_" + deviceid;

            DeviceInfo data = (DeviceInfo)HttpRuntime.Cache[key];

            // Check if the data exists in the data cache
            if (data == null)
            {
                // If the data is not in the cache then fetch the data from the business logic tier
                data = dev.GetDeviceByID(deviceid);

                // Create a AggregateCacheDependency object from the factory
                AggregateCacheDependency cd = DependencyFacade.GetDeviceDependency();

                // Store the output in the data cache, and Add the necessary AggregateCacheDependency object
                HttpRuntime.Cache.Add(key, data, cd, DateTime.Now.AddHours(DeviceTimeout), Cache.NoSlidingExpiration, CacheItemPriority.High, null);
            }

            return data;

        }




    }
}