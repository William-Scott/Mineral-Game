<%@ Page Title="" Language="C#" MasterPageFile="~/Game/Building/Building.Master" AutoEventWireup="true" CodeBehind="BuildingCu.aspx.cs" Inherits="WebApplication1.Game.Building.BuildingCu" %>
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
					<a href="BuildingCu.aspx">铜矿场</a>
				</li>
                            <!--<li>
							    <a href="Resource_unable.aspx">铅矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">锡矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">钛矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">铬矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">镍矿场</a>
						    </li>-->
			</ul>
		</div>
		<div class="span10">
			<h3>
				铜矿场
			</h3>
			<p><em>铜矿场可以自动生产铜矿，建造需求：铝矿 * 500，铁矿*100，铅矿*50，锡矿*50，钛矿*50</em></p>
            <br/>
            <br/><p id ="num1">你目前拥有0个铜矿场</p><br/>
			<p id="num2">你目前20每秒生产0个铜矿</p> 
            <button id = "click" class="btn" type="button" onclick ="produce_cu_b()">点击建造铜矿场</button>
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
    pb_r = new KuangWu("Pb", 0, 1000);
    sn_r = new KuangWu("Sn", 0, 1000);
    ti_r = new KuangWu("Ti", 0, 1000);
    cu_r = new KuangWu("Cu", 0, 1000);

    cu_b = new KuangChang("Al", 0);

    al_r.num = getCookie("al_r_num");
    fe_r.num = getCookie("fe_r_num");
    pb_r.num = getCookie("pb_r_num");
    sn_r.num = getCookie("sn_r_num");
    ti_r.num = getCookie("ti_r_num");
    cu_r.num = getCookie("cu_r_num");

    cu_b.num = getCookie("cu_b_num");
    document.getElementById("num1").innerHTML = "你目前拥有" + cu_b.num + "个铜矿场";
    document.getElementById("num2").innerHTML = "你目前20每秒生产" + cu_b.num + "个铜矿";
        /*function checkCookie() {
            al_r.num = getCookie("al_r_num");
            al_b.num = getCookie("al_b_num");
            document.getElementById("num1").innerHTML = "你目前拥有" + al_b.num + "个铝矿场";
            document.getElementById("num2").innerHTML = "你目前10每秒生产" + al_b.num + "个铝矿";
        }*/
        function produce_cu_b() {
            if (al_r.num >= 500 && fe_r.num >= 100 && pb_r.num >= 50 && sn_r.num >= 50 && ti_r.num >= 50) {
                cu_b.num++;
                document.cookie = "cu_b_num="+cu_b.num+";path=/";
                al_r.num = al_r.num - 500;
                fe_r.num = fe_r.num - 100;
                pb_r.num = pb_r.num - 50;
                sn_r.num = sn_r.num - 50;
                ti_r.num = ti_r.num - 50;
                document.cookie = "al_r_num=" + al_r.num + ";path=/";
                document.cookie = "fe_r_num=" + fe_r.num + ";path=/";
                document.cookie = "pb_r_num=" + pb_r.num + ";path=/";
                document.cookie = "sn_r_num=" + sn_r.num + ";path=/";
                document.cookie = "ti_r_num="+ti_r.num+";path=/";
                document.getElementById("num1").innerHTML = "你目前拥有" + cu_b.num + "个铜矿场";
                document.getElementById("num2").innerHTML = "你目前20每秒生产" + cu_b.num + "个铜矿";
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
        if (able[i] != "Cu") {
            var li1 = document.createElement('li');
            var profileLink1 = '<a href="Building' + able[i] + '.aspx">' + dictionary_b(able[i]) + '</a>';
            li1.innerHTML = profileLink1;
            document.getElementById("ul").appendChild(li1);
        }
    }
        
</script>
</asp:Content>
