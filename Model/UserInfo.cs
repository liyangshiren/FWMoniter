using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    [Serializable]
    public class UserInfo
    {


        //字段
        private int userID;
        private string userName;
        private string passWord;



        //构造函数
        public UserInfo()
        { }

        public UserInfo(int userID, string userName, string passWord)
        {
            this.userID = userID;
            this.userName = userName;
            this.passWord = passWord;
        }

        public int UserID
        {
            get
            {
                return userID;
            }
            set
            {
                userID = value;
            }
        }

        public string UserName
        {
            get
            {
                return userName;
            }
            set
            {
                userName = value;
            }
        }

        public string PassWord
        {
            get
            {
                return passWord;
            }
            set
            {
                passWord = value;
            }
        }


    }
}


