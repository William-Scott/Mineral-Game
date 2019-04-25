<%@ Page Title="" Language="C#" MasterPageFile="~/Start/Signin_Site.Master" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="WebApplication1.Signin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="signin" runat="server">
    <form class="form-horizontal">
        <div class="container-fluid">
	    <div class="row-fluid">
        <div class="span5">
        </div>
        <div class="span2">
        <div class="control-group">
            <label class="control-label" for="inputEmail">账号</label>
            <div class="controls">
                <asp:TextBox id="inputAccount" type="text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_Account" runat="server" ErrorMessage="请输入账号" ControlToValidate="inputAccount"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="inputPassword">密码</label>
            <div class="controls">
                <asp:TextBox id="inputPassword" type="password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_Password" runat="server" ErrorMessage="请输入密码" ControlToValidate="inputPassword"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <label class="checkbox">
                    <input type="checkbox" />
                    记住我</label>
                <asp:Button type="submit" class="btn" ID="bt_signin"  runat="server" Text="登录" OnClick="Bt_signin_Click"/>
            </div>
        </div>
    </div>
    <div class="span5">
    </div>
    </div>
    </div>
    </form>
</asp:Content>