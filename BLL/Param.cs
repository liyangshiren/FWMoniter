using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FWSync.Model;
using FWSync.IDAL;

namespace FWSync.BLL
{
    public class Param
    {
        // Get an instance of the Param DAL using the DALFactory
        // Making this static will cache the DAL instance after the initial load
        private static readonly IParam dal = FWSync.DALFactory.DataAccess.CreateParam();

        public IList<ParamInfo> GetParams()
        {
            return dal.GetParams();
        }

        public ParamInfo GetParamByID(int paramid)
        {
            return dal.GetParamByID(paramid);
        }


    }
}

