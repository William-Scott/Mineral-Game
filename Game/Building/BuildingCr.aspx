<%@ Page Title="" Language="C#" MasterPageFile="~/Game/Building/Building.Master" AutoEventWireup="true" CodeBehind="BuildingCr.aspx.cs" Inherits="WebApplication1.Game.Building.BuildingCr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">    
    <div class="row-fluid">
		<div class="span2">
			<ul id="ul" class="nav nav-stacked nav-pills">
				<li>
					<a href="BuildingAl.aspx">铝矿场</a>
				</li>
				<li>
					<a href="BuildingFe.aspx">铁矿场</a>
				</li>
				<li class="active">
					<a href="BuildingCr.aspx">铬矿场</a>
				</li>
                            <!--<li>
							    <a href="Resource_unable.aspx">铬矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">铬矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">铬矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">铬矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">铬矿场</a>
						    </li>-->
			</ul>
		</div>
		<div class="span10">
			<h3>
				铬矿场
			</h3>
			<p><em>铬矿场可以自动生产铬矿，建造需求：铝矿 * 500，铁矿*100，铅矿*50，镍矿*50，铜矿*50</em></p>
            <br/>
            <br/><p id ="num1">你目前拥有0个铬矿场</p><br/>
			<p id="num2">你目前20每秒生产0个铬矿</p> 
            <button id = "click" class="btn" type="button" onclick ="produce_cr_b()">点击建造铬矿场</button>
            <p><br/><br/></p>
            <p id="warning"></p>
		</div>
	</div>
</div>
<script src="../../kuangwu.js"></script>
<script src="../../kuangchang.js"></script>
<script src="../../cookie.js"></script>
<script src="../../JavaScript.js"></script>
<script>
    al_r = new KuangWu("Al", 0, 1000);
    fe_r = new KuangWu("Fe", 0, 1000);
    ni_r = new KuangWu("Ni", 0, 1000);
    cu_r = new KuangWu("Cu", 0, 1000);
    pb_r = new KuangWu("Pb", 0, 1000);
    cr_r = new KuangWu("Cr", 0, 1000);

    cr_b = new KuangChang("Cr", 0);

    al_r.num = getCookie("al_r_num");
    fe_r.num = getCookie("fe_r_num");
    ni_r.num = getCookie("ni_r_num");
    cu_r.num = getCookie("cu_r_num");
    pb_r.num = getCookie("pb_r_num");
    cr_r.num = getCookie("cr_r_num");

    cr_b.num = getCookie("cr_b_num");

    var al_r_num_ = 0;
    var fe_r_num_ = 0;
    var ni_r_num_ = 0;
    var cu_r_num_ = 0;
    var pb_r_num_ = 0;
    document.getElementById("num1").innerHTML = "你目前拥有" + cr_b.num + "个铬矿场";
    document.getElementById("num2").innerHTML = "你目前20每秒生产" + cr_b.num + "个铬矿";
        /*funccron checkCookie() {
            al_r.num = getCookie("al_r_num");
            al_b.num = getCookie("al_b_num");
            document.getElementById("num1").innerHTML = "你目前拥有" + al_b.num + "个铝矿场";
            document.getElementById("num2").innerHTML = "你目前10每秒生产" + al_b.num + "个铝矿";
        }*/
        function produce_cr_b() {
            if (al_r.num >= 500 && fe_r.num >= 100 && ni_r.num >= 50 && cu_r.num >= 50 && pb_r.num >= 50) {
                cr_b.num++;
                document.cookie = "cr_b_num="+cr_b.num+";path=/";
                al_r.num = al_r.num - 500;
                fe_r.num = fe_r.num - 100;
                ni_r.num = ni_r.num - 50;
                cu_r.num = cu_r.num - 50;
                pb_r.num = pb_r.num - 50;
                document.cookie = "al_r_num=" + al_r.num + ";path=/";
                document.cookie = "fe_r_num=" + fe_r.num + ";path=/";
                document.cookie = "ni_r_num=" + ni_r.num + ";path=/";
                document.cookie = "cu_r_num=" + cu_r.num + ";path=/";
                document.cookie = "pb_r_num=" + pb_r.num + ";path=/";
                al_r_num_ = al_r_num_ - 500;
                fe_r_num_ = fe_r_num_ - 100;
                ni_r_num_ = ni_r_num_ - 50;
                cu_r_num_ = cu_r_num_ - 50;
                pb_r_num_ = pb_r_num_ - 50;
                document.cookie = "al_r_num_=" + al_r_num_ + ";path=/";
                document.cookie = "fe_r_num_=" + fe_r_num_ + ";path=/";
                document.cookie = "ni_r_num_=" + ni_r_num_ + ";path=/";
                document.cookie = "cu_r_num_=" + cu_r_num_ + ";path=/";
                document.cookie = "pb_r_num_="+pb_r_num_+";path=/";
                document.getElementById("num1").innerHTML = "你目前拥有" + cr_b.num + "个铬矿场";
                document.getElementById("num2").innerHTML = "你目前20每秒生产" + cr_b.num + "个铬矿";
                document.getElementById("warning").innerHTML = "";
            } else {
                document.getElementById("warning").innerHTML = "矿物储量不足";
            }
        }
    //动态生成第一个导航栏
    var able = new Array();
    able[0] = getCookie_w("Able1");
    able[1] = getCookie_w("Able2");
    for (var i = 0; i < 2; i++) {
        if (able[i] != "Cr") {
            var li1 = document.createElement('li');
            var profileLink1 = '<a href="Building' + able[i] + '.aspx">' + dictionary_b(able[i]) + '</a>';
            li1.innerHTML = profileLink1;
            document.getElementById("ul").appendChild(li1);
        }
    }
        
</script>
</asp:Content>
