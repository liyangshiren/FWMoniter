using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    [Serializable]
    public class ParamInfo
    {


        //字段
        private int paramID;
        private string paramName;
        private string paramUnit;
        private string paramDesc;


        //构造函数
        public ParamInfo()
        { }

        public ParamInfo(int paramID, string paramName, string paramUnit, string paramDesc)
        {
            this.paramID = paramID;
            this.paramName = paramName;
            this.paramUnit = paramUnit;
            this.paramDesc = paramDesc;
        }

        public int ParamID
        {
            get
            {
                return paramID;
            }
            set
            {
                paramID = value;
            }
        }

        public string ParamName
        {
            get
            {
                return paramName;
            }
            set
            {
                paramName = value;
            }
        }

        public string ParamUnit
        {
            get
            {
                return paramUnit;
            }
            set
            {
                paramUnit = value;
            }
        }

        public string ParamDesc
        {
            get
            {
                return paramDesc;
            }
            set
            {
                paramDesc = value;
            }
        }




    }
}


