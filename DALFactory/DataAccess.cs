using System;
using System.Collections.Generic;
using System.Text;
using System.Reflection;
using System.Configuration;

namespace FWSync.DALFactory
{
    public sealed class DataAccess
    {
        private static readonly string path = ConfigurationManager.AppSettings["WebDAL"];
        private static readonly string originalMoniterPath = ConfigurationManager.AppSettings["OriginalMoniterPath"];

        private DataAccess() { }

        public static FWSync.IDAL.IDevice CreateDevice()
        {
            string className = path + ".Device";
            return (FWSync.IDAL.IDevice)Assembly.Load(path).CreateInstance(className);
        }

        public static FWSync.IDAL.IOriginalData CreateOriginalData()
        {
            string className = path + ".OriginalData";
            return (FWSync.IDAL.IOriginalData)Assembly.Load(path).CreateInstance(className);
        }

        public static FWSync.IDAL.IParam CreateParam()
        {
            string className = path + ".Param";
            return (FWSync.IDAL.IParam)Assembly.Load(path).CreateInstance(className);
        }

        public static FWSync.IDAL.IUser CreateUser()
        {
            string className = path + ".User";
            return (FWSync.IDAL.IUser)Assembly.Load(path).CreateInstance(className);
        }
       

    }
}
