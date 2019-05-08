<%@ Page Title="" Language="C#" MasterPageFile="~/Game/Building/Building.Master" AutoEventWireup="true" CodeBehind="BuildingFe.aspx.cs" Inherits="WebApplication1.Game.Building.BuildingFe" %>
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
				<li class="active">
					<a href="BuildingFe.aspx">铁矿场</a>
				</li>
						    <!--<li>
							    <a href="Resource_unable.aspx">铜矿场</a>
						    </li>
                            <li>
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
				铁矿场
			</h3>
			<p><em>铁矿场可以自动生产铁矿，建造需求：铝矿 * 100</em></p>
            <br/>
            <br/><p id ="num1">你目前拥有0个铁矿场</p><br/>
			<p id="num2">你目前10每秒生产0个铁矿</p> 
            <button id = "click" class="btn" type="button" onclick ="produce_fe_b()">点击建造铁矿场</button>
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
    fe_b = new KuangChang("Fe", 0);
    al_r.num = getCookie("al_r_num");
    fe_b.num = getCookie("fe_b_num");
    var al_r_num_ = 0;
    document.getElementById("num1").innerHTML = "你目前拥有" + fe_b.num + "个铁矿场";
    document.getElementById("num2").innerHTML = "你目前10每秒生产" + fe_b.num + "个铁矿";
    /*function checkCookie() {
        al_r.num = getCookie("al_r_num");
        al_b.num = getCookie("al_b_num");
        document.getElementById("num1").innerHTML = "你目前拥有" + al_b.num + "个铝矿场";
        document.getElementById("num2").innerHTML = "你目前10每秒生产" + al_b.num + "个铝矿";
    }*/
    function produce_fe_b() {
        if (al_r.num >= 100) {
            fe_b.num++;
            document.cookie = "fe_b_num="+fe_b.num+";path=/";
            al_r.num = al_r.num - 100;
            document.cookie = "al_r_num=" + al_r.num + ";path=/";
            al_r_num_ = al_r_num_ - 100;
            document.cookie = "al_r_num_="+al_r_num_+";path=/";
            document.getElementById("num1").innerHTML = "你目前拥有" + fe_b.num + "个铁矿场";
            document.getElementById("num2").innerHTML = "你目前10每秒生产" + fe_b.num + "个铁矿";
            document.getElementById("warning").innerHTML = "";
        } else {
            document.getElementById("warning").innerHTML = "矿物储量不足";
        }
    }
    //动态生成第一个导航栏
    var li1 = document.createElement('li');
    var profileLink1 = '<a href="Building' + getCookie_w("Able1") + '.aspx">' + dictionary_b(getCookie_w("Able1")) + '</a>';
    li1.innerHTML = profileLink1;
    document.getElementById("ul").appendChild(li1);
    //动态生成第二个导航栏
    var li2 = document.createElement('li');
    var profileLink2 = '<a href="Building' + getCookie_w("Able2") + '.aspx">' + dictionary_b(getCookie_w("Able2")) + '</a>';
    li2.innerHTML = profileLink2;
    document.getElementById("ul").appendChild(li2);
</script>
</asp:Content>
