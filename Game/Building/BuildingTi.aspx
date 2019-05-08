<%@ Page Title="" Language="C#" MasterPageFile="~/Game/Building/Building.Master" AutoEventWireup="true" CodeBehind="BuildingTi.aspx.cs" Inherits="WebApplication1.Game.Building.BuildingTi" %>
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
					<a href="BuildingTi.aspx">钛矿场</a>
				</li>
                            <!--<li>
							    <a href="Resource_unable.aspx">钛矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">钛矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">钛矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">铬矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">钛矿场</a>
						    </li>-->
			</ul>
		</div>
		<div class="span10">
			<h3>
				钛矿场
			</h3>
			<p><em>钛矿场可以自动生产钛矿，建造需求：铝矿 * 500，铁矿*100，铬矿*50，镍矿*50，铜矿*50</em></p>
            <br/>
            <br/><p id ="num1">你目前拥有0个钛矿场</p><br/>
			<p id="num2">你目前20每秒生产0个钛矿</p> 
            <button id = "click" class="btn" type="button" onclick ="produce_ti_b()">点击建造钛矿场</button>
            <p><br/><br/></p>
            <p id="warting"></p>
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
    cr_r = new KuangWu("Cr", 0, 1000);
    ni_r = new KuangWu("Ni", 0, 1000);
    cu_r = new KuangWu("Cu", 0, 1000);
    ti_r = new KuangWu("Ti", 0, 1000);

    ti_b = new KuangChang("Ti", 0);

    al_r.num = getCookie("al_r_num");
    fe_r.num = getCookie("fe_r_num");
    cr_r.num = getCookie("cr_r_num");
    ni_r.num = getCookie("ni_r_num");
    cu_r.num = getCookie("cu_r_num");
    ti_r.num = getCookie("ti_r_num");

    ti_b.num = getCookie("ti_b_num");

    var al_r_num_ = 0;
    var fe_r_num_ = 0;
    var ni_r_num_ = 0;
    var cu_r_num_ = 0;
    var ti_r_num_ = 0;
    document.getElementById("num1").innerHTML = "你目前拥有" + ti_b.num + "个钛矿场";
    document.getElementById("num2").innerHTML = "你目前20每秒生产" + ti_b.num + "个钛矿";
        /*function checkCookie() {
            al_r.num = getCookie("al_r_num");
            al_b.num = getCookie("al_b_num");
            document.getElementById("num1").innerHTML = "你目前拥有" + al_b.num + "个铝矿场";
            document.getElementById("num2").innerHTML = "你目前10每秒生产" + al_b.num + "个铝矿";
        }*/
        function produce_ti_b() {
            if (al_r.num >= 500 && fe_r.num >= 100 && cr_r.num >= 50 && ni_r.num >= 50 && cu_r.num >= 50) {
                ti_b.num++;
                document.cookie = "ti_b_num="+ti_b.num+";path=/";
                al_r.num = al_r.num - 500;
                fe_r.num = fe_r.num - 100;
                cr_r.num = cr_r.num - 50;
                ni_r.num = ni_r.num - 50;
                cu_r.num = cu_r.num - 50;
                document.cookie = "al_r_num=" + al_r.num + ";path=/";
                document.cookie = "fe_r_num=" + fe_r.num + ";path=/";
                document.cookie = "cr_r_num=" + cr_r.num + ";path=/";
                document.cookie = "ni_r_num=" + ni_r.num + ";path=/";
                document.cookie = "cu_r_num=" + cu_r.num + ";path=/";
                al_r_num_ = al_r_num_ - 500;
                fe_r_num_ = fe_r_num_ - 100;
                cr_r_num_ = cr_r_num_ - 50;
                ni_r_num_ = ni_r_num_ - 50;
                cu_r_num_ = cu_r_num_ - 50;
                document.cookie = "al_r_num_=" + al_r_num_ + ";path=/";
                document.cookie = "fe_r_num_=" + fe_r_num_ + ";path=/";
                document.cookie = "cr_r_num_=" + cr_r_num_ + ";path=/";
                document.cookie = "ni_r_num_=" + ni_r_num_ + ";path=/";
                document.cookie = "cu_r_num_="+cu_r_num_+";path=/";
                document.getElementById("num1").innerHTML = "你目前拥有" + ti_b.num + "个钛矿场";
                document.getElementById("num2").innerHTML = "你目前20每秒生产" + ti_b.num + "个钛矿";
                document.getElementById("warting").innerHTML = "";
            } else {
                document.getElementById("warting").innerHTML = "矿物储量不足";
            }
        }
    //动态生成第一个导航栏
    var able = new Array();
    able[0] = getCookie_w("Able1");
    able[1] = getCookie_w("Able2");
    for (var i = 0; i < 2; i++) {
        if (able[i] != "Ti") {
            var li1 = document.createElement('li');
            var profileLink1 = '<a href="Building' + able[i] + '.aspx">' + dictionary_b(able[i]) + '</a>';
            li1.innerHTML = profileLink1;
            document.getElementById("ul").appendChild(li1);
        }
    }
        
</script>
</asp:Content>
