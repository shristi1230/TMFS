<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <div class="row">
        <div class="p-4 ml-auto"><span>Welcome, <% Response.Write(Session["userLoggedIn"]); %></span></div>
    </div>
</div>
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Dashboard</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Invest</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  <div class="container-fluid p-2">
    <div class="jumbotron">
        <div class="row justify-content-center">
            <div class="col-sm-12 col-md-4 col-lg-3 mt-3">
                <div class="card">
                    <div class="card-body">
                        <h1 class="display-4 text-success text-center">
                            Risk
                        </h1>
                        <p class="card-text text-center">
                            Low
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-3 mt-3">
                <div class="card">
                <div class="card-body">
                    <h1 class="display-4 text-success text-center">
                            Tenure
                        </h1>
                        <p class="card-text text-center">
                            25 yrs
                        </p>
                        </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-3 mt-3">
                <div class="card">
                    <div class="card-body">
                        <h1 class="display-4 text-success text-center">
                            SIP Paid
                        </h1>
                        <p class="card-text text-center">
                            5
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-3 mt-3">
                <div class="card">
                    <div class="card-body">
                        <h1 class="display-4 text-success text-center">
                            SIP Left
                        </h1>
                        <p class="card-text text-center">
                            25
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-3 mt-3">
                <div class="card">
                    <div class="card-body">
                        <h1 class="display-4 text-success text-center">
                            SIP Amount
                        </h1>
                        <p class="card-text text-center">
                            2500 Rs.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-3 mt-3">
                <div class="card">
                    <div class="card-body">
                        <h1 class="display-4 text-success text-center">
                            Returns
                        </h1>
                        <p class="card-text text-center">
                            25000
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
  </div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
    
<fieldset>
    <form id="invest_form" runat="server" class="p-5">
    <h1 class="display-5 text-center">Invest Now
    </h1>
        <div class="form-group"><label for="Risk">Risk</label>
            <asp:TextBox runat="server" id="risk" readonly class="form-control" />
        </div>
        <div class="form-group"><label for="sip">SIP</label>
            <asp:TextBox runat="server" id="sip" readonly class="form-control" />
        </div>
        <div class="form-group"><label for="month">Month</label>
            <asp:TextBox runat="server" id="month" readonly class="form-control" />
        </div>
    <asp:Button Text="Pay Now" ID="investButton" class="btn btn-outline-primary" runat="server" />
    </form>
</fieldset>
  </div>
  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
</div>
</asp:Content>

