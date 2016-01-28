using System;
using System.Collections.Generic;
using System.Text;

namespace FWSync.Model
{
    /// <summary>
    /// 表示监测位置信息的业务实体
    /// </summary>
    [Serializable]
    public class MoniterPlace
    {
        //声明字段
        private int moniterPlaceID;
        private string moniterPlaceName = string.Empty;
        private string moniterPlaceDesc = string.Empty;
        private float moniterPlaceX;
        private float moniterPlaceY;
        private bool moniterPlaceVisible;
        /// <summary>
        /// 构造函数
        /// </summary>
        public MoniterPlace()
        { }
        /// <summary>
        /// 构造函数
        /// </summary>
        /// <param name="moniterPlaceID">监测点编号</param>
        /// <param name="moniterPlaceName">监测点名称</param>
        /// <param name="moniterPlaceDesc">监测点描述</param>
        /// <param name="moniterPlaceX">监测点x坐标</param>
        /// <param name="moniterPlaceY">监测点y坐标</param>
        /// <param name="moniterPlaceVisible">监测点是否显示</param>
        public MoniterPlace(int moniterPlaceID, string moniterPlaceName, string moniterPlaceDesc, float moniterPlaceX, float moniterPlaceY, bool moniterPlaceVisible)
        {
            this.moniterPlaceID=moniterPlaceID;
            this.moniterPlaceName=moniterPlaceName;
            this.moniterPlaceDesc=moniterPlaceDesc;
            this.moniterPlaceX=moniterPlaceX;
            this.moniterPlaceY=moniterPlaceY;
            this.moniterPlaceVisible=moniterPlaceVisible;
        }
          /// <summary>
        /// 实现属性
        /// </summary>
        #region
        public int MoniterPlaceID
        {
            get { return moniterPlaceID; }
            set { moniterPlaceID = value; }
        }
        public string MoniterPlaceName
        {
            get { return moniterPlaceName; }
            set { moniterPlaceName = value; }
        }
        public string MoniterPlaceDesc
        {
            get { return moniterPlaceDesc; }
            set { moniterPlaceDesc = value; }
        }
        public float MoniterPlaceX
        {
            get { return moniterPlaceX; }
            set { moniterPlaceX = value; }
        }
        public float MoniterPlaceY
        {
            get { return moniterPlaceY; }
            set { moniterPlaceY = value; }
        }
        public bool MoniterPlaceVisible
        {
            get { return moniterPlaceVisible; }
            set { moniterPlaceVisible = value; }
        }
        #endregion
    }
}
