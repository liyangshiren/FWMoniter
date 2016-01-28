using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    /// <summary>
    /// 表示用户角色的业务实体
    /// </summary>
    [Serializable]
    public class UserRole
    {
        //字段
        private short userRoleID;
        private short userID;
        private short roleID;
        /// <summary>
        /// 构造函数
        /// </summary>
        public UserRole()
        { }
         /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="userRoleID">用户角色编号</param>
        /// <param name="userID">用户ID</param>
        /// <param name="roleID">角色ID</param>
        public UserRole(short userRoleID, short userID, short roleID) 
        {
            this.userRoleID = userRoleID;
            this.userID = userID;
            this.roleID = roleID;
        }
        //实现属性
        #region
        public short UserRoleID
        {
            get { return userRoleID; }
            set { userRoleID = value; }
        }
        public short UserID
        {
            get { return userID; }
            set { userID = value; }
        }
        public short RoleID
        {
            get { return roleID; }
            set { roleID = value; }
        }
        #endregion
    }
}
