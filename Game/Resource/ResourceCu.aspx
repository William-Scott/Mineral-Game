<%@ Page Title="" Language="C#" MasterPageFile="~/Game/Resource/Resource.Master" AutoEventWireup="true" CodeBehind="ResourceCu.aspx.cs" Inherits="WebApplication1.Game.Resource.ResourceCu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">    
    <div class="row-fluid">
		<div class="span2">
			<ul id="ul" class="nav nav-stacked nav-pills" >
				<li>
					<a href="ResourceAl.aspx">铝矿</a>
				</li>
				<li>
					<a href="ResourceFe.aspx">铁矿</a>
				</li>
				<li class="active">
					<a href="ResourceCu.aspx">铜矿</a>
				</li>
                            <!--<li>
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
				铜矿
			</h3>
			<p><em>铜是一种在地球存在的稀有矿物，可以用于建设各种设施</em></p>
            <br/>
            <br/>
            <p id ="num1">你目前拥有0个铜矿</p>
            <br/>
			<p id="num2">你目前每秒生产0个铜矿</p> 
                        <!--<button id = "click" class="btn" type="button" onclick ="produce_al_r()">点击生产铝矿</button>-->
		</div>
	</div>
</div>
<script src="../../kuangwu.js"></script>
<script src="../../kuangchang.js"></script>
<script src="../../cookie.js"></script>
<script src="../../JavaScript.js"></script>
<script>
    var timeid;
    cu_b = new KuangChang("Cu", 0);
    cu_r = new KuangWu("Cu", 0, 1000);
    cu_r.num = getCookie("cu_r_num");
    cu_b.num = getCookie("cu_b_num");
    var cu_r_num_ = 0;
    document.getElementById("num1").innerHTML = "你目前拥有" + cu_r.num + "个铜矿";
    document.getElementById("num2").innerHTML = "你目前每20秒生产" + cu_b.num + "个铜矿";
        /*function checkCookie() {
            al_r.num = getCookie("al_r_num");
            al_b.num = getCookie("al_b_num");
            document.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
            document.getElementById("num2").innerHTML = "你目前每10秒生产" + al_b.num + "个铝矿";
        }*/
    //function produce_null() { }
    /*function produce_al_r() {
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
                document.cookie = "al_r_num="+al_r.num+";path=/";
                document.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
            } else {
                pos++;
                document.getElementById("click").innerHTML="点击生产铝矿（冷却中）";
            }
        }  
    }*/
    function btn2() {
        cu_r.num++;
        cu_r_num_++;
        document.cookie = "cu_r_num=" + cu_r.num + ";path=/";
        document.cookie = "cu_r_num_="+cu_r_num_+";path=/";
        document.getElementById("num1").innerHTML = "你目前拥有" + cu_r.num + "个铜矿";
    }
    if (cu_b.num>0) {
        cu_r.num = getCookie("cu_r_num");
        cu_b.num = getCookie("cu_b_num");
        var cd = 20000 / cu_b.num;
        var timeid_ = setInterval(function () { btn2() }, cd);
    }
        //动态生成第一个导航栏
    var able = new Array();
    able[0] = getCookie_w("Able1");
    able[1] = getCookie_w("Able2");
    for (var i = 0; i < 2; i++) {
        if (able[i] != "Cu") {
            var li1 = document.createElement('li');
            var profileLink1 = '<a href="Resource' + able[i] + '.aspx">' + dictionary_r(able[i]) + '</a>';
            li1.innerHTML = profileLink1;
            document.getElementById("ul").appendChild(li1);
        }
    }
</script>
</asp:Content>
