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
    public partial class Resource : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //每次点击母版页导航栏时调用，将矿物矿场cookie值保存到数据库
            //为了不弄混，决定手动赋值
            HttpCookie player_id_cookie = Request.Cookies["player_id"];
            int player_id = Convert.ToInt32(player_id_cookie.Value.ToString());
            Sqlconn sqlconn = new Sqlconn();
            DataTable resource = sqlconn.SelectResourceSignin(player_id);
            //-----------------------矿物总值----------------------------------
            /*HttpCookie al_r_cookie = Request.Cookies["al_r_num"];
            HttpCookie fe_r_cookie = Request.Cookies["fe_r_num"];
            HttpCookie cu_r_cookie = Request.Cookies["cu_r_num"];
            HttpCookie pb_r_cookie = Request.Cookies["pb_r_num"];
            HttpCookie sn_r_cookie = Request.Cookies["sn_r_num"];
            HttpCookie ti_r_cookie = Request.Cookies["ti_r_num"];
            HttpCookie cr_r_cookie = Request.Cookies["cr_r_num"];
            HttpCookie ni_r_cookie = Request.Cookies["ni_r_num"];*/
            //---------------------------矿物变动值-------------------------------
            HttpCookie al_r_cookie_ = Request.Cookies["al_r_num_"];
            HttpCookie fe_r_cookie_ = Request.Cookies["fe_r_num_"];
            HttpCookie cu_r_cookie_ = Request.Cookies["cu_r_num_"];
            HttpCookie pb_r_cookie_ = Request.Cookies["pb_r_num_"];
            HttpCookie sn_r_cookie_ = Request.Cookies["sn_r_num_"];
            HttpCookie ti_r_cookie_ = Request.Cookies["ti_r_num_"];
            HttpCookie cr_r_cookie_ = Request.Cookies["cr_r_num_"];
            HttpCookie ni_r_cookie_ = Request.Cookies["ni_r_num_"];
            //------------------------矿场总值----------------------------------
            HttpCookie al_b_cookie = Request.Cookies["al_b_num"];
            HttpCookie fe_b_cookie = Request.Cookies["fe_b_num"];
            HttpCookie cu_b_cookie = Request.Cookies["cu_b_num"];
            HttpCookie pb_b_cookie = Request.Cookies["pb_b_num"];
            HttpCookie sn_b_cookie = Request.Cookies["sn_b_num"];
            HttpCookie ti_b_cookie = Request.Cookies["ti_b_num"];
            HttpCookie cr_b_cookie = Request.Cookies["cr_b_num"];
            HttpCookie ni_b_cookie = Request.Cookies["ni_b_num"];
            //------------------------矿物总值-----------------------------------
            int al_r_num = Convert.ToInt32(resource.Rows[0][0].ToString());
            int fe_r_num = Convert.ToInt32(resource.Rows[0][1].ToString());
            int cu_r_num = Convert.ToInt32(resource.Rows[0][2].ToString());
            int pb_r_num = Convert.ToInt32(resource.Rows[0][3].ToString());
            int sn_r_num = Convert.ToInt32(resource.Rows[0][4].ToString());
            int ti_r_num = Convert.ToInt32(resource.Rows[0][5].ToString());
            int cr_r_num = Convert.ToInt32(resource.Rows[0][6].ToString());
            int ni_r_num = Convert.ToInt32(resource.Rows[0][7].ToString());
            //---------------------------矿物变动值-------------------------------
            int al_r_num_ = Convert.ToInt32(al_r_cookie_.Value.ToString());
            int fe_r_num_ = Convert.ToInt32(fe_r_cookie_.Value.ToString());
            int cu_r_num_ = Convert.ToInt32(cu_r_cookie_.Value.ToString());
            int pb_r_num_ = Convert.ToInt32(pb_r_cookie_.Value.ToString());
            int sn_r_num_ = Convert.ToInt32(sn_r_cookie_.Value.ToString());
            int ti_r_num_ = Convert.ToInt32(ti_r_cookie_.Value.ToString());
            int cr_r_num_ = Convert.ToInt32(cr_r_cookie_.Value.ToString());
            int ni_r_num_ = Convert.ToInt32(ni_r_cookie_.Value.ToString());
            //---------------------------矿物终值-------------------------------
            int al_r_num_new = al_r_num + al_r_num_;
            int fe_r_num_new = fe_r_num + fe_r_num_;
            int cu_r_num_new = cu_r_num + cu_r_num_;
            int pb_r_num_new = pb_r_num + pb_r_num_;
            int sn_r_num_new = sn_r_num + sn_r_num_;
            int ti_r_num_new = ti_r_num + ti_r_num_;
            int cr_r_num_new = cr_r_num + cr_r_num_;
            int ni_r_num_new = ni_r_num + ni_r_num_;
            //-------------------------矿场终值--------------------------------------
            int al_b_num = Convert.ToInt32(al_b_cookie.Value.ToString());
            int fe_b_num = Convert.ToInt32(fe_b_cookie.Value.ToString());
            int cu_b_num = Convert.ToInt32(cu_b_cookie.Value.ToString());
            int pb_b_num = Convert.ToInt32(pb_b_cookie.Value.ToString());
            int sn_b_num = Convert.ToInt32(sn_b_cookie.Value.ToString());
            int ti_b_num = Convert.ToInt32(ti_b_cookie.Value.ToString());
            int cr_b_num = Convert.ToInt32(cr_b_cookie.Value.ToString());
            int ni_b_num = Convert.ToInt32(ni_b_cookie.Value.ToString());
            //--------------------------更新数据库---------------------------
            sqlconn.UpdateResourceSignup(player_id, al_r_num_new, fe_r_num_new, cu_r_num_new, pb_r_num_new, sn_r_num_new, ti_r_num_new, cr_r_num_new, ni_r_num_new);
            //-----------------------更新cookie-----------------------------------
            Response.Cookies["al_r_num_"].Value = "0";
            Response.Cookies["fe_r_num_"].Value = "0";
            Response.Cookies["cu_r_num_"].Value = "0";
            Response.Cookies["pb_r_num_"].Value = "0";
            Response.Cookies["sn_r_num_"].Value = "0";
            Response.Cookies["ti_r_num_"].Value = "0";
            Response.Cookies["cr_r_num_"].Value = "0";
            Response.Cookies["ni_r_num_"].Value = "0";
            //---------------------------------------------------------------------
            Response.Cookies["al_r_num"].Value = Convert.ToString(al_r_num_new);
            Response.Cookies["fe_r_num"].Value = Convert.ToString(fe_r_num_new);
            Response.Cookies["cu_r_num"].Value = Convert.ToString(cu_r_num_new);
            Response.Cookies["pb_r_num"].Value = Convert.ToString(pb_r_num_new);
            Response.Cookies["sn_r_num"].Value = Convert.ToString(sn_r_num_new);
            Response.Cookies["ti_r_num"].Value = Convert.ToString(ti_r_num_new);
            Response.Cookies["cr_r_num"].Value = Convert.ToString(cr_r_num_new);
            Response.Cookies["ni_r_num"].Value = Convert.ToString(ni_r_num_new);
            //-------------------------更新数据库------------------------------------------
            sqlconn.UpdateBuildingSignup(player_id, al_b_num, fe_b_num, cu_b_num, pb_b_num, sn_b_num, ti_b_num, cr_b_num, ni_b_num);
            //Response.Write(" 铝矿的数量为: " + al_r_num + " <br >");
            //Response.Write(" 铝矿场的数量为: " + al_b_num + " <br >");
        }

        /*protected void Function1(object sender, EventArgs e) {
            //每次点击母版页导航栏时调用，将矿物矿场cookie值保存
            //为了不弄混，决定手动赋值
            //此函数只会在跳转本身页面的时候执行，跳转到其他页面的时候根本就不执行
            //所以根本没用
            HttpCookie al_r_cookie = Request.Cookies["al_r_num"];
            HttpCookie fe_r_cookie = Request.Cookies["fe_r_num"];
            HttpCookie cu_r_cookie = Request.Cookies["cu_r_num"];
            HttpCookie pb_r_cookie = Request.Cookies["pb_r_num"];
            HttpCookie sn_r_cookie = Request.Cookies["sn_r_num"];
            HttpCookie ti_r_cookie = Request.Cookies["ti_r_num"];
            HttpCookie cr_r_cookie = Request.Cookies["cr_r_num"];
            HttpCookie ni_r_cookie = Request.Cookies["ni_r_num"];
            //----------------------------------------------------------
            HttpCookie al_b_cookie = Request.Cookies["al_b_num"];
            HttpCookie fe_b_cookie = Request.Cookies["fe_b_num"];
            HttpCookie cu_b_cookie = Request.Cookies["cu_b_num"];
            HttpCookie pb_b_cookie = Request.Cookies["pb_b_num"];
            HttpCookie sn_b_cookie = Request.Cookies["sn_b_num"];
            HttpCookie ti_b_cookie = Request.Cookies["ti_b_num"];
            HttpCookie cr_b_cookie = Request.Cookies["cr_b_num"];
            HttpCookie ni_b_cookie = Request.Cookies["ni_b_num"];
            //-----------------------------------------------------------
            int al_r_num = Convert.ToInt32(al_r_cookie.Value.ToString());
            int fe_r_num = Convert.ToInt32(fe_r_cookie.Value.ToString());
            int cu_r_num = Convert.ToInt32(cu_r_cookie.Value.ToString());
            int pb_r_num = Convert.ToInt32(pb_r_cookie.Value.ToString());
            int sn_r_num = Convert.ToInt32(sn_r_cookie.Value.ToString());
            int ti_r_num = Convert.ToInt32(ti_r_cookie.Value.ToString());
            int cr_r_num = Convert.ToInt32(cr_r_cookie.Value.ToString());
            int ni_r_num = Convert.ToInt32(ni_r_cookie.Value.ToString());
            //---------------------------------------------------------------
            int al_b_num = Convert.ToInt32(al_b_cookie.Value.ToString());
            int fe_b_num = Convert.ToInt32(fe_b_cookie.Value.ToString());
            int cu_b_num = Convert.ToInt32(cu_b_cookie.Value.ToString());
            int pb_b_num = Convert.ToInt32(pb_b_cookie.Value.ToString());
            int sn_b_num = Convert.ToInt32(sn_b_cookie.Value.ToString());
            int ti_b_num = Convert.ToInt32(ti_b_cookie.Value.ToString());
            int cr_b_num = Convert.ToInt32(cr_b_cookie.Value.ToString());
            int ni_b_num = Convert.ToInt32(ni_b_cookie.Value.ToString());
            //----------------------------------------------------------------
            HttpCookie player_id_cookie = Request.Cookies["player_id"];
            int player_id= Convert.ToInt32(player_id_cookie.Value.ToString());
            Sqlconn sqlconn = new Sqlconn();
            sqlconn.UpdateResourceSignup(player_id, al_r_num, fe_r_num, cu_r_num, pb_r_num, sn_r_num, ti_r_num, cr_r_num, ni_r_num);
            sqlconn.UpdateBuildingSignup(player_id, al_b_num, fe_b_num, cu_b_num, pb_b_num, sn_b_num, ti_b_num, cr_b_num, ni_b_num);
            //Response.Write(" 铝矿的数量为: " + al_r_num + " <br >");
            //Response.Write(" 铝矿场的数量为: " + al_b_num + " <br >");
        }*/
    }
}