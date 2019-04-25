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
    public partial class Signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Bt_signin_Click(object sender, EventArgs e)
        {
            //按钮被点击
            //读入用户名到Accout
            string Account = this.inputAccount.Text;
            //实例化类
            Sqlconn sqlconn = new Sqlconn();
            //使用数据库查询语句查询库中是否有与Account相同的PlayerName
            DataTable signinDt1 = sqlconn.SelectAccount(Account);
            //if有{读入密码到Password
            if (signinDt1.Rows.Count > 0)
            {
                string Password = this.inputPassword.Text;
                //使用数据库查询语句查询库中PlayerName行对应的Playerpassword是否有与Password相同的
                DataTable signinDt2 = sqlconn.SelectPassword(Account, Password);
                //if有{提示alert（登录成功！）}
                if (signinDt2.Rows.Count > 0)
                {
                    Response.Write("<script>alert('登录成功！')</script>");
                    //将可生产的矿物种类存入cookie
                    DataTable id = sqlconn.SelectId(Account);
                    DataTable able = sqlconn.SelectAble(Convert.ToInt32(id.Rows[0][0].ToString()));
                    Response.Cookies["Able1"].Value = able.Rows[0][0].ToString();
                    //Response.Cookies["Able1"].Path = "/";
                    Response.Cookies["Able2"].Value = able.Rows[0][1].ToString();
                    //Response.Cookies["Able2"].Path = "/";
                    //将数据库中所有矿物、矿场数量存入cookie
                    DataTable resource = sqlconn.SelectResourceSignin(Convert.ToInt32(id.Rows[0][0].ToString()));
                    DataTable building = sqlconn.SelectBuildingSignin(Convert.ToInt32(id.Rows[0][0].ToString()));
                    //-----------------------矿物总值-----------------------
                    Response.Cookies["al_r_num"].Value = resource.Rows[0][0].ToString();
                    Response.Cookies["fe_r_num"].Value = resource.Rows[0][1].ToString();
                    Response.Cookies["cu_r_num"].Value = resource.Rows[0][2].ToString();
                    Response.Cookies["pb_r_num"].Value = resource.Rows[0][3].ToString();
                    Response.Cookies["sn_r_num"].Value = resource.Rows[0][4].ToString();
                    Response.Cookies["ti_r_num"].Value = resource.Rows[0][5].ToString();
                    Response.Cookies["cr_r_num"].Value = resource.Rows[0][6].ToString();
                    Response.Cookies["ni_r_num"].Value = resource.Rows[0][7].ToString();
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
                    Response.Cookies["al_b_num"].Value = building.Rows[0][0].ToString();
                    Response.Cookies["fe_b_num"].Value = building.Rows[0][1].ToString();
                    Response.Cookies["cu_b_num"].Value = building.Rows[0][2].ToString();
                    Response.Cookies["pb_b_num"].Value = building.Rows[0][3].ToString();
                    Response.Cookies["sn_b_num"].Value = building.Rows[0][4].ToString();
                    Response.Cookies["ti_b_num"].Value = building.Rows[0][5].ToString();
                    Response.Cookies["cr_b_num"].Value = building.Rows[0][6].ToString();
                    Response.Cookies["ni_b_num"].Value = building.Rows[0][7].ToString();
                    //将PlayerID存入cookie
                    Response.Cookies["player_id"].Value = id.Rows[0][0].ToString();
                    //跳转游戏页面
                    Response.Redirect("../Game/Resource/ResourceAl.aspx");
                }
                else
                {
                    Response.Write("<script>alert('密码错误！')</script>");
                }
                //else{提示alert（密码错误！）}}else{提示alert（用户名不存在！）}
            }
            else {
                Response.Write("<script>alert('用户名不存在！')</script>");
            }  
        }
    }
}