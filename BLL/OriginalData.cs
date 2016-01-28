using System;
using System.Collections.Generic;
using System.Text;
using FWSync.Model;
using FWSync.IDAL;

namespace FWSync.BLL
{
    public class OriginalData
    {

        // Get an instance of the Device DAL using the DALFactory
        // Making this static will cache the DAL instance after the initial load
        private static readonly IOriginalData dal = FWSync.DALFactory.DataAccess.CreateOriginalData();



        public IList<OriginalDataInfo> GetTopNDatas(int num)
        {
            //写了这么几句，是为了调整返回数值的顺序
            IList<OriginalDataInfo> orig = dal.GetTopNDatas(num);

           

            return orig;
        }


        public IList<OriginalDataInfo> GetTopNDatasByDeviceID(int num, int deviceid)
        {
            //写了这么几句，是为了调整返回数值的顺序
            IList<OriginalDataInfo> orig = dal.GetTopNDatasByDeviceID(num, deviceid);

            

            return orig;
        }

        public IList<OriginalDataInfo> GetTopNDatasByDeviceIDAndParamID(int num, int deviceid, int paramid)
        {
            //写了这么几句，是为了调整返回数值的顺序
            IList<OriginalDataInfo> orig = dal.GetTopNDatasByDeviceIDAndParamID(num, deviceid, paramid);

            
            return orig;
        }


        public IList<OriginalDataInfo> GetAllDataBetweenTimes(DateTime from, DateTime to)
        {
            return dal.GetAllDataBetweenTimes(from, to);
        }

        public IList<OriginalDataInfo> GetDataByDeviceBetweenTimes(int deviceid, DateTime from, DateTime to)
        {
            return dal.GetDataByDeviceBetweenTimes(deviceid, from, to);
        }

    }
}

