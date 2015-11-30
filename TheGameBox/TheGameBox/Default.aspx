<%@ Page Title="" Language="C#" MasterPageFile="~/WebPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TheGameBox.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>User Profile</h2>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Admin_AdminID" DataSourceID="SqlDataSource1">
        
        <EditItemTemplate>
            <style>
                 td:first-child 
                 {
                     background-color:black;
                     color:white;
                 }
                 td
                 {
                     background-color:white;
                     color:black;
                 }
             </style>
            <table border="1" style="width:100%;">
                <tr>
                    <td>Admin_AdminID:</td>
                    <td><asp:Label ID="Admin_AdminIDLabel1" runat="server" Text='<%# Eval("Admin_AdminID") %>' /></td>
                </tr>
                <tr>
                    <td>Admin_AdminName:</td>
                    <td><asp:Label ID="TextBox1" runat="server" Text='<%# Eval("Admin_AdminName") %>' /></td>
                </tr>
                <tr>
                    <td>Admin_FName:</td>
                    <td> <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Admin_FName") %>'  Width="291px" /></td>
                </tr>
                <tr>
                    <td>Admin_LName:</td>
                    <td> <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Admin_LName") %>'   Width="291px" /></td>
                </tr>
                <tr>
                    <td>Admin_Email:</td>
                    <td><asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Admin_Email") %>'   Width="291px" /></td>
                </tr>
                <tr>
                    <td>Admin_Password:</td>
                    <td> <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Admin_Password") %>'   Width="291px" /></td>
                </tr>
                <td>
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </td>
             </table>
           
        </EditItemTemplate>
        <ItemTemplate>
             <style>
                 td:first-child 
                 {
                     background-color:black;
                     color:white;
                 }
                 td
                 {
                     background-color:white;
                     color:black;
                 }
             </style>
            <table border="1" style="width:100%;">
                <tr>
                     <td>Admin_AdminID:</td>
                    <td><asp:Label ID="Admin_AdminIDLabel" runat="server" Text='<%# Eval("Admin_AdminID") %>' /></td>

                </tr>
               <tr>
                   <td>Admin_AdminName:</td>
                    <td><asp:Label ID="Admin_AdminNameLabel" runat="server" Text='<%# Bind("Admin_AdminName") %>' /></td>

               </tr>
                <tr>
                    <td>Admin_FName:</td>
                    <td><asp:Label ID="Admin_FNameLabel" runat="server" Text='<%# Bind("Admin_FName") %>' /></td>

               </tr>
                <tr>
                    <td>Admin_LName:</td>
                    <td><asp:Label ID="Admin_LNameLabel" runat="server" Text='<%# Bind("Admin_LName") %>' /></td>

               </tr>
                <tr>
                    <td>Admin_Email:</td>
                    <td><asp:Label ID="Admin_EmailLabel" runat="server" Text='<%# Bind("Admin_Email") %>' /></td>

                </tr>
                <tr>
                    <td>Admin_Password:</td>
                    <td><asp:Label ID="Admin_PasswordLabel" runat="server" Text='<%# Bind("Admin_Password") %>' /></td>

                </tr>
                <tr>
                    <td><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" /></td>
                </tr>
                
                </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" 
        SelectCommand="SELECT * FROM [Admin] WHERE ([Admin_AdminID] = @Admin_AdminID)" 
        DeleteCommand="DELETE FROM [Admin] WHERE [Admin_AdminID] = @Admin_AdminID" 
        InsertCommand="INSERT INTO [Admin] ([Admin_AdminName], [Admin_FName], [Admin_LName], [Admin_Email], [Admin_Password]) VALUES (@Admin_AdminName, @Admin_FName, @Admin_LName, @Admin_Email, @Admin_Password)" 
        UpdateCommand="UPDATE [Admin] SET [Admin_FName] = @Admin_FName, [Admin_LName] = @Admin_LName, [Admin_Email] = @Admin_Email, [Admin_Password] = @Admin_Password WHERE [Admin_AdminID] = @Admin_AdminID">
        <DeleteParameters>
            <asp:Parameter Name="Admin_AdminID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Admin_AdminName" Type="String" />
            <asp:Parameter Name="Admin_FName" Type="String" />
            <asp:Parameter Name="Admin_LName" Type="String" />
            <asp:Parameter Name="Admin_Email" Type="String" />
            <asp:Parameter Name="Admin_Password" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="Admin_AdminID" SessionField="UserId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Admin_AdminName" Type="String" />
            <asp:Parameter Name="Admin_FName" Type="String" />
            <asp:Parameter Name="Admin_LName" Type="String" />
            <asp:Parameter Name="Admin_Email" Type="String" />
            <asp:Parameter Name="Admin_Password" Type="String" />
            <asp:Parameter Name="Admin_AdminID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
