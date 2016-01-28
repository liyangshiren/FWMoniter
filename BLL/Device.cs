using System;
using System.Collections.Generic;
using System.Text;
using FWSync.Model;
using FWSync.IDAL;

namespace FWSync.BLL
{
    public class Device
    {
        // Get an instance of the Device DAL using the DALFactory
        // Making this static will cache the DAL instance after the initial load
        private static readonly IDevice dal = FWSync.DALFactory.DataAccess.CreateDevice();

        public IList<DeviceInfo> GetDevices()
        {
            return dal.GetDevices();
        }


        public DeviceInfo GetDeviceByID(int deviceid)
        {
            return dal.GetDeviceByID(deviceid);
        }


    }
}

