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

    //js作图用这个串来传递数据
    public string jsonstr = "";
    public string jsonstr2 = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //首次进入，给按钮和repeater赋初始值，并完成一次数据绑定

            //这里使用viewstate对两个参数进行全局存储
            ViewState["DeviceID"] = 1;
            //ViewState["ParamID"] = 1;
        }

        //这里应该是每次进来都做得事情，即对数据进行绑定
        //首先对表格进行调整
        BindAll();


    }

    private void BindAll()
    {
        int deviceid = (int)ViewState["DeviceID"];
        //int paramid = (int)ViewState["ParamID"];
        IList<ParamAndOneDataInfo> tempdata = WebUtility.GetParamAndOneData(deviceid);
        rpt.DataSource = tempdata;
        rpt.DataBind();

        //接下来对折线进行调整
        jsonstr = GetLine(deviceid, 1);
        jsonstr2 = GetLine(deviceid, 2);

        
            

    }

    private string GetLine(int deviceid,int paramid)
    {
        IList<OriginalDataInfo> orilist = new List<OriginalDataInfo>();
        OriginalData ori = new OriginalData();

        IList<ParamInfo> paramdata = ParamDataProxy.GetParams();


        orilist = ori.GetTopNDatasByDeviceIDAndParamID(20, deviceid, paramid);
        int j = orilist.Count;
        if (j > 0)
        {
            string json = "{\"j\":" + j + ",\"rows\":[";
            double maxitem = 1000;//最多放1000个点在图像上面
            int step = j > maxitem ? (int)(maxitem / j) : 1;

            for (int i = 0; i < orilist.Count; i += step)
            {
                json += "{\"time1\":\"" + (Convert.ToDateTime(orilist[i].InsertTime).AddHours(-8) - new DateTime(1970, 1, 1)).TotalMilliseconds + "\",\"price\":\"" + Convert.ToDecimal(orilist[i].ParamValue) + "\"},";
            }

            json = json.TrimEnd(',');
            json += "]}";
            return json;

        }
        else
        {
            throw new Exception("无数据");
        }
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