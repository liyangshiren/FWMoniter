using System;
using System.Collections.Generic;
using System.Text;
using FWSync.Model;

namespace FWSync.IDAL
{
    /// <summary>
    /// 用户数据访问层接口
    /// </summary>
    public interface IUser
    {
        /// <summary>
        /// 验证用户是否存在的方法
        /// </summary>
        /// <param name="用户名"></param>
        /// <returns>返回bool类型判断是否查找到</returns>
        bool ValidateUserExist(string username);

        /// <summary>
        /// 插入一条用户信息的方法
        /// </summary>
        /// <param name="UserInfo"></param>
        /// <returns>返回bool类型判断是否成功</returns>
        bool InsertUser(UserInfo user);

        /// <summary>
        /// 判断是否注册
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns>返回bool类型判断用户名密码是否正确</returns>
        bool ValidateUser(string username, string password);

    }
}

