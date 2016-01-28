using System;
using System.Collections.Generic;
using System.Text;
using FWSync.Model;

namespace FWSync.IDAL
{
    /// <summary>
    /// 参数数据访问层接口
    /// </summary>
    public interface IParam
    {
        /// <summary>
        /// 获取所有参数信息的方法
        /// </summary>
        /// <returns>返回ParamInfo结构的列表</returns>
        IList<ParamInfo> GetParams();

        /// <summary>
        /// 通过paramid获取参数信息的方法
        /// </summary>
        /// <param name="paramid"></param>
        /// <returns>返回ParamInfo结构</returns>
        ParamInfo GetParamByID(int paramid);
    }
}
