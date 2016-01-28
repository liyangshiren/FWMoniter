using System;
using System.Collections.Generic;
using System.Text;
using FWSync.IDAL;
using FWSync.Model;
using System.Data.SqlClient;
using FWSync.DBUtility;
using System.Data;

namespace FWSync.SQLServerDAL
{
    public class Device : IDevice
    {

        //静态常量
        private const string SQL_SELECT_DEVICES = "SELECT * FROM Device";
        private const string SQL_SELECT_DEVICE_BY_ID = "SELECT * FROM Device where DeviceID = @DeviceID";
        private const string PARAM_DEVICE_ID = "@DeviceID";


        /// <summary>
        /// 获取所有设备信息的方法
        /// </summary>
        /// <returns></returns>
        public IList<DeviceInfo> GetDevices()
        {
            IList<DeviceInfo> devices = new List<DeviceInfo>();

            //Execute a query to read the categories
            using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, SQL_SELECT_DEVICES, null))
            {
                while (rdr.Read())
                {
                    DeviceInfo dev = new DeviceInfo(rdr.GetInt32(0), rdr.GetDouble(1), rdr.GetDouble(2), rdr.GetString(3));
                    devices.Add(dev);
                }
            }

            return devices;
        }

        /// <summary>
        /// 通过设备id获取单个设备表的方法
        /// </summary>
        /// <param name="deviceid"></param>
        /// <returns></returns>
        public DeviceInfo GetDeviceByID(int deviceid)
        {
            //初始化返回变量
            DeviceInfo device = null;

            //新建参数列表
            SqlParameter parm = new SqlParameter(PARAM_DEVICE_ID, System.Data.SqlDbType.Int);
            //绑定参数
            parm.Value = deviceid;

            //执行query
            using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, SQL_SELECT_DEVICE_BY_ID, parm))
            {
                if (rdr.Read())
                {
                    device = new DeviceInfo(rdr.GetInt32(0), rdr.GetDouble(1), rdr.GetDouble(2), rdr.GetString(3));
                }
                else
                {
                    device = new DeviceInfo();
                }
            }

            return device;



        }
    }
}

