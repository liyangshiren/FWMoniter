using System;
using System.Collections.Generic;
using System.Text;
using FWSync.Model;

namespace FWSync.IDAL
{
    /// <summary>
    /// 设备数据访问层接口
    /// </summary>
    public interface IDevice
    {
        /// <summary>
        /// 获取所有设备的方法
        /// </summary>
        /// <returns>返回DeviceInfo类型的列表</returns>
        IList<DeviceInfo> GetDevices();

        /// <summary>
        /// 通过deviceid获取设备的方法
        /// </summary>
        /// <param name="deviceid"></param>
        /// <returns>返回DeviceInfo</returns>
        DeviceInfo GetDeviceByID(int deviceid);
    }
}

