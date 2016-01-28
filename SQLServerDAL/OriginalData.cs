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
    public class OriginalData : IOriginalData
    {

        //静态常量
        private const string SQL_SELECT_TOPN_ORIGINALDATA = "SELECT TOP {0} * FROM OriginalData ORDER BY InsertTime DESC";
        private const string SQL_SELECT_TOPN_ORIGINALDATA_BY_DEVICE = "SELECT TOP {0} * FROM OriginalData WHERE DeviceID = @DeviceID ORDER BY InsertTime DESC";
        private const string SQL_SELECT_TOPN_ORIGINALDATA_BY_DEVICE_AND_PARAM = "SELECT TOP {0} * FROM OriginalData WHERE DeviceID = @DeviceID AND ParamID=@ParamID ORDER BY InsertTime DESC";
        private const string SQL_SELECT_ORIGINALDATA_BETWEEN_TIMES = "SELECT * FROM OriginalData where InsertTime BETWEEN @InsertTimeFrom AND @InsertTimeTo";
        private const string SQL_SELECT_ORIGINALDATA_BY_DEVICEID_BETWEEN_TIMES = "SELECT * FROM OriginalData where DeviceID = @DeviceID AND ( InsertTime BETWEEN @InsertTimeFrom AND @InsertTimeTo )";

        private const string PARAM_DEVICEID = "@DeviceID";
        private const string PARAM_PARAMID = "@ParamID";
        private const string PARAM_DATETIME_FROM = "@InsertTimeFrom";
        private const string PARAM_DATETIME_TO = "@InsertTimeTo";

        /// <summary>
        /// 提取最后N个数据的方法
        /// </summary>
        /// <param name="num"></param>
        /// <returns></returns>
        public IList<OriginalDataInfo> GetTopNDatas(int num)
        {
            IList<OriginalDataInfo> originaldata = new List<OriginalDataInfo>();

            //创建一个新的查询字符串并赋值
            StringBuilder sql = new StringBuilder(SQL_SELECT_TOPN_ORIGINALDATA);
            string sqlSearch = string.Format(sql.ToString(), num);

            using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, sqlSearch, null))
            {
                while (rdr.Read())
                {
                    OriginalDataInfo oridata = new OriginalDataInfo(rdr.GetInt64(0), rdr.GetInt32(1), rdr.GetDateTime(2), rdr.GetInt32(3), (float)rdr.GetDouble(4));
                    originaldata.Add(oridata);
                }
            }

            return originaldata;
        }

        /// <summary>
        /// 通过设备号提取前N个数据的方法
        /// </summary>
        /// <param name="num"></param>
        /// <param name="to"></param>
        /// <returns></returns>
        public IList<OriginalDataInfo> GetTopNDatasByDeviceID(int num, int deviceid)
        {

            IList<OriginalDataInfo> originaldata = new List<OriginalDataInfo>();

            //创建一个新的查询字符串并赋值
            StringBuilder sql = new StringBuilder(SQL_SELECT_TOPN_ORIGINALDATA_BY_DEVICE);
            string sqlSearch = string.Format(sql.ToString(), num);

           

            //新建参数列表
            SqlParameter parm = new SqlParameter(PARAM_DEVICEID, System.Data.SqlDbType.Int);
            //绑定参数
            parm.Value = deviceid;

            using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, sqlSearch, parm))
            {
                while (rdr.Read())
                {
                    OriginalDataInfo oridata = new OriginalDataInfo(rdr.GetInt64(0), rdr.GetInt32(1), rdr.GetDateTime(2), rdr.GetInt32(3), (float)rdr.GetDouble(4));
                    originaldata.Add(oridata);
                }

            }

            return originaldata;
        }




        public IList<OriginalDataInfo> GetTopNDatasByDeviceIDAndParamID(int num, int deviceid, int paramid)
        {

            IList<OriginalDataInfo> originaldata = new List<OriginalDataInfo>();

            //创建一个新的查询字符串并赋值
            StringBuilder sql = new StringBuilder(SQL_SELECT_TOPN_ORIGINALDATA_BY_DEVICE_AND_PARAM);
            string sqlSearch = string.Format(sql.ToString(), num);

            SqlParameter[] parms = SqlHelper.GetCachedParameters(sqlSearch);

            // 如果参数为空，创建新的参数
            if (parms == null)
            {
                parms = new SqlParameter[]
                { 
                    new SqlParameter(PARAM_DEVICEID,SqlDbType.Int),
                    new SqlParameter(PARAM_PARAMID,SqlDbType.Int),
                };
                SqlHelper.CacheParameters(sqlSearch, parms);
            }

            // 设置新的参数
            parms[0].Value = deviceid;
            parms[1].Value = paramid;

            using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, sqlSearch, parms))
            {
                while (rdr.Read())
                {
                    OriginalDataInfo oridata = new OriginalDataInfo(rdr.GetInt64(0), rdr.GetInt32(1), rdr.GetDateTime(2), rdr.GetInt32(3), (float)rdr.GetDouble(4));
                    originaldata.Add(oridata);
                }

            }

            return originaldata;
        }



        /// <summary>
        /// 通过开始结束时间提取所有数据的方法
        /// </summary>
        /// <param name="from"></param>
        /// <param name="to"></param>
        /// <returns></returns>
        public IList<OriginalDataInfo> GetAllDataBetweenTimes(DateTime from, DateTime to)
        {

            IList<OriginalDataInfo> originaldata = new List<OriginalDataInfo>();

            SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_SELECT_ORIGINALDATA_BETWEEN_TIMES);

            // 如果参数为空，创建新的参数
            if (parms == null)
            {
                parms = new SqlParameter[]
                { 
                    new SqlParameter(PARAM_DATETIME_FROM,SqlDbType.DateTime),
                    new SqlParameter(PARAM_DATETIME_TO,SqlDbType.DateTime),
                };
                SqlHelper.CacheParameters(SQL_SELECT_ORIGINALDATA_BETWEEN_TIMES, parms);
            }

            // 设置新的参数
            parms[0].Value = from;
            parms[1].Value = to;

            using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, SQL_SELECT_ORIGINALDATA_BETWEEN_TIMES, parms))
            {
                while (rdr.Read())
                {
                    OriginalDataInfo oridata = new OriginalDataInfo(rdr.GetInt64(0), rdr.GetInt32(1), rdr.GetDateTime(2), rdr.GetInt32(3), (float)rdr.GetDouble(4));
                    originaldata.Add(oridata);
                }

            }

            return originaldata;
        }

        /// <summary>
        /// 通过设备id，开始结束时间提取此设备期间内数据的方法
        /// </summary>
        /// <param name="deviceid"></param>
        /// <param name="from"></param>
        /// <param name="to"></param>
        /// <returns></returns>
        public IList<OriginalDataInfo> GetDataByDeviceBetweenTimes(int deviceid, DateTime from, DateTime to)
        {
            IList<OriginalDataInfo> originaldata = new List<OriginalDataInfo>();

            SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_SELECT_ORIGINALDATA_BY_DEVICEID_BETWEEN_TIMES);

            // 如果参数为空，创建新的参数
            if (parms == null)
            {
                parms = new SqlParameter[]
                { 
                    new SqlParameter(PARAM_DEVICEID,SqlDbType.Int),
                    new SqlParameter(PARAM_DATETIME_FROM,SqlDbType.DateTime),
                    new SqlParameter(PARAM_DATETIME_TO,SqlDbType.DateTime),
                };
                SqlHelper.CacheParameters(SQL_SELECT_ORIGINALDATA_BY_DEVICEID_BETWEEN_TIMES, parms);
            }

            // 设置新的参数
            parms[0].Value = deviceid;
            parms[1].Value = from;
            parms[2].Value = to;

            using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, SQL_SELECT_ORIGINALDATA_BY_DEVICEID_BETWEEN_TIMES, parms))
            {
                while (rdr.Read())
                {
                    OriginalDataInfo oridata = new OriginalDataInfo(rdr.GetInt64(0), rdr.GetInt32(1), rdr.GetDateTime(2), rdr.GetInt32(3), (float)rdr.GetDouble(4));
                    originaldata.Add(oridata);
                }

            }

            return originaldata;
        }
    }
}
