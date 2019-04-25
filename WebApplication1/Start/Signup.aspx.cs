using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bt_signup_Click(object sender, EventArgs e)
        {
            //按钮被点击
            //读入用户名保存到Account
            string Account = this.inputAccount.Text;
            string Password = this.inputPassword.Text;
            //实例化类
            Sqlconn sqlconn = new Sqlconn();
            //使用数据库查询语句查询库中是否有与Account相同的PlayerName
            DataTable signinDt = sqlconn.SelectAccount(Account);
            if (signinDt.Rows.Count > 0)
            {
                //if有{提示alert（用户名已存在）}
                Response.Write("<script>alert('用户名已存在！')</script>");
            }
            //else{在数据库中增加相应的数据；
            else
            {
                //自动生成6位int ID作为PlayerID；
                Random ran = new Random();
                int ID = ran.Next(1000000);
                //随机生成两个可采集资源
                string[] resource = new string[6] { "Cu", "Pb", "Sn", "Ti", "Cr", "Ni" };
                Random ran_ = new Random();
                int resource1 = 0;
                int resource2 = 0;
                while (resource1 == resource2) {
                    resource1 = ran.Next(6);
                    resource2 = ran.Next(6);
                }
                sqlconn.InsertPlayerInfo(Account, Password, ID, resource[resource1], resource[resource2]);
                //提示alert（注册成功）；
                Response.Write("<script>alert('注册成功！')</script>");
                //将可生产的矿物种类存入cookie
                Response.Cookies["Able1"].Value = resource[resource1];
                //Response.Cookies["Able1"].Path = "/";
                Response.Cookies["Able2"].Value = resource[resource2];
                //Response.Cookies["Able2"].Path = "/";
                //将所有矿物、矿场数量赋值0并存入cookie
                //-----------------------矿物总值-----------------------
                Response.Cookies["al_r_num"].Value = "0";
                Response.Cookies["fe_r_num"].Value = "0";
                Response.Cookies["cu_r_num"].Value = "0";
                Response.Cookies["pb_r_num"].Value = "0";
                Response.Cookies["sn_r_num"].Value = "0";
                Response.Cookies["ti_r_num"].Value = "0";
                Response.Cookies["cr_r_num"].Value = "0";
                Response.Cookies["ni_r_num"].Value = "0";
                //---------------------矿物变动值-----------------------
                Response.Cookies["al_r_num_"].Value = "0";
                Response.Cookies["fe_r_num_"].Value = "0";
                Response.Cookies["cu_r_num_"].Value = "0";
                Response.Cookies["pb_r_num_"].Value = "0";
                Response.Cookies["sn_r_num_"].Value = "0";
                Response.Cookies["ti_r_num_"].Value = "0";
                Response.Cookies["cr_r_num_"].Value = "0";
                Response.Cookies["ni_r_num_"].Value = "0";
                //--------------------矿场总值------------------------
                Response.Cookies["al_b_num"].Value = "0";
                Response.Cookies["fe_b_num"].Value = "0";
                Response.Cookies["cu_b_num"].Value = "0";
                Response.Cookies["pb_b_num"].Value = "0";
                Response.Cookies["sn_b_num"].Value = "0";
                Response.Cookies["ti_b_num"].Value = "0";
                Response.Cookies["cr_b_num"].Value = "0";
                Response.Cookies["ni_b_num"].Value = "0";
                //将所有矿物、矿场数量赋值0并存入数据库
                sqlconn.InsertResourceSignup(ID, 0, 0, 0, 0, 0, 0, 0, 0);
                sqlconn.InsertBuildingSignup(ID, 0, 0, 0, 0, 0, 0, 0, 0);
                //将PlayerID存入cookie
                Response.Cookies["player_id"].Value = Convert.ToString(ID);
                //跳转到游戏页面
                Response.Redirect("../Game/Resource/ResourceAl.aspx");
            }
        }
    }
}