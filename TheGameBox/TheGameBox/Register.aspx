<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TheGameBox.Register" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>The Game Box</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
      <style type="text/css">
          .auto-style1 {
              width: 122px;
          }
          .auto-style2 {
              width: 122px;
              height: 22px;
          }
          .auto-style3 {
              height: 22px;
          }
          .auto-style5 {
              height: 22px;
              width: 149px;
          }
          .auto-style6 {
              width: 149px;
          }
      </style>
      </head>

  <body>

      <form id="form1" runat="server">

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div>
	  	<div style="color: #ffffff;">

              
		     
		        <table style="width:100%;">
                    <tr>
                        <td class="auto-style1"><h1>Register</h1></td>
                        <td class="auto-style6">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">USER NAME:&nbsp;
                        </td>
                        <td class="auto-style5"><asp:TextBox ID="userNameTxtBx" runat="server" ForeColor="Black" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="auto-style3">
                            <asp:Label ID="usrNameLbl" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="emailTxtBx" runat="server" ForeColor="Black" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="emailLbl" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">FIRST NAME:&nbsp;
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="firstNameTxtBx" runat="server" ForeColor="Black"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="firstNameLbl" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">LAST NAME:&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="lastNameTxtBx" runat="server" ForeColor="Black"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lastNameLbl" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">PASSWORD:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="passwordTxtBx" runat="server" ForeColor="Black" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="passwrdLbl" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">VERIFY PASSWORD:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="varifyPasswordTxtBx" runat="server" ForeColor="Black" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="varPasswrdLbl" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
                            </td>
                        <td class="auto-style6">&nbsp;</td>
                        <td>
                            <asp:Label ID="failLbl" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                                <asp:Button ID="RegisterBtn" runat="server" Text="Register" ForeColor="#263635" OnClick="RegisterBtn_Click"  />
                            </td>
                        <td class="auto-style6">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

              
		     
		        </div>
		
		          <!-- Modal -->
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Forgot Password ?</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p>Enter your e-mail address below to reset your password.</p>
		                          <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
		                          <button class="btn btn-theme" type="button">Submit</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
		
		      </form>
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/login-bg.jpg", {speed: 500});
    </script>


      </form>


  </body>
</html>