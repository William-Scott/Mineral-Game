using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;



namespace WebApplication1
{
    public class Sqlconn
    {//登录时、注册时从数据库中取用户名
        public DataTable SelectAccount(string account) {
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            SqlDataAdapter da = new SqlDataAdapter("select PlayerName from Player_info where PlayerName='"+ account + "'", strConn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //sqlConn.Close();
            return dt;
        }

        public DataTable SelectPassword(string account,string password)
        {//登录时从数据库中取密码
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            SqlDataAdapter da = new SqlDataAdapter("select * from Player_info where PlayerName='"+account+"'and PlayerPassword='"+password+"'", strConn);
            DataTable dt = new DataTable();
            da.Fill(dt);
           // sqlConn.Close();
            return dt;
        }

        public void InsertPlayerInfo(string account,string password,int id,string able1,string able2)
        {//注册时把用户名密码等数据放入数据库
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            sqlConn.Open();
            SqlCommand ins = new SqlCommand("INSERT INTO Player_info (PlayerName,PlayerPassword,PlayerID,Able1,Able2) VALUES ('" + account+"','"+password+"','"+id+ "','" + able1 + "','" + able2 + "');", sqlConn);
            ins.ExecuteNonQuery();
            sqlConn.Close();
        }

        public DataTable SelectId(string account)
        {//通过用户名查找用户id
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            SqlDataAdapter da = new SqlDataAdapter("select PlayerID from Player_info where PlayerName='" + account + "';", strConn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            // sqlConn.Close();
            return dt;
        }

        public DataTable SelectAble(int id)
        {//通过用户id查找用户可生产的矿物名
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            SqlDataAdapter da = new SqlDataAdapter("select Able1,Able2 from Player_info where PlayerID='" + id + "';", strConn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            // sqlConn.Close();
            return dt;
        }
        
        public void InsertResourceSignup(int id,int al,int fe,int cu,int pb,int sn,int ti,int cr,int ni)
        {//注册时初始化cookie中的资源信息
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;User ID=William Scott;Initial Catalog=Player_info;Data Source=零号机";
            SqlConnection sqlConn = new SqlConnection(strConn);
            sqlConn.Open();
            SqlCommand ins = new SqlCommand("INSERT INTO Player_Resource (PlayerID,Al,Fe,Cu,Pb,Sn,Ti,Cr,Ni)VALUES ("+id+","+al+","+fe+","+cu+","+pb+","+sn+","+ti+","+cr+","+ni+");", sqlConn);
            ins.ExecuteNonQuery();
            sqlConn.Close();
        }

        public void InsertBuildingSignup(int id, int al, int fe, int cu, int pb, int sn, int ti, int cr, int ni)
        {//注册时初始化cookie中的建筑信息
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;User ID=William Scott;Initial Catalog=Player_info;Data Source=零号机";
            SqlConnection sqlConn = new SqlConnection(strConn);
            sqlConn.Open();
            SqlCommand ins = new SqlCommand("INSERT INTO Player_Building (PlayerID,Al,Fe,Cu,Pb,Sn,Ti,Cr,Ni)VALUES (" + id + "," + al + "," + fe + "," + cu + "," + pb + "," + sn + "," + ti + "," + cr + "," + ni + ");", sqlConn);
            ins.ExecuteNonQuery();
            sqlConn.Close();
        }

        public DataTable SelectResourceSignin(int id)
        {//登录时将数据库中的资源信息保存到cookie
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            SqlDataAdapter da = new SqlDataAdapter("select Al,Fe,Cu,Pb,Sn,Ti,Cr,Ni from Player_Resource where PlayerID="+id+";", strConn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            // sqlConn.Close();
            return dt;
        }

        public DataTable SelectBuildingSignin(int id)
        {//登录时将数据库中的建筑信息保存到cookie
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            SqlDataAdapter da = new SqlDataAdapter("select Al,Fe,Cu,Pb,Sn,Ti,Cr,Ni from Player_Building where PlayerID=" + id + ";", strConn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            // sqlConn.Close();
            return dt;
        }

        public void UpdateResourceSignup(int id, int al, int fe, int cu, int pb, int sn, int ti, int cr, int ni)
        {//切换页面时将cookie中的资源信息覆盖到数据库
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;User ID=William Scott;Initial Catalog=Player_info;Data Source=零号机";
            SqlConnection sqlConn = new SqlConnection(strConn);
            sqlConn.Open();
            SqlCommand ins = new SqlCommand("UPDATE Player_Resource SET Al=" + al + ",Fe=" + fe + ",Cu=" + cu + ",Pb=" + pb + ",Sn=" + sn + ",Ti=" + ti + ",Cr=" + cr + ",Ni=" + ni + " WHERE PlayerID=" + id + ";", sqlConn);
            ins.ExecuteNonQuery();
            sqlConn.Close();
        }

        public void UpdateBuildingSignup(int id, int al, int fe, int cu, int pb, int sn, int ti, int cr, int ni)
        {//切换页面时将cookie中的建筑信息覆盖到数据库
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;User ID=William Scott;Initial Catalog=Player_info;Data Source=零号机";
            SqlConnection sqlConn = new SqlConnection(strConn);
            sqlConn.Open();
            SqlCommand ins = new SqlCommand("UPDATE Player_Building SET Al=" + al + ",Fe=" + fe + ",Cu=" + cu + ",Pb=" + pb + ",Sn=" + sn + ",Ti=" + ti + ",Cr=" + cr + ",Ni=" + ni + " WHERE PlayerID=" + id + ";", sqlConn);
            ins.ExecuteNonQuery();
            sqlConn.Close();
        }
        
        public DataTable SelectResourceTrading(int id,string resource)
        {//从用户资源数据库中通过id查找用户相应的资源数量
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            SqlDataAdapter da = new SqlDataAdapter("select "+ resource + " from Player_Resource where PlayerID="+id+";", strConn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            // sqlConn.Close();
            return dt;
        }

        public void InsertTrading(int id, int bs, string resource1, int num1, string resource2, int num2)
        {//将新建的订单信息插入到交易所数据库
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            sqlConn.Open();
            SqlCommand ins = new SqlCommand("INSERT INTO Trading_hall (PlayerID,BS,GoodsFir,NumFir,GoodsSec,NumSec) VALUES ("+id+","+bs+",'"+ resource1 + "',"+ num1 + ",'"+ resource2 + "',"+ num2 + ");", sqlConn);
            ins.ExecuteNonQuery();
            sqlConn.Close();
        }

        public void UpdateResourceTrading(int id, string resource, int num)
        {//用户提交新订单后更新相应的用户资源数据库
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;User ID=William Scott;Initial Catalog=Player_info;Data Source=零号机";
            SqlConnection sqlConn = new SqlConnection(strConn);
            sqlConn.Open();
            SqlCommand ins = new SqlCommand("UPDATE Player_Resource SET "+ resource + "="+ num + " WHERE PlayerID="+id+";", sqlConn);
            ins.ExecuteNonQuery();
            sqlConn.Close();
        }

        public void DeleteTrading(int num)
        {//删除交易所数据库中的订单
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            sqlConn.Open();
            SqlCommand ins = new SqlCommand("DELETE FROM Trading_hall WHERE Num="+ num + ";", sqlConn);
            ins.ExecuteNonQuery();
            sqlConn.Close();
        }

        public DataTable SelectIdTrading(int num)
        {//通过订单编号查找此订单的用户信息
            string strConn = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=Player_info;Data Source=(local)";
            SqlConnection sqlConn = new SqlConnection(strConn);
            SqlDataAdapter da = new SqlDataAdapter("select PlayerID from Trading_hall where Num="+num+";", strConn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            // sqlConn.Close();
            return dt;
        }

    }
}