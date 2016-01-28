using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    /// <summary>
    /// ��ʾ�û���ɫ��ҵ��ʵ��
    /// </summary>
    [Serializable]
    public class UserRole
    {
        //�ֶ�
        private short userRoleID;
        private short userID;
        private short roleID;
        /// <summary>
        /// ���캯��
        /// </summary>
        public UserRole()
        { }
         /// <summary>
        /// ���캯��
        /// </summary>
        /// <param name="userRoleID">�û���ɫ���</param>
        /// <param name="userID">�û�ID</param>
        /// <param name="roleID">��ɫID</param>
        public UserRole(short userRoleID, short userID, short roleID) 
        {
            this.userRoleID = userRoleID;
            this.userID = userID;
            this.roleID = roleID;
        }
        //ʵ������
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
