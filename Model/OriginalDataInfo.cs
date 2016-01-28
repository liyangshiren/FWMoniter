using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    [Serializable]
    public class OriginalDataInfo
    {

        //字段
        private long iD;
        private int deviceID;
        private DateTime insertTime;
        private int paramID;
        private float paramValue;


        //构造函数
        public OriginalDataInfo()
        { }

        public OriginalDataInfo(long iD, int deviceID, DateTime insertTime, int paramID, float paramValue)
        {
            this.iD = iD;
            this.deviceID = deviceID;
            this.insertTime = insertTime;
            this.paramID = paramID;
            this.paramValue = paramValue;
        }

        public long ID
        {
            get
            {
                return iD;
            }
            set
            {
                iD = value;
            }
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