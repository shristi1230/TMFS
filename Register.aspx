<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="RegisterForm" runat="server" class="p-5">
    <h1 class="display-4 text-center p-2">
        Register</h1>
    <div class="form-group">
        <label for="email">
            Email address</label><asp:TextBox type="text" id="email" class="form-control" runat="server" />
            <small id="emailHelp" class="form-text text-danger">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
            runat="server" ErrorMessage="Invalid Email address" ControlToValidate="email" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></small>
    </div>
    <div class="form-group">
        <label for="first_name">
            First Name</label><asp:TextBox runat="server" id="first_name" class="form-control" /></div>
    <div class="form-group">
        <label for="last_name">
            Last Name</label><asp:TextBox runat="server" id="last_name" class="form-control" /></div>
    <div class="form-group">
        <label for="age">
            Age</label><asp:TextBox runat="server" id="age" 
            class="form-control" max="52" min="21" /></div>
    <div class="form-group">
        <label for="pan_no">
            Pan No</label><asp:TextBox runat="server" id="pan_no" class="form-control" /></div>
    <div class="form-group">
        <label for="phone_no">
            Phone No</label><asp:TextBox id="phone_no" class="form-control" runat="server" /></div>
    <div class="form-group">
        <label for="password">
            Password</label><asp:TextBox runat="server" type="password" id="password" class="form-control" /></div>
    <div class="form-group">
        <label for="confirm_password">
            Confirm Password</label><asp:TextBox runat="server" id="confirm_password" class="form-control" type="password" />
                <small id="Small1" class="form-text text-danger">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="Password Does not Match" ControlToCompare="confirm_password" 
            ControlToValidate="password"></asp:CompareValidator></small>
                </div>
    <asp:Button Text="Register Now" runat="server" ID="registerButton" 
        class="btn btn-outline-info" onclick="registerButton_Click" />
    <asp:Button Text="Reset" runat="server" class="btn btn-outline-danger ml-5" />
    <small class="text-danger d-block"><asp:Label
        ID="Label1" runat="server" Text=""></asp:Label></small>
    </form>
</asp:Content>
