<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Plan.aspx.cs" Inherits="Plan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="planForm" runat="server" class="p-5">
    <div class="container">
        <h1 class="display-4 text-center p-4">
            Select your plan</h1>
        <div class="form-group">
            <label for="risk">
                Risk</label>
            <asp:DropDownList ID="RiskLevel" runat="server" class="form-control">
                <asp:ListItem Value="1">Low</asp:ListItem>
                <asp:ListItem Value="1">Moderate</asp:ListItem>
                <asp:ListItem Value="1">High</asp:ListItem>
            </asp:DropDownList>
                </div>
        <div class="form-group">
            <label for="tenure">
                Tenure</label><asp:TextBox runat="server" id="tenure" class="form-control" type="number" placeholder="in years" /></div>
        <div class="form-group">
            <label for="sip">
                SIP</label><asp:TextBox runat="server" id="sip" type="number" class="form-control"  /></div>
        <asp:Button ID="calculateBtn" Text="Calculate" class="btn btn-primary" 
            runat="server" onclick="calculateBtn_Click" />
        <asp:Button ID="startBtn" Text="Start Investing" class="btn btn-success" 
            runat="server" onclick="startBtn_Click" />
    </div>
    </form>

    <div class="container p-5">
        <div id="">
        </div>
    </div>
</asp:Content>
