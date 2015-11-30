<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="Admin_Home.aspx.cs" Inherits="TheGameBox.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server"> 
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
 
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Admin_AdminID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            Admin_AdminID:
            <asp:Label ID="Admin_AdminIDLabel1" runat="server" Text='<%# Eval("Admin_AdminID") %>' />
            <br />
            Admin_AdminName:
            <asp:TextBox ID="Admin_AdminNameTextBox" runat="server" Text='<%# Bind("Admin_AdminName") %>' />
            <br />
            Admin_FName:
            <asp:TextBox ID="Admin_FNameTextBox" runat="server" Text='<%# Bind("Admin_FName") %>' />
            <br />
            Admin_LName:
            <asp:TextBox ID="Admin_LNameTextBox" runat="server" Text='<%# Bind("Admin_LName") %>' />
            <br />
            Admin_Email:
            <asp:TextBox ID="Admin_EmailTextBox" runat="server" Text='<%# Bind("Admin_Email") %>' />
            <br />
            Admin_Password:
            <asp:TextBox ID="Admin_PasswordTextBox" runat="server" Text='<%# Bind("Admin_Password") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
           
        </EditItemTemplate>
        <InsertItemTemplate>
            Admin_AdminName:
            <asp:TextBox ID="Admin_AdminNameTextBox" runat="server" Text='<%# Bind("Admin_AdminName") %>' />
            <br />
            Admin_FName:
            <asp:TextBox ID="Admin_FNameTextBox" runat="server" Text='<%# Bind("Admin_FName") %>' />
            <br />
            Admin_LName:
            <asp:TextBox ID="Admin_LNameTextBox" runat="server" Text='<%# Bind("Admin_LName") %>' />
            <br />
            Admin_Email:
            <asp:TextBox ID="Admin_EmailTextBox" runat="server" Text='<%# Bind("Admin_Email") %>' />
            <br />
            Admin_Password:
            <asp:TextBox ID="Admin_PasswordTextBox" runat="server" Text='<%# Bind("Admin_Password") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
             Admin_AdminID:
             <asp:Label ID="Admin_AdminIDLabel" runat="server" Text='<%# Eval("Admin_AdminID") %>' />
             <br />
             Admin_AdminName:
             <asp:Label ID="Admin_AdminNameLabel" runat="server" Text='<%# Bind("Admin_AdminName") %>' />
             <br />
             Admin_FName:
             <asp:Label ID="Admin_FNameLabel" runat="server" Text='<%# Bind("Admin_FName") %>' />
             <br />
             Admin_LName:
             <asp:Label ID="Admin_LNameLabel" runat="server" Text='<%# Bind("Admin_LName") %>' />
             <br />
             Admin_Email:
             <asp:Label ID="Admin_EmailLabel" runat="server" Text='<%# Bind("Admin_Email") %>' />
             <br />
             Admin_Password:
             <asp:Label ID="Admin_PasswordLabel" runat="server" Text='<%# Bind("Admin_Password") %>' />
             <br />
             <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
             &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
             &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    
     
    </form>
</asp:Content>
