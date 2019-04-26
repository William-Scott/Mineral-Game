<%@ Page Title="" Language="C#" MasterPageFile="~/Game/Building/Building.Master" AutoEventWireup="true" CodeBehind="BuildingNi.aspx.cs" Inherits="WebApplication1.Game.Building.BuildingNi" %>
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
					<a href="BuildingNi.aspx">镍矿场</a>
				</li>
                            <!--<li>
							    <a href="Resource_unable.aspx">镍矿场</a>
						    </li>
                            <li>
							    <a href="Resource_unable.aspx">镍矿场</a>
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
				镍矿场
			</h3>
			<p><em>镍矿场可以自动生产镍矿，建造需求：铝矿 * 500，铁矿*100，铜矿*50，铅矿*50，锡矿*50</em></p>
            <br/>
            <br/><p id ="num1">你目前拥有0个镍矿场</p><br/>
			<p id="num2">你目前20每秒生产0个镍矿</p> 
            <button id = "click" class="btn" type="button" onclick ="produce_ni_b()">点击建造镍矿场</button>
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
    cu_r = new KuangWu("Cu", 0, 1000);
    pb_r = new KuangWu("Pb", 0, 1000);
    sn_r = new KuangWu("Sn", 0, 1000);
    ni_r = new KuangWu("Ni", 0, 1000);

    ni_b = new KuangChang("Ni", 0);

    al_r.num = getCookie("al_r_num");
    fe_r.num = getCookie("fe_r_num");
    cu_r.num = getCookie("cu_r_num");
    pb_r.num = getCookie("pb_r_num");
    sn_r.num = getCookie("sn_r_num");
    ni_r.num = getCookie("ni_r_num");

    ni_b.num = getCookie("ni_b_num");
    document.getElementById("num1").innerHTML = "你目前拥有" + ni_b.num + "个镍矿场";
    document.getElementById("num2").innerHTML = "你目前20每秒生产" + ni_b.num + "个镍矿";
        /*function checkCookie() {
            al_r.num = getCookie("al_r_num");
            al_b.num = getCookie("al_b_num");
            document.getElementById("num1").innerHTML = "你目前拥有" + al_b.num + "个铝矿场";
            document.getElementById("num2").innerHTML = "你目前10每秒生产" + al_b.num + "个铝矿";
        }*/
        function produce_ni_b() {
            if (al_r.num >= 500 && fe_r.num >= 100 && cu_r.num >= 50 && pb_r.num >= 50 && sn_r.num >= 50) {
                ni_b.num++;
                document.cookie = "ni_b_num="+ni_b.num+";path=/";
                al_r.num = al_r.num - 500;
                fe_r.num = fe_r.num - 100;
                cu_r.num = cu_r.num - 50;
                pb_r.num = pb_r.num - 50;
                sn_r.num = sn_r.num - 50;
                document.cookie = "al_r_num=" + al_r.num + ";path=/";
                document.cookie = "fe_r_num=" + fe_r.num + ";path=/";
                document.cookie = "cu_r_num=" + cu_r.num + ";path=/";
                document.cookie = "pb_r_num=" + pb_r.num + ";path=/";
                document.cookie = "sn_r_num="+sn_r.num+";path=/";
                document.getElementById("num1").innerHTML = "你目前拥有" + ni_b.num + "个镍矿场";
                document.getElementById("num2").innerHTML = "你目前20每秒生产" + ni_b.num + "个镍矿";
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
        if (able[i] != "Ni") {
            var li1 = document.createElement('li');
            var profileLink1 = '<a href="Building' + able[i] + '.aspx">' + dictionary_b(able[i]) + '</a>';
            li1.innerHTML = profileLink1;
            document.getElementById("ul").appendChild(li1);
        }
    }
        
</script>
</asp:Content>
