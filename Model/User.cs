using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    /// <summary>
    /// ��ʾ�û���Ϣ��ҵ��ʵ��
    /// </summary>
    [Serializable]
    public class User
    {
        //�����ֶ�
        private short userID;
        private string userName = string.Empty;
        private string password = string.Empty;
        private string companyName = string.Empty;
        private string telephone = string.Empty;
        private bool isValid;

        /// <summary>
        /// ���캯��
        /// </summary>
        public User()
        { }
        /// <summary>
        /// ���캯��
        /// </summary>
        /// <param name="userID">�û����</param>
        /// <param name="userName">�û���</param>
        /// <param name="password">����</param>
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
        /// ʵ������
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
