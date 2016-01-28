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
    public class User : IUser
    {

        //静态常量
        private const string SQL_COUNT_USER_BY_USERNAME = "SELECT COUNT(*) FROM User WHRER UserName = @UserName";
        private const string SQL_COUNT_USER_BY_USERNAME_AND_PASSWORD = "SELECT COUNT(*) FROM User WHRER UserName = @UserName AND PassWord = @PassWord";
        private const string SQL_INSERT_USER = "INSERT INTO User VALUES (@UserName,@PassWord)";

        private const string PARAM_USER_ID = "@UserID";
        private const string PARAM_USER_NAME = "@UserName";
        private const string PARAM_USER_PASSWORD = "@PassWord";


        public bool ValidateUserExist(string username)
        {
            bool exist = false;

            int num = 0;

            //新建参数列表
            SqlParameter parm = new SqlParameter(PARAM_USER_NAME, System.Data.SqlDbType.NVarChar);
            //绑定参数
            parm.Value = username;

            num = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, SQL_COUNT_USER_BY_USERNAME, parm));

            exist = num == 0 ? false : true;

            return exist;

        }

        public bool InsertUser(UserInfo user)
        {
            bool success = false;

            int num = 0;

            SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_USER);

            // 如果参数为空，创建新的参数
            if (parms == null)
            {
                parms = new SqlParameter[]
                { 
                    new SqlParameter(PARAM_USER_NAME,SqlDbType.NVarChar),
                    new SqlParameter(PARAM_USER_PASSWORD,SqlDbType.NVarChar),
                };
                SqlHelper.CacheParameters(SQL_INSERT_USER, parms);
            }

            // 设置新的参数
            parms[0].Value = user.UserName;
            parms[1].Value = user.PassWord;

            num = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, SQL_INSERT_USER, parms));

            success = num == 0 ? false : true;

            return success;
        }

        public bool ValidateUser(string username, string password)
        {
            bool okay = false;

            int num = 0;

            SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_COUNT_USER_BY_USERNAME_AND_PASSWORD);

            // 如果参数为空，创建新的参数
            if (parms == null)
            {
                parms = new SqlParameter[]
                { 
                    new SqlParameter(PARAM_USER_NAME,SqlDbType.NVarChar),
                    new SqlParameter(PARAM_USER_PASSWORD,SqlDbType.NVarChar),
                };
                SqlHelper.CacheParameters(SQL_COUNT_USER_BY_USERNAME_AND_PASSWORD, parms);
            }

            // 设置新的参数
            parms[0].Value = username;
            parms[1].Value = password;


            num = Convert.ToInt32(SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, System.Data.CommandType.Text, SQL_COUNT_USER_BY_USERNAME_AND_PASSWORD, parms));

            okay = num == 0 ? false : true;

            return okay;

        }
    }
}

