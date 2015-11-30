<%@ Page Title="" Language="C#" MasterPageFile="~/WebPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TheGameBox.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <h2>User Profile</h2>
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="User_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                <table border="1" style="width:100%;">
                    <tr>
                        <td>User_ID:</td>
                        <td><asp:Label ID="User_IDLabel1" runat="server" Text='<%# Eval("User_ID") %>' /></td>
                    </tr>
                    <tr>
                        <td>User_ScreenName:</td>
                        <td><asp:Label ID="User_ScreenNamelbl" runat="server" Text='<%# Eval("User_ScreenName") %>' /></td>
                    </tr>
                    <tr>
                        <td>User_FName:</td>
                        <td><asp:TextBox ID="User_FNameTextBox" runat="server" Text='<%# Bind("User_FName") %>'  Width="379px"/></td>
                    </tr>
                    <tr>
                        <td>User_LName:</td>
                        <td><asp:TextBox ID="User_LNameTextBox" runat="server" Text='<%# Bind("User_LName") %>'  Width="379px"/></td>
                    </tr>
                    <tr>
                        <td>User_Email:</td>
                        <td><asp:TextBox ID="User_EmailTextBox" runat="server" Text='<%# Bind("User_Email") %>' Width="379px" /></td>
                    </tr>
                    <tr>
                        <td>User_Password:</td>
                        <td><asp:TextBox ID="User_PasswordTextBox" runat="server" Text='<%# Bind("User_Password") %>' Width="379px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <table border="1" style="width:100%;">
                    <tr>
                        <td>User_ID:</td>
                        <td> <asp:Label ID="User_IDLabel" runat="server" Text='<%# Eval("User_ID") %>' /></td>
                    </tr>
                    <tr>
                        <td>User_ScreenName:</td>
                        <td><asp:Label ID="User_ScreenNameLabel" runat="server" Text='<%# Bind("User_ScreenName") %>' /></td>
                    </tr>
                    <tr>
                        <td>User_FName:</td>
                        <td><asp:Label ID="User_FNameLabel" runat="server" Text='<%# Bind("User_FName") %>' /></td>
                    </tr>
                    <tr>
                        <td>User_LName:</td>
                        <td><asp:Label ID="User_LNameLabel" runat="server" Text='<%# Bind("User_LName") %>' /></td>
                    </tr>
                    <tr>
                        <td>User_Email:</td>
                        <td><asp:Label ID="User_EmailLabel" runat="server" Text='<%# Bind("User_Email") %>' /></td>
                    </tr>
                    <tr>
                        <td>User_Password:</td>
                        <td><asp:Label ID="User_PasswordLabel" runat="server" Text='<%# Bind("User_Password") %>' /></td>
                    </tr>
                    <tr>
                        <td><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" /></td>
                    </tr>
                </table
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" 
            DeleteCommand="DELETE FROM [User] WHERE [User_ID] = @User_ID" 
            InsertCommand="INSERT INTO [User] ([User_ScreenName], [User_FName], [User_LName], [User_Email], [User_Password]) VALUES (@User_ScreenName, @User_FName, @User_LName, @User_Email, @User_Password)" 
            SelectCommand="SELECT [User_ID], [User_ScreenName], [User_FName], [User_LName], [User_Email], [User_Password] FROM [User] WHERE ([User_ID] = @User_ID)" 
            UpdateCommand="UPDATE [User] SET [User_FName] = @User_FName, [User_LName] = @User_LName, [User_Email] = @User_Email, [User_Password] = @User_Password WHERE [User_ID] = @User_ID">
            <DeleteParameters>
                <asp:Parameter Name="User_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_ScreenName" Type="String" />
                <asp:Parameter Name="User_FName" Type="String" />
                <asp:Parameter Name="User_LName" Type="String" />
                <asp:Parameter Name="User_Email" Type="String" />
                <asp:Parameter Name="User_Password" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="User_ID" SessionField="UserID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_ScreenName" Type="String" />
                <asp:Parameter Name="User_FName" Type="String" />
                <asp:Parameter Name="User_LName" Type="String" />
                <asp:Parameter Name="User_Email" Type="String" />
                <asp:Parameter Name="User_Password" Type="String" />
                <asp:Parameter Name="User_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
