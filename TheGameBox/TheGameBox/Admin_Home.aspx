<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="Admin_Home.aspx.cs" Inherits="TheGameBox.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> 
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:FileUpload ID="FileUploadControl" runat="server" ToolTip="Please Select a .jpg to upload" />
            <br />
            <asp:Button ID="btnUpdateImage" runat="server" Text="Upload" OnClick="btnUpdateImage_Click" />
            <asp:Label ID="lblError" runat="server" Text="Please Upload a JPG File." Visible="False" ForeColor="#CC0000"></asp:Label>
            <br />
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
            &nbsp;
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" DeleteCommand="DELETE FROM [Admin] WHERE [Admin_AdminID] = @Admin_AdminID" InsertCommand="INSERT INTO [Admin] ([Admin_AdminName], [Admin_FName], [Admin_LName], [Admin_Email], [Admin_Password]) VALUES (@Admin_AdminName, @Admin_FName, @Admin_LName, @Admin_Email, @Admin_Password)" SelectCommand="SELECT * FROM [Admin] WHERE ([Admin_AdminID] = @Admin_AdminID)" UpdateCommand="UPDATE [Admin] SET [Admin_AdminName] = @Admin_AdminName, [Admin_FName] = @Admin_FName, [Admin_LName] = @Admin_LName, [Admin_Email] = @Admin_Email, [Admin_Password] = @Admin_Password WHERE [Admin_AdminID] = @Admin_AdminID">
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
            <asp:SessionParameter DefaultValue="1" Name="Admin_AdminID" SessionField="UserID" Type="Int32" />
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
     
    </form>
</asp:Content>
