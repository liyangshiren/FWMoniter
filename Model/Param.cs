using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    /// <summary>
    /// ��ʾ������ҵ��ʵ��
    /// </summary>
    [Serializable]
    public class Param
    {
        //�ֶ�
        private int paramID;        
        private string paramName = string.Empty;
        private string paramUnit = string.Empty;       
        private string paramDesc = string.Empty;      
        private float alarmMax;      
        private float alarmMin;
        private int alarmTypeID;
        /// <summary>
        /// ���캯��
        /// </summary>
        public Param()
        { }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="paramID">�������</param>
        /// <param name="paramName">��������</param>
        /// <param name="paramUnit">������λ</param>
        /// <param name="paramDesc">��������</param>
        /// <param name="alarmMax">��������</param>
        /// <param name="alarmMin">��������</param>
        /// <param name="alarmTypeID">�������ͱ��</param>
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

        //ʵ������
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
