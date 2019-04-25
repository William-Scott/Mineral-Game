<%@ Page Title="" Language="C#" MasterPageFile="~/Start/Signup_Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication1.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="signup" runat="server">
    <form class="form-horizontal">
        <div class="container-fluid">
	    <div class="row-fluid">
        <div class="span5">
        </div>
        <div class="span2">
        <div class="control-group">
            <label class="control-label" for="inputAccount">用户名</label>
            <div class="controls">
                <asp:TextBox id="inputAccount" type="text" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_Account" runat="server" ErrorMessage="请输入用户名" ControlToValidate="inputAccount"></asp:RequiredFieldValidator>
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
                <asp:Button type="submit" class="btn" ID="bt_signup"  runat="server" Text="注册" OnClick="Bt_signup_Click"/>
            </div>
        </div>
    </div>
    <div class="span5">
    </div>
    </div>
    </div>
    </form>
</asp:Content>
