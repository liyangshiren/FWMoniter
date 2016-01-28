using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    /// <summary>
    /// 表示报警的业务实体
    /// </summary>
    [Serializable]
    public class Param
    {
        //字段
        private int paramID;        
        private string paramName = string.Empty;
        private string paramUnit = string.Empty;       
        private string paramDesc = string.Empty;      
        private float alarmMax;      
        private float alarmMin;
        private int alarmTypeID;
        /// <summary>
        /// 构造函数
        /// </summary>
        public Param()
        { }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="paramID">参数编号</param>
        /// <param name="paramName">参数名称</param>
        /// <param name="paramUnit">参数单位</param>
        /// <param name="paramDesc">参数描述</param>
        /// <param name="alarmMax">报警上限</param>
        /// <param name="alarmMin">报警下限</param>
        /// <param name="alarmTypeID">报警类型编号</param>
        public Param(int paramID, string paramName, string paramUnit, string paramDesc, float alarmMax, float alarmMin, int alarmTypeID)
        {
            this.paramID = paramID;
            this.paramName = paramName;
            this.paramUnit = paramUnit;
            this.paramDesc = paramDesc;
            this.alarmMax = alarmMax;
            this.alarmMin = alarmMin;
            this.alarmTypeID = alarmTypeID;

        }

        //实现属性
        public int ParamID
        {
            get { return paramID; }
            set { paramID = value; }
        }
        public string ParamName
        {
            get { return paramName; }
            set { paramName = value; }
        }
        public string ParamUnit
        {
            get { return paramUnit; }
            set { paramUnit = value; }
        }
        public string ParamDesc
        {
            get { return paramDesc; }
            set { paramDesc = value; }
        }
        public float AlarmMax
        {
            get { return alarmMax; }
            set { alarmMax = value; }
        }
        public float AlarmMin
        {
            get { return alarmMin; }
            set { alarmMin = value; }
        }
        public int AlarmTypeID
        {
            get { return alarmTypeID; }
            set { alarmTypeID = value; }
        }
    }
}
