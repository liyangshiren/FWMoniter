using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    /// <summary>
    /// 表示报警类型的业务实体
    /// </summary>
    [Serializable]   
    public class AlarmType
    {
        //字段
        private int alarmTypeID;     
        private string alarmTypeName=string.Empty;
        private string alarmData = string.Empty;
        /// <summary>
        /// 构造函数
        /// </summary>
        public AlarmType()
        {}
        /// <param name="alarmTypeID">报警类型编号</param>
        /// <param name="alarmTypeName">报警类型名称</param>
        /// <param name="alarmData">报警数据</param>

        public AlarmType(int alarmTypeID, String alarmTypeName, String alarmData)
        {
            this.alarmTypeID = alarmTypeID;
            this.alarmTypeName = alarmTypeName;
            this.alarmData = alarmData;
        
        }
        //实现属性
        public int AlarmTypeID
        {
            get { return alarmTypeID; }
            set { alarmTypeID = value; }
        }
        public String AlarmTypeName
        {
            get { return alarmTypeName; }
            set { alarmTypeName = value; }
        }
        public String AlarmData
        {
            get { return alarmData; }
            set { alarmData = value; }
        }


    }
}
