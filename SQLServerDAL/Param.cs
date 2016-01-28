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
    public class Param : IParam
    {

        //静态常量
        private const string SQL_SELECT_PARAMS = "SELECT * FROM Param";
        private const string SQL_SELECT_PARAM_BY_ID = "SELECT * FROM Param where ParamID = @ParamID";
        private const string PARAM_PARAM_ID = "@ParamID";



        public IList<ParamInfo> GetParams()
        {
            IList<ParamInfo> param = new List<ParamInfo>();

            //Execute a query to read the categories
            using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, SQL_SELECT_PARAMS, null))
            {
                while (rdr.Read())
                {
                    ParamInfo parm = new ParamInfo(rdr.GetInt32(0), rdr.GetString(1), rdr.GetString(2), rdr.GetString(3));
                    param.Add(parm);
                }
            }

            return param;
        }

        public ParamInfo GetParamByID(int paramid)
        {
            ParamInfo param = null;

            //新建参数列表
            SqlParameter parm = new SqlParameter(PARAM_PARAM_ID, System.Data.SqlDbType.Int);
            //绑定参数
            parm.Value = paramid;

            //执行query
            using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, SQL_SELECT_PARAM_BY_ID, parm))
            {
                if (rdr.Read())
                {
                    param = new ParamInfo(rdr.GetInt32(0), rdr.GetString(1), rdr.GetString(2), rdr.GetString(3));
                }
                else
                {
                    param = new ParamInfo();
                }
            }

            return param;

        }
    }
}
