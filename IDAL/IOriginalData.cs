using System;
using System.Collections.Generic;
using System.Text;
using FWSync.Model;

namespace FWSync.IDAL
{
    public interface IOriginalData
    {
        /// <summary>
        /// 提取最后N个数据的方法（提取出来后使用List.Reverse即可翻转）
        /// </summary>
        /// <param name="num"></param>
        /// <returns>返回OriginalDataInfo类型的列表</returns>
        IList<OriginalDataInfo> GetTopNDatas(int num);


        IList<OriginalDataInfo> GetTopNDatasByDeviceID(int num, int deviceid);

        IList<OriginalDataInfo> GetTopNDatasByDeviceIDAndParamID(int num, int deviceid, int paramid);

        /// <summary>
        /// 提取时间段内的数据的方法
        /// </summary>
        /// <param name="from"></param>
        /// <param name="to"></param>
        /// <returns>返回OriginalDataInfo类型的列表</returns>
        IList<OriginalDataInfo> GetAllDataBetweenTimes(DateTime from, DateTime to);

        /// <summary>
        /// 通过设备id和时间提取数据的方法
        /// </summary>
        /// <returns>返回OriginalDataInfo类型的列表</returns>
        IList<OriginalDataInfo> GetDataByDeviceBetweenTimes(int deviceid, DateTime from, DateTime to);

    }
}