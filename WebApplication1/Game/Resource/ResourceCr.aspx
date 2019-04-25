<%@ Page Crtle="" Language="C#" MasterPageFile="~/Game/Resource/Resource.Master" AutoEventWireup="true" CodeBehind="ResourceCr.aspx.cs" Inherits="WebApplicacron1.Game.Resource.ResourceCr" %>
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
					<a href="ResourceCr.aspx">铬矿</a>
				</li>
                            <!--<li>
							    <a href="ResourceCr.aspx">铬矿</a>
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
				铬矿
			</h3>
			<p><em>铬是一种在地球存在的稀有矿物，可以用于建设各种设施</em></p>
            <br/>
            <br/>
            <p id ="num1">你目前拥有0个铬矿</p>
            <br/>
			<p id="num2">你目前每秒生产0个铬矿</p> 
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
    cr_b = new KuangChang("Cr", 0);
    cr_r = new KuangWu("Cr", 0, 1000);
    cr_r.num = getCookie("cr_r_num");
    cr_b.num = getCookie("cr_b_num");
    var cr_r_num_ = 0;
    document.getElementById("num1").innerHTML = "你目前拥有" + cr_r.num + "个铬矿";
    document.getElementById("num2").innerHTML = "你目前每20秒生产" + cr_b.num + "个铬矿";
        /*function checkCookie() {
            al_r.num = getCookie("al_r_num");
            al_b.num = getCookie("al_b_num");
            docrment.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
            docrment.getElementById("num2").innerHTML = "你目前每10秒生产" + al_b.num + "个铝矿";
        }*/
    //function produce_null() { }
    /*function produce_al_r() {
        var pos = 0;
        docrment.getElementById("click").className = "btn disabled";
        docrment.getElementById("click").onclick = function() {produce_null();};
        timeid = setInterval(function () { btn1() }, 10);
        function btn1() {
            if (pos >= 100) {
                clearInterval(timeid);
                docrment.getElementById("click").innerHTML="点击生产铝矿";
                docrment.getElementById("click").onclick = function() {produce_al_r();};
                docrment.getElementById("click").className = "btn";
                al_r.num++;
                docrment.cookie = "al_r_num="+al_r.num+";path=/";
                docrment.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
            } else {
                pos++;
                docrment.getElementById("click").innerHTML="点击生产铝矿（冷却中）";
            }
        }  
    }*/
    function btn2() {
        cr_r.num++;
        cr_r_num_++;
        document.cookie = "cr_r_num=" + cr_r.num + ";path=/";
        document.cookie = "cr_r_num_="+cr_r_num_+";path=/";
        document.getElementById("num1").innerHTML = "你目前拥有" + cr_r.num + "个铬矿";
    }
    if (cr_b.num>0) {
        cr_r.num = getCookie("cr_r_num");
        cr_b.num = getCookie("cr_b_num");
        var cd = 20000 / cr_b.num;
        var timeid_ = setInterval(function () { btn2() }, cd);
    }
        //动态生成第一个导航栏
    var able = new Array();
    able[0] = getCookie_w("Able1");
    able[1] = getCookie_w("Able2");
    for (var i = 0; i < 2; i++) {
        if (able[i] != "Cr") {
            var li1 = document.createElement('li');
            var profileLink1 = '<a href="Resource' + able[i] + '.aspx">' + dictionary_r(able[i]) + '</a>';
            li1.innerHTML = profileLink1;
            document.getElementById("ul").appendChild(li1);
        }
    }
</script>
</asp:Content>
