using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    /// <summary>
    /// 表示监测的业务实体
    /// </summary>
    [Serializable]
    public class Moniter
    {
        //字段
        private long moniterID;
        private int moniterPlaceID;
        private DateTime moniterTime;
        private int paramID;
        private float paramValue;
        private float halfAnHourForcast;
        private float twoHoursForcast;
        /// <summary>
        /// 构造函数
        /// </summary>
        public Moniter()
        { }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="moniterID">监测编号</param>
        /// <param name="moniterPlaceID">监测点编号</param>
        /// <param name="moniterTime">监测时间</param>
        /// <param name="paramID">参数编号</param>
        /// <param name="paramValue">参数值</param>
        /// <param name="halfAnHourForcast">0.5小时后预测值</param>
        /// <param name="twoHoursForcast">2小时后预测值</param>
        public Moniter(long moniterID, int moniterPlaceID, DateTime moniterTime, int paramID, float paramValue, float halfAnHourForcast, float twoHoursForcast)
        {
            this.moniterID = moniterID;
            this.moniterPlaceID = moniterPlaceID;
            this.moniterTime = moniterTime;
            this.paramID = paramID;
            this.paramValue = paramValue;
            this.halfAnHourForcast = halfAnHourForcast;
            this.twoHoursForcast = twoHoursForcast;
        
        }
        //实现属性
        public long MoniterID
        {
            get { return moniterID; }
            set { moniterID = value; }
        }
        public int MoniterPlaceID
        {
            get { return moniterPlaceID; }
            set { moniterPlaceID = value; }
        }
        public DateTime MoniterTime
        {
            get { return moniterTime; }
            set { moniterTime = value; }
        }
        public int ParamID
        {
            get { return paramID; }
            set { paramID = value; }
        }
        public float ParamValue
        {
            get { return paramValue; }
            set { paramValue = value; }
        }
        public float HalfAnHourForcast
        {
            get { return halfAnHourForcast; }
            set { halfAnHourForcast = value; }
        }
        public float TwoHoursForcast
        {
            get { return twoHoursForcast; }
            set { twoHoursForcast = value; }
        }


    }
}
