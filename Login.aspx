<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server" class="p-5">
    <h1 class="display-4 p-2 text-center">Login</h1>
    <div class="form-group">
        <label for="email">
            Email address</label><asp:TextBox runat="server" id="email" class="form-control" /></div>
            
    <div class="form-group">
        <label for="password">
            Password</label><asp:TextBox runat="server" type="password" id="password" class="form-control" /></div>
<asp:Button Text="Login" class="btn btn-outline-success" ID="loginButton" 
        runat="server" onclick="loginButton_Click"  /><asp:Label ID="Label1" runat="server"
            Text=""></asp:Label>
    </form>
</asp:Content>

