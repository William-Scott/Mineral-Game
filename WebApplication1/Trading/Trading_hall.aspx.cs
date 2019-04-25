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
    public partial class WebForm1 : System.Web.UI.Page
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

        protected void Bt_Buy_Confirm_Click(object sender, EventArgs e)
        {
            //"想买"分栏下的"1、需要"矿物代号
            string option11 = opt11.Items[opt11.SelectedIndex].Value;
            //"想买"分栏下的"1、需要"矿物数量
            int num11 = Convert.ToInt32(this.BuyNeed.Text);
            //"想买"分栏下的"2、提供"矿物代号
            string option12 = opt12.Items[opt12.SelectedIndex].Value;
            //"想买"分栏下的"2、提供"矿物数量
            int num12 = Convert.ToInt32(this.BuyProvide.Text);
            //验证玩家数据库中是否有足够的矿物
            HttpCookie player_id_cookie = Request.Cookies["player_id"];
            int player_id = Convert.ToInt32(player_id_cookie.Value.ToString());
            Sqlconn sqlconn = new Sqlconn();
            DataTable num = sqlconn.SelectResourceTrading(player_id, option12);
            if (Convert.ToInt32(num.Rows[0][0].ToString()) >= num12)
            {
                //将数据添加到数据库
                Class1 myclass = new Class1();
                string resource_buy_need = myclass.Dictionary(option11);
                string resource_buy_provide = myclass.Dictionary(option12);
                sqlconn.InsertTrading(player_id, 1, resource_buy_need, num11, resource_buy_provide, num12);
                //修改用户资源数据库中相应数值
                int num_new = Convert.ToInt32(num.Rows[0][0].ToString()) - num12;
                sqlconn.UpdateResourceTrading(player_id, option12, num_new);
                //刷新GridView
                GridView1.DataBind();
            }
            else {
                Response.Write("<script>alert('矿物储量不足！')</script>");
            }

        }

        protected void Bt_Sell_Confirm_Click(object sender, EventArgs e)
        {
            //"想卖"分栏下的"1、提供"矿物代号
            string option21 = opt21.Items[opt21.SelectedIndex].Value;
            //"想卖"分栏下的"1、提供"矿物数量
            int num21 = Convert.ToInt32(this.SellProvide.Text);
            //"想卖"分栏下的"2、需要"矿物代号
            string option22 = opt22.Items[opt22.SelectedIndex].Value;
            //"想卖"分栏下的"2、需要"矿物代号
            int num22 = Convert.ToInt32(this.SellNeed.Text);
            //验证玩家数据库中是否有足够的矿物
            HttpCookie player_id_cookie = Request.Cookies["player_id"];
            int player_id = Convert.ToInt32(player_id_cookie.Value.ToString());
            Sqlconn sqlconn = new Sqlconn();
            DataTable num = sqlconn.SelectResourceTrading(player_id, option21);
            if (Convert.ToInt32(num.Rows[0][0].ToString()) >= num21)
            {
                //将数据添加到数据库
                Class1 myclass = new Class1();
                string resource_buy_provide = myclass.Dictionary(option21);
                string resource_buy_need = myclass.Dictionary(option22);
                sqlconn.InsertTrading(player_id, 0, resource_buy_provide, num21, resource_buy_need, num22);
                //修改用户资源数据库中相应数值
                int num_new = Convert.ToInt32(num.Rows[0][0].ToString()) - num21;
                sqlconn.UpdateResourceTrading(player_id, option21, num_new);
                //刷新GridView
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script>alert('矿物储量不足！')</script>");
            }
        }

        protected void GridView1_RowCommand_Buy(object sender, GridViewCommandEventArgs e)
        {//想要买，意思是显示的是别人（你）要买第一格的东西，第二格是提出的价格
         //接订单的人（我）需要付出第一格的东西，来获得第二格的东西
         //订单被接后，接订单的人（我）-第一格的东西，+第二格的东西，别人（你）+第一格的东西
            if (e.CommandName == "getRow")
            {
                string goodsfir = GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text;
                int numfir = Convert.ToInt32(GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text);
                string goodssec = GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text;
                int numsec = Convert.ToInt32(GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text);
                //Response.Write("用"+ numfir + "个"+ goodsfir + "换"+ numsec + "个"+ goodssec);
                //判断用户资源是否足够
                HttpCookie player_id_cookie = Request.Cookies["player_id"];
                int player_id1 = Convert.ToInt32(player_id_cookie.Value.ToString());
                Sqlconn sqlconn = new Sqlconn();
                Class1 myclass = new Class1();
                string goodsfir_ = myclass.Dictionary_(goodsfir);
                string goodssec_ = myclass.Dictionary_(goodssec);
                int num_ = Convert.ToInt32(GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);//订单号
                DataTable num1fir = sqlconn.SelectResourceTrading(player_id1, goodsfir_);//第一格里的东西在 我 的资源数据库里的数量
                DataTable num1sec = sqlconn.SelectResourceTrading(player_id1, goodssec_);//第二格里的东西在 我 的资源数据库里的数量
                DataTable num2fir = sqlconn.SelectResourceTrading(Convert.ToInt32(sqlconn.SelectIdTrading(num_).Rows[0][0].ToString()), goodsfir_);//第一格里的东西在 你 的资源数据库里的数量
                if (Convert.ToInt32(num1fir.Rows[0][0].ToString()) >= numfir) {
                    //改变用户资源数据库相应矿物数量
                    int num_new1fir = Convert.ToInt32(num1fir.Rows[0][0].ToString()) - numfir;//新的第一格里的东西在 我 的资源数据库里的数量
                    int num_new1sec = Convert.ToInt32(num1sec.Rows[0][0].ToString()) + numsec;//新的第二格里的东西在 我 的资源数据库里的数量
                    int num_new2fir = Convert.ToInt32(num2fir.Rows[0][0].ToString()) + numfir;//新的第一格里的东西在 你 的资源数据库里的数量
                    sqlconn.UpdateResourceTrading(player_id1, goodsfir_, num_new1fir);
                    sqlconn.UpdateResourceTrading(player_id1, goodssec_, num_new1sec);
                    sqlconn.UpdateResourceTrading(Convert.ToInt32(sqlconn.SelectIdTrading(num_).Rows[0][0].ToString()), goodsfir_, num_new2fir);
                    //删除相应行的数据库数据
                    sqlconn.DeleteTrading(num_);
                    //刷新GridView
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('矿物储量不足！')</script>");
                }
            }
        }

        protected void GridView2_RowCommand_Sell(object sender, GridViewCommandEventArgs e)
        {//想要卖，意思是显示的是别人（你）要卖第一格的东西，第二格是提出的价格
         //接订单的人（我）需要付出第二格的东西，来获得第一格的东西
         //订单被接后，接订单的人（我）-第二格的东西，+第一格的东西，别人（你）+第二格的东西
            if (e.CommandName == "getRow")
            {
                string goodsfir = GridView2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text;
                int numfir = Convert.ToInt32(GridView2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text);
                string goodssec = GridView2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text;
                int numsec = Convert.ToInt32(GridView2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text);
                //Response.Write("用" + numfir + "个" + goodsfir + "换" + numsec + "个" + goodssec);
                //判断用户资源是否足够
                HttpCookie player_id_cookie = Request.Cookies["player_id"];
                int player_id1 = Convert.ToInt32(player_id_cookie.Value.ToString());
                Sqlconn sqlconn = new Sqlconn();
                Class1 myclass = new Class1();
                string goodsfir_ = myclass.Dictionary_(goodsfir);
                string goodssec_ = myclass.Dictionary_(goodssec);
                int num_ = Convert.ToInt32(GridView2.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);//订单号
                DataTable num1fir = sqlconn.SelectResourceTrading(player_id1, goodsfir_);//第一格里的东西在 我 的资源数据库里的数量
                DataTable num1sec = sqlconn.SelectResourceTrading(player_id1, goodssec_);//第二格里的东西在 我 的资源数据库里的数量
                DataTable num2sec = sqlconn.SelectResourceTrading(Convert.ToInt32(sqlconn.SelectIdTrading(num_).Rows[0][0].ToString()), goodssec_);//第二格里的东西在 你 的资源数据库里的数量
                if (Convert.ToInt32(num1sec.Rows[0][0].ToString()) >= numsec) {
                    //改变用户资源数据库相应矿物数量
                    int num_new1fir = Convert.ToInt32(num1fir.Rows[0][0].ToString()) + numfir;//新的第一格里的东西在 我 的资源数据库里的数量
                    int num_new1sec= Convert.ToInt32(num1sec.Rows[0][0].ToString()) - numsec;//新的第二格里的东西在 我 的资源数据库里的数量
                    int num_new2sec = Convert.ToInt32(num2sec.Rows[0][0].ToString()) + numsec;//新的第二格里的东西在 你 的资源数据库里的数量
                    sqlconn.UpdateResourceTrading(player_id1, goodsfir_, num_new1fir);
                    sqlconn.UpdateResourceTrading(player_id1, goodssec_, num_new1sec);
                    sqlconn.UpdateResourceTrading(Convert.ToInt32(sqlconn.SelectIdTrading(num_).Rows[0][0].ToString()), goodssec_, num_new2sec);
                    //删除相应行的数据库数据
                    sqlconn.DeleteTrading(num_);
                    //刷新GridView
                    GridView2.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('矿物储量不足！')</script>");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //刷新GridView
            GridView2.DataBind();
            GridView1.DataBind();
        }
    }
}