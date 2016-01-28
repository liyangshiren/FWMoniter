using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    [Serializable]
    public class ParamAndOneDataInfo
    {

        //字段
        private int deviceID;
        private DateTime insertTime;
        private string paramUnit;
        private string paramDesc;
        private float paramValue;

        public ParamAndOneDataInfo()
        { }

        public ParamAndOneDataInfo(int deviceID, DateTime insertTime, string paramUnit, string paramDesc, float paramValue)
        {
            this.deviceID = deviceID;
            this.insertTime = insertTime;
            this.paramUnit = paramUnit;
            this.paramDesc = paramDesc;
            this.paramValue = paramValue;
        }

        public int DeviceID
        {
            get
            {
                return deviceID;
            }
            set
            {
                deviceID = value;
            }
        }

        public DateTime InsertTime
        {
            get
            {
                return insertTime;
            }
            set
            {
                insertTime = value;
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

        public float ParamValue
        {
            get
            {
                return paramValue;
            }
            set
            {
                paramValue = value;
            }
        }


    }
}
