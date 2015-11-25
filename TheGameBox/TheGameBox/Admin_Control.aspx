<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="Admin_Control.aspx.cs" Inherits="TheGameBox.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Admin Users</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
        BorderWidth="1px" CellPadding="3" DataKeyNames="Admin_AdminID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" ShowFooter="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="Admin_AdminID" InsertVisible="False" SortExpression="Admin_AdminID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Admin_AdminID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Admin_AdminID") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lblInsert_Click">Intert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Admin_AdminName" SortExpression="Admin_AdminName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Admin_AdminName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Admin_AdminName") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                     <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Admin_FName" SortExpression="Admin_FName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Admin_FName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Admin_FName") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                     <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Admin_LName" SortExpression="Admin_LName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Admin_LName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Admin_LName") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                     <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Admin_Email" SortExpression="Admin_Email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Admin_Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Admin_Email") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                     <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Admin_Password" SortExpression="Admin_Password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Admin_Password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Admin_Password") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                     <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" 
                DeleteCommand="DELETE FROM [Admin] WHERE [Admin_AdminID] = @original_Admin_AdminID AND [Admin_AdminName] = @original_Admin_AdminName AND [Admin_FName] = @original_Admin_FName AND [Admin_LName] = @original_Admin_LName AND [Admin_Email] = @original_Admin_Email AND [Admin_Password] = @original_Admin_Password" 
                InsertCommand="INSERT INTO [Admin] ([Admin_AdminName], [Admin_FName], [Admin_LName], [Admin_Email], [Admin_Password]) VALUES (@Admin_AdminName, @Admin_FName, @Admin_LName, @Admin_Email, @Admin_Password)" 
                SelectCommand="SELECT [Admin_AdminID], [Admin_AdminName], [Admin_FName], [Admin_LName], [Admin_Email], [Admin_Password] FROM [Admin]"
                UpdateCommand="UPDATE [Admin] SET [Admin_AdminName] = @Admin_AdminName, [Admin_FName] = @Admin_FName, [Admin_LName] = @Admin_LName, [Admin_Email] = @Admin_Email, [Admin_Password] = @Admin_Password WHERE [Admin_AdminID] = @original_Admin_AdminID AND [Admin_AdminName] = @original_Admin_AdminName AND [Admin_FName] = @original_Admin_FName AND [Admin_LName] = @original_Admin_LName AND [Admin_Email] = @original_Admin_Email AND [Admin_Password] = @original_Admin_Password" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_Admin_AdminID" Type="Int32" />
            <asp:Parameter Name="original_Admin_AdminName" Type="String" />
            <asp:Parameter Name="original_Admin_FName" Type="String" />
            <asp:Parameter Name="original_Admin_LName" Type="String" />
            <asp:Parameter Name="original_Admin_Email" Type="String" />
            <asp:Parameter Name="original_Admin_Password" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Admin_AdminName" Type="String" />
            <asp:Parameter Name="Admin_FName" Type="String" />
            <asp:Parameter Name="Admin_LName" Type="String" />
            <asp:Parameter Name="Admin_Email" Type="String" />
            <asp:Parameter Name="Admin_Password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Admin_AdminName" Type="String" />
            <asp:Parameter Name="Admin_FName" Type="String" />
            <asp:Parameter Name="Admin_LName" Type="String" />
            <asp:Parameter Name="Admin_Email" Type="String" />
            <asp:Parameter Name="Admin_Password" Type="String" />
            <asp:Parameter Name="original_Admin_AdminID" Type="Int32" />
            <asp:Parameter Name="original_Admin_AdminName" Type="String" />
            <asp:Parameter Name="original_Admin_FName" Type="String" />
            <asp:Parameter Name="original_Admin_LName" Type="String" />
            <asp:Parameter Name="original_Admin_Email" Type="String" />
            <asp:Parameter Name="original_Admin_Password" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
