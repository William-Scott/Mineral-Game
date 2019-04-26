<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trading_hall.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
    <link href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css" rel="stylesheet" media="screen"/>
    <script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">
	            <div class="row-fluid">
		            <div class="span12">
                        <h3 class="text-center">
				            我家里有矿
			            </h3>
                        <div class="text-center">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </div>
                        <ul class="nav nav-tabs">
				            <li>
					            <a href="../Game/Resource/ResourceAl.aspx">矿物</a>
				            </li>
				            <li>
					            <a href="../Game/Building/BuildingAl.aspx">矿场</a>
				            </li>
				            <li class="active">
					            <a href="Trading_hall.aspx">交易所</a>
				            </li>
			            </ul>
                        <div class="text-center ">
                            <h3>
				                交易所
			                </h3>
                        </div>
                        <div class="container-fluid">
	                        <div class="row-fluid">
		                        <div class="span2">
		                        </div>
		                        <div class="span8">
			                        <div class="row-fluid">
				                        <div class="span6 text-center">
					                        <h3>
						                        想要买
					                        </h3> 
                                            <div style="margin:0 auto;width: 265px;">
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Player_info1" OnRowCommand="GridView1_RowCommand_Buy">
                                                    <Columns>
                                                        <asp:BoundField DataField="Num" HeaderText="订单编号" SortExpression="Num" InsertVisible="False" ReadOnly="True" >
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="GoodsFir" HeaderText="买" SortExpression="GoodsFir" >
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="NumFir" HeaderText="数量" SortExpression="NumFir" >
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="GoodsSec" HeaderText="价格" SortExpression="GoodsSec" >
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="NumSec" HeaderText="数量" SortExpression="NumSec" />
                                                        <asp:TemplateField ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button1" runat="server" Text="接受订单"  CommandArgument='<%# Container.DataItemIndex%>' CommandName="getRow" CausesValidation="false" OnRowCommand="GridView1_RowCommand_Buy"/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="Player_info1" runat="server" ConnectionString="<%$ ConnectionStrings:Player_infoConnectionString %>" SelectCommand="SELECT [Num], [GoodsFir], [NumFir], [GoodsSec], [NumSec] FROM [Trading_hall] WHERE ([BS] = @BS)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="true" Name="BS" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
				                        </div>
				                        <div class="span6 text-center">
					                        <h3>
						                        想要卖
					                        </h3>
                                            <div style="margin:0 auto;width: 265px">
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="Player_info2" OnRowCommand="GridView2_RowCommand_Sell">
                                                    <Columns>
                                                        <asp:BoundField DataField="Num" HeaderText="订单编号" SortExpression="Num" InsertVisible="False" ReadOnly="True" >
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="GoodsFir" HeaderText="卖" SortExpression="GoodsFir" >
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="NumFir" HeaderText="数量" SortExpression="NumFir" >
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="GoodsSec" HeaderText="价格" SortExpression="GoodsSec" >
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="NumSec" HeaderText="数量" SortExpression="NumSec" />
                                                        <asp:TemplateField ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:Button ID="Button2" runat="server" Text="接受订单" CommandArgument='<%# Container.DataItemIndex%>' CommandName="getRow" CausesValidation="false" OnRowCommand="GridView2_RowCommand_Sell"/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="Player_info2" runat="server" ConnectionString="<%$ ConnectionStrings:Player_infoConnectionString %>" SelectCommand="SELECT [Num], [GoodsFir], [NumFir], [GoodsSec], [NumSec] FROM [Trading_hall] WHERE ([BS] = @BS)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="false" Name="BS" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
				                            </div>
                                        </div>
			                        </div>
                                    <br/><br/>
                                    <div class="span2">
                                    </div>
                                    <div class="span8">
                                        <asp:Button ID="Button4" class="btn btn-block btn-primary" type="button" runat="server" Text="刷新交易所" OnClick="Button2_Click" />
			                        </div>
                                    <div class="span2">
                                    </div>
                                    <br/><br/>
                                </div>
                            </div>
		                    <div class="span2">
		                    </div>
	                    </div>
                    </div>
                    <div class="text-center ">
                        <h3>
				            下订单
			            </h3>
                    </div>
                    <div class="container-fluid">
	                    <div class="row-fluid">
		                    <div class="span4">
		                    </div>
		                    <div class="span4">
                                <p>
				                    订单类型
			                    </p>
			                    <div class="tabbable" id="tabs-940783">
				                    <ul class="nav nav-tabs">
					                    <li class="active">
						                    <a href="#panel-521068" data-toggle="tab">想买</a>
					                    </li>
					                    <li>
						                    <a href="#panel-239596" data-toggle="tab">想卖</a>
					                    </li>
				                    </ul>
				                    <div class="tab-content">
					                    <div class="tab-pane active" id="panel-521068">
						                    <div class="container-fluid">
	                                             <div class="row-fluid">
		                                            <div class="span2">
			                                             <p>
				                                             我需要
			                                             </p>
		                                            </div>
		                                            <div class="span3">
			                                            <select id="opt11" name="option" runat="server" class="select" style="width:100px;">
                                                            <option value="Al">铝</option>
                                                            <option value="Fe">铁</option>
                                                            <option value="Cu">铜</option>
                                                            <option value="Pb">铅</option>
                                                            <option value="Sn">锡</option>
                                                            <option value="Ti">钛</option>
                                                            <option value="Cr">铬</option>
                                                            <option value="Ni">镍</option>
                                                        </select>
		                                            </div>
		                                            <div class="span1">
			                                            <p>
				                                                X
			                                            </p>
		                                            </div>
		                                            <div class="span4">
                                                        <asp:TextBox ID="BuyNeed" runat="server" style="width:200px;"></asp:TextBox>
		                                            </div>
                                                    <div class="span2">
                                                    </div>
	                                            </div>
                                            </div>
                                            <div class="container-fluid">
	                                            <div class="row-fluid">
		                                            <div class="span2">
			                                            <p>
				                                            我提供
			                                            </p>
		                                            </div>
		                                            <div class="span3">
			                                            <select id="opt12" name="option" runat="server" class="select" style="width:100px;">
                                                            <option value="Al">铝</option>
                                                            <option value="Fe">铁</option>
                                                            <option value="Cu">铜</option>
                                                            <option value="Pb">铅</option>
                                                            <option value="Sn">锡</option>
                                                            <option value="Ti">钛</option>
                                                            <option value="Cr">铬</option>
                                                            <option value="Ni">镍</option>
                                                        </select>
		                                            </div>
		                                            <div class="span1">
			                                            <p>
				                                                X
			                                            </p>
		                                            </div>
		                                            <div class="span4">
                                                        <asp:TextBox ID="BuyProvide" runat="server" style="width:200px;"></asp:TextBox>
		                                            </div>
                                                    <div class="span2">
                                                    </div>
	                                            </div>
                                                <div>
                                                    <asp:Button ID="bt_Buy_Confirm" class="btn btn-block btn-primary" data-dismiss="modal" aria-hidden="true" runat="server" Text="提交买单" OnClick="Bt_Buy_Confirm_Click" />
                                                </div>
                                            </div>
					                    </div>
					                    <div class="tab-pane" id="panel-239596">
						                    <div class="container-fluid">
	                                            <div class="row-fluid">
		                                            <div class="span2">
			                                            <p>
				                                            我提供
			                                            </p>
		                                            </div>
		                                            <div class="span3">
			                                            <select id="opt21" name="option" runat="server" class="select" style="width:100px;">
                                                            <option value="Al">铝</option>
                                                            <option value="Fe">铁</option>
                                                            <option value="Cu">铜</option>
                                                            <option value="Pb">铅</option>
                                                            <option value="Sn">锡</option>
                                                            <option value="Ti">钛</option>
                                                            <option value="Cr">铬</option>
                                                            <option value="Ni">镍</option>
                                                        </select>
		                                            </div>
                                                    <div class="span1">
                                                        <p>
                                                            X
                                                        </p>
                                                    </div>
		                                            <div class="span4">
                                                        <asp:TextBox ID="SellProvide" runat="server" style="width:200px;"></asp:TextBox>
		                                            </div>
                                                    <div class="span2">
                                                    </div>
	                                            </div>
                                            </div>
                                            <div class="container-fluid">
	                                            <div class="row-fluid">
		                                            <div class="span2">
			                                            <p>
				                                            我需要
			                                            </p>
		                                            </div>
		                                            <div class="span3">
			                                            <select id="opt22" name="option" runat="server" class="select" style="width:100px;">
                                                            <option value="Al">铝</option>
                                                            <option value="Fe">铁</option>
                                                            <option value="Cu">铜</option>
                                                            <option value="Pb">铅</option>
                                                            <option value="Sn">锡</option>
                                                            <option value="Ti">钛</option>
                                                            <option value="Cr">铬</option>
                                                            <option value="Ni">镍</option>
                                                        </select>
		                                            </div>
		                                            <div class="span1">
			                                            <p>
				                                            X
			                                            </p>
		                                            </div>
		                                            <div class="span4">
                                                        <asp:TextBox ID="SellNeed" runat="server" style="width:200px;"></asp:TextBox>
		                                            </div>
                                                    <div class="span2">
                                                    </div>
	                                            </div>
                                                <div>
                                                    <asp:Button ID="bt_Sell_Confirm" class="btn btn-block btn-primary" data-dismiss="modal" aria-hidden="true" runat="server" Text="提交卖单" OnClick="Bt_Sell_Confirm_Click" />
                                                </div>
                                            </div>
					                    </div>
				                    </div>
			                    </div>
		                    </div>
		                    <div class="span4">
		                    </div>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
