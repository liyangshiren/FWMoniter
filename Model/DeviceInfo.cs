using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    [Serializable]
    public class DeviceInfo
    {
        //字段
        private int deviceID;
        private double deviceX;
        private double deviceY;
        private string deviceDesc;


        //构造函数
        public DeviceInfo()
        { }

        public DeviceInfo(int deviceID, double deviceX, double deviceY, string deviceDesc)
        {
            this.deviceID = deviceID;
            this.deviceX = deviceX;
            this.deviceY = deviceY;
            this.deviceDesc = deviceDesc;
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

        public double DeviceX
        {
            get
            {
                return deviceX;
            }
            set
            {
                deviceX = value;
            }
        }

        public double DeviceY
        {
            get
            {
                return deviceY;
            }
            set
            {
                deviceY = value;
            }
        }

        public string DeviceDesc
        {
            get
            {
                return deviceDesc;
            }
            set
            {
                deviceDesc = value;
            }
        }

    }
}

