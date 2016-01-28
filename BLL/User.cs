using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FWSync.Model;
using FWSync.IDAL;

namespace FWSync.BLL
{
    public class User
    {
        // Get an instance of the User DAL using the DALFactory
        // Making this static will cache the DAL instance after the initial load
        private static readonly IUser dal = FWSync.DALFactory.DataAccess.CreateUser();

        public bool ValidateUserExist(string username)
        {
            return dal.ValidateUserExist(username);
        }

        public bool ValidateUser(string username, string password)
        {
            return dal.ValidateUser(username, password);
        }

        public bool InsertUser(UserInfo user)
        {
            return dal.InsertUser(user);
        }

    }
}

