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
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row-fluid">
		            <div class="span6">
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
                    </div>
                    <div class="span6">
                        <div class="container-fluid">
                            <div class="row-fluid">
                                <div class="span2">
                                    <p class="lead text-center">
						                仓库
					                </p>
                                </div>
                                <div class="span10">
                                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="10" HorizontalAlign="Left">
                                        <Columns>
                                            <asp:BoundField DataField="Al" HeaderText="Al" SortExpression="Al" />
                                            <asp:BoundField DataField="Fe" HeaderText="Fe" SortExpression="Fe" />
                                            <asp:BoundField DataField="Cu" HeaderText="Cu" SortExpression="Cu" />
                                            <asp:BoundField DataField="Pb" HeaderText="Pb" SortExpression="Pb" />
                                            <asp:BoundField DataField="Sn" HeaderText="Sn" SortExpression="Sn" />
                                            <asp:BoundField DataField="Ti" HeaderText="Ti" SortExpression="Ti" />
                                            <asp:BoundField DataField="Cr" HeaderText="Cr" SortExpression="Cr" />
                                            <asp:BoundField DataField="Ni" HeaderText="Ni" SortExpression="Ni" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Player_infoConnectionString %>" SelectCommand="SELECT [Al], [Fe], [Cu], [Pb], [Sn], [Ti], [Cr], [Ni] FROM [Player_Resource] WHERE ([PlayerID] = @PlayerID)">
                                        <SelectParameters>
                                            <asp:CookieParameter CookieName="player_id" Name="PlayerID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row-fluid">
		            <div class="span12 text-center">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <h3>
				            交易所
			            </h3>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row-fluid">
		            <div class="span2">
                    </div>
                    <div class="span4 text-center">
					    <h3>
						    想要买
					    </h3>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Player_info1" OnRowCommand="GridView1_RowCommand_Buy" CellPadding="0" GridLines="Horizontal" CssClass="table table-hover table-striped">
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
                                        <asp:Button ID="Button1" class="btn btn-block btn-success" runat="server" Text="接受订单"  CommandArgument='<%# Container.DataItemIndex%>' CommandName="getRow" CausesValidation="false" OnRowCommand="GridView1_RowCommand_Buy"/>
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
                    <div class="span4 text-center">
					    <h3>
						    想要卖
					    </h3>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="Player_info2" OnRowCommand="GridView2_RowCommand_Sell" CellPadding="0" GridLines="Horizontal" CssClass="table table-hover table-striped">
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
                                        <asp:Button ID="Button2" class="btn btn-block btn-success" runat="server" Text="接受订单" CommandArgument='<%# Container.DataItemIndex%>' CommandName="getRow" CausesValidation="false" OnRowCommand="GridView2_RowCommand_Sell"/>
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
                    <div class="span2">
                    </div>
                </div>
            </div>
            <div class="container-fluid">
	            <div class="row-fluid">
                    <br/>
                </div>
            </div>
            <div class="container-fluid">
	            <div class="row-fluid">
                    <div class="span4">
                    </div>
                    <div class="span4">
                        <asp:Button ID="Button4" class="btn btn-block btn-primary" type="button" runat="server" Text="刷新交易所" OnClick="Button2_Click" CausesValidation="False" />
                    </div>
                    <div class="span4">
                    </div>
                </div>
            </div>
            <div class="container-fluid">
	            <div class="row-fluid">
                    <div class="span12 text-center">
                        <h3>
				            下订单
			            </h3>
                    </div>
                </div>
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
                                    <asp:LinkButton ID="WannaBuy" runat="server" href="#panel-521068" data-toggle="tab">想买</asp:LinkButton>
				                </li>
				                <li>
                                    <asp:LinkButton ID="WannaSell" runat="server" href="#panel-239596" data-toggle="tab">想卖</asp:LinkButton>
				                </li>
			                </ul>
			                <div class="tab-content text-center">
				                <div class="tab-pane active" id="panel-521068">
                                    <div class="container-fluid">
	                                    <div class="row-fluid">
                                            <div class="span2">
                                            </div>
                                            <div class="span2">
			                                        <p>
				                                        我需要
			                                        </p>
                                            </div>
                                            <div class="span2">
			                                    <select id="opt11" name="option" runat="server" class="select" style="width:50px;">
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
                                            <div class="span5">
                                                <asp:TextBox ID="BuyNeed" runat="server" style="width:60px;" TextMode="Number"></asp:TextBox>
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="请输入矿物数量" ControlToValidate="BuyNeed" OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True" ValidationGroup="a"></asp:CustomValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-fluid">
	                                    <div class="row-fluid">
                                            <div class="span2">
                                            </div>
                                            <div class="span2">
			                                    <p>
				                                    我提供
			                                    </p>
                                            </div>
                                            <div class="span2">
			                                    <select id="opt12" name="option" runat="server" class="select" style="width:50px;">
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
                                            <div class="span5">
                                                <asp:TextBox ID="BuyProvide" runat="server" style="width:60px;" TextMode="Number"></asp:TextBox>
                                                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="请输入矿物数量" ControlToValidate="BuyProvide" OnServerValidate="CustomValidator2_ServerValidate" ValidateEmptyText="True" ValidationGroup="a"></asp:CustomValidator>
                                            </div>
	                                    </div>
                                    </div>
                                    <div class="container-fluid">
	                                        <div class="row-fluid">
                                                <div class="span12">
                                                    <asp:Button ID="bt_Buy_Confirm" class="btn btn-block btn-primary" runat="server" Text="提交买单" OnClick="Bt_Buy_Confirm_Click" ValidationGroup="a"/>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                <div class="tab-pane" id="panel-239596">
                                    <div class="container-fluid">
	                                    <div class="row-fluid">
                                            <div class="span2">
                                            </div>
                                            <div class="span2">
			                                    <p>
				                                    我提供
			                                    </p>
                                            </div>
                                            <div class="span2">
			                                    <select id="opt21" name="option" runat="server" class="select" style="width:50px;">
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
                                            <div class="span5">
                                                <asp:TextBox ID="SellProvide" runat="server" style="width:60px;" TextMode="Number"></asp:TextBox>
                                                <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="请输入矿物数量" ValidateEmptyText="True" ControlToValidate="SellProvide"  OnServerValidate="CustomValidator3_ServerValidate" ValidationGroup="b"></asp:CustomValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-fluid">
	                                    <div class="row-fluid">
                                            <div class="span2">
                                            </div>
                                            <div class="span2">
			                                    <p>
				                                    我需要
			                                    </p>
                                            </div>
                                            <div class="span2">
			                                    <select id="opt22" name="option" runat="server" class="select" style="width:50px;">
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
                                            <div class="span5">
                                                <asp:TextBox ID="SellNeed" runat="server" style="width:60px;" TextMode="Number"></asp:TextBox>
                                                <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="请输入矿物数量" ValidateEmptyText="True" ControlToValidate="SellNeed" OnServerValidate="CustomValidator4_ServerValidate" ValidationGroup="b"></asp:CustomValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-fluid">
	                                    <div class="row-fluid">
                                            <div class="span12">
                                                <asp:Button ID="bt_Sell_Confirm" class="btn btn-block btn-primary" runat="server" Text="提交卖单" OnClick="Bt_Sell_Confirm_Click" ValidationGroup="b"/>
                                            </div>
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
    </form>
</body>
</html>
