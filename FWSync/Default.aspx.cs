using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FWSync.BLL;
using FWSync.Model;
using FWSync.Web;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //首次进入，给按钮和repeater赋初始值，并完成一次数据绑定
            ViewState["DeviceID"] = 1;
        }

        //这里应该是每次进来都做得事情，即对数据进行绑定
        //首先对表格进行调整
        BindAll();


    }

    private void BindAll()
    {
            int deviceid = (int)ViewState["DeviceID"];
            IList<ParamAndOneDataInfo> tempdata = WebUtility.GetParamAndOneData(deviceid);
            rpt.DataSource = tempdata;
            rpt.DataBind();

            //接下来对折线进行调整
            IList<OriginalDataInfo> orilist = new List<OriginalDataInfo>();
            OriginalData ori = new OriginalData();
            orilist = ori.GetTopNDatasByDeviceID(10, deviceid);
    }

    protected void btnDevice1_Click(object sender, EventArgs e)
    {
        ViewState["DeviceID"] = 1;
        BindAll();
    }

    protected void btnDevice2_Click(object sender, EventArgs e)
    {
        ViewState["DeviceID"] = 2;
        BindAll();
    }


}