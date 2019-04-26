<%@ Page Title="" Language="C#" MasterPageFile="~/Game/Resource/Resource.Master" AutoEventWireup="true" CodeBehind="ResourceAl.aspx.cs" Inherits="WebApplication1.Resource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">    
    <div class="row-fluid">
		<div class="span2">
			<ul id="ul" class="nav nav-stacked nav-pills" >
				<li class="active">
					<a href="ResourceAl.aspx">铝矿</a>
				</li>
				<li>
					<a href="ResourceFe.aspx">铁矿</a>
				</li>
						    <!--<li>
							    <a href="ResourceCu.aspx">铜矿</a>
						    </li>
                            <li>
							    <a href="ResourcePb.aspx">铅矿</a>
						    </li>
                            <li>
							    <a href="ResourceSn.aspx">锡矿</a>
						    </li>
                            <li>
							    <a href="ResourceTi.aspx">钛矿</a>
						    </li>
                            <li>
							    <a href="ResourceCr.aspx">铬矿</a>
						    </li>
                            <li>
							    <a href="ResourceNi">镍矿</a>
						    </li>-->
			</ul>
		</div>
		<div class="span10">
			<h3>
				铝矿
			</h3>
			<p><em>铝是一种在地球普遍存在的矿物，可以用于建设各种设施</em></p>
            <br/>
            <br/>
            <p id ="num1">你目前拥有0个铝矿</p>
            <br/>
			<p id="num2">你目前每秒生产0个铝矿</p> 
            <button id = "click" class="btn" type="button" onclick ="produce_al_r()">点击生产铝矿</button>
		</div>
	</div>
</div>
<script src="../../kuangwu.js"></script>
<script src="../../kuangchang.js"></script>
<script src="../../cookie.js"></script>
<script src="../../JavaScript.js"></script>
<script>
    var timeid;
    al_b = new KuangChang("Al", 0);
    al_r = new KuangWu("Al", 0, 1000);
    al_r.num = getCookie("al_r_num");
    al_b.num = getCookie("al_b_num");
    var al_r_num_ = 0;
    document.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
    document.getElementById("num2").innerHTML = "你目前每10秒生产" + al_b.num + "个铝矿";
        /*function checkCookie() {
            al_r.num = getCookie("al_r_num");
            al_b.num = getCookie("al_b_num");
            document.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
            document.getElementById("num2").innerHTML = "你目前每10秒生产" + al_b.num + "个铝矿";
        }*/
    function produce_null() { }
    function produce_al_r() {
        var pos = 0;
        document.getElementById("click").className = "btn disabled";
        document.getElementById("click").onclick = function() {produce_null();};
        timeid = setInterval(function () { btn1() }, 10);
        function btn1() {
            if (pos >= 100) {
                clearInterval(timeid);
                document.getElementById("click").innerHTML="点击生产铝矿";
                document.getElementById("click").onclick = function() {produce_al_r();};
                document.getElementById("click").className = "btn";
                al_r.num++;
                al_r_num_++;
                document.cookie = "al_r_num=" + al_r.num + ";path=/";
                document.cookie = "al_r_num_="+al_r_num_+";path=/";
                document.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
            } else {
                pos++;
                document.getElementById("click").innerHTML="点击生产铝矿（冷却中）";
            }
        }  
    }
    function btn2() {
        al_r.num++;
        al_r_num_++;
        document.cookie = "al_r_num=" + al_r.num + ";path=/";
        document.cookie = "al_r_num_="+al_r_num_+";path=/";
        document.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
    }
    if (al_b.num>0) {
        al_r.num = getCookie("al_r_num");
        al_b.num = getCookie("al_b_num");
        var cd = 10000 / al_b.num;
        var timeid_ = setInterval(function () { btn2() }, cd);
    }
        //动态生成第一个导航栏
    var li1 = document.createElement('li');
    var profileLink1 = '<a href="Resource' + getCookie_w("Able1") + '.aspx">' + dictionary_r(getCookie_w("Able1")) + '</a>';
    li1.innerHTML = profileLink1;
    document.getElementById("ul").appendChild(li1);
    //动态生成第二个导航栏
    var li2 = document.createElement('li');
    var profileLink2 = '<a href="Resource' + getCookie_w("Able2") + '.aspx">' + dictionary_r(getCookie_w("Able2")) + '</a>';
    li2.innerHTML = profileLink2;
    document.getElementById("ul").appendChild(li2);
</script>
</asp:Content>

