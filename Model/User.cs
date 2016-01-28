using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    /// <summary>
    /// 表示用户信息的业务实体
    /// </summary>
    [Serializable]
    public class User
    {
        //声明字段
        private short userID;
        private string userName = string.Empty;
        private string password = string.Empty;
        private string companyName = string.Empty;
        private string telephone = string.Empty;
        private bool isValid;

        /// <summary>
        /// 构造函数
        /// </summary>
        public User()
        { }
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="userID">用户编号</param>
        /// <param name="userName">用户名</param>
        /// <param name="password">密码</param>
        public User(short userID, string userName, string password, string companyName, string telephone, bool isValid) 
        {
            this.userID = userID;
            this.userName = userName;
            this.password = password;
            this.companyName = companyName;
            this.telephone = telephone;
            this.isValid = isValid;
        }
        /// <summary>
        /// 实现属性
        /// </summary>
        #region
        public short UserID
        {
            get { return userID; }
            set { userID = value; }
        }
        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string CompanyName
        {
            get { return companyName; }
            set { companyName = value; }
        }
        public string Telephone
        {
            get { return telephone; }
            set { telephone = value; }
        }
        public bool IsValid
        {
            get { return isValid; }
            set { isValid = value; }
        }
        #endregion

    }
}
