<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="Admin_Control.aspx.cs" Inherits="TheGameBox.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h2>Admin Control</h2>
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
                    <asp:LinkButton ID="btnInsert" runat="server" OnClick="lblInsert_Click">Insert</asp:LinkButton>
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
                    <asp:TextBox ID="txtAdminName" runat="server"></asp:TextBox>
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
                    <asp:TextBox ID="txtAdminFName" runat="server"></asp:TextBox>
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
                    <asp:TextBox ID="txtAdminLName" runat="server"></asp:TextBox>
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
                    <asp:TextBox ID="txtAdminEmail" runat="server"></asp:TextBox>
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
                    <asp:TextBox ID="txtAdminPass" runat="server"></asp:TextBox>
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
    </form>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" 
        DeleteCommand="DELETE FROM [Admin] WHERE [Admin_AdminID] = @Admin_AdminID" 
        InsertCommand="INSERT INTO [Admin] ([Admin_AdminName], [Admin_FName], [Admin_LName], [Admin_Email], [Admin_Password]) VALUES (@Admin_AdminName, @Admin_FName, @Admin_LName, @Admin_Email, @Admin_Password)" 
        SelectCommand="SELECT [Admin_AdminID], [Admin_AdminName], [Admin_FName], [Admin_LName], [Admin_Email], [Admin_Password] FROM [Admin] WHERE ([Admin_AdminID] &lt;&gt; @Admin_AdminID) ORDER BY [Admin_AdminID]" 
        UpdateCommand="UPDATE [Admin] SET [Admin_AdminName] = @Admin_AdminName, [Admin_FName] = @Admin_FName, [Admin_LName] = @Admin_LName, [Admin_Email] = @Admin_Email, [Admin_Password] = @Admin_Password WHERE [Admin_AdminID] = @Admin_AdminID">
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
</asp:Content>
