<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="User_Control.aspx.cs" Inherits="TheGameBox.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <h2>User Access</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="User_ID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" ShowFooter="True">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="User_ID" InsertVisible="False" SortExpression="User_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("User_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="btnInsert" runat="server" OnClick="lblInsert_Click">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User_ScreenName" SortExpression="User_ScreenName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("User_ScreenName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("User_ScreenName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User_FName" SortExpression="User_FName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("User_FName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("User_FName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User_LName" SortExpression="User_LName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("User_LName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("User_LName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User_Email" SortExpression="User_Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("User_Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("User_Email") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User_Password" SortExpression="User_Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("User_Password") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("User_Password") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
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
        <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" 
                DeleteCommand="DELETE FROM [User] WHERE [User_ID] = @original_User_ID AND [User_ScreenName] = @original_User_ScreenName AND [User_FName] = @original_User_FName AND [User_LName] = @original_User_LName AND [User_Email] = @original_User_Email AND [User_Password] = @original_User_Password" 
                InsertCommand="INSERT INTO [User] ([User_ScreenName], [User_FName], [User_LName], [User_Email], [User_Password]) VALUES (@User_ScreenName, @User_FName, @User_LName, @User_Email, @User_Password)" 
                SelectCommand="SELECT [User_ID], [User_ScreenName], [User_FName], [User_LName], [User_Email], [User_Password] FROM [User]" 
                UpdateCommand="UPDATE [User] SET [User_ScreenName] = @User_ScreenName, [User_FName] = @User_FName, [User_LName] = @User_LName, [User_Email] = @User_Email, [User_Password] = @User_Password WHERE [User_ID] = @original_User_ID AND [User_ScreenName] = @original_User_ScreenName AND [User_FName] = @original_User_FName AND [User_LName] = @original_User_LName AND [User_Email] = @original_User_Email AND [User_Password] = @original_User_Password" 
                ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_User_ID" Type="Int32" />
            <asp:Parameter Name="original_User_ScreenName" Type="String" />
            <asp:Parameter Name="original_User_FName" Type="String" />
            <asp:Parameter Name="original_User_LName" Type="String" />
            <asp:Parameter Name="original_User_Email" Type="String" />
            <asp:Parameter Name="original_User_Password" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="User_ScreenName" Type="String" />
            <asp:Parameter Name="User_FName" Type="String" />
            <asp:Parameter Name="User_LName" Type="String" />
            <asp:Parameter Name="User_Email" Type="String" />
            <asp:Parameter Name="User_Password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="User_ScreenName" Type="String" />
            <asp:Parameter Name="User_FName" Type="String" />
            <asp:Parameter Name="User_LName" Type="String" />
            <asp:Parameter Name="User_Email" Type="String" />
            <asp:Parameter Name="User_Password" Type="String" />
            <asp:Parameter Name="original_User_ID" Type="Int32" />
            <asp:Parameter Name="original_User_ScreenName" Type="String" />
            <asp:Parameter Name="original_User_FName" Type="String" />
            <asp:Parameter Name="original_User_LName" Type="String" />
            <asp:Parameter Name="original_User_Email" Type="String" />
            <asp:Parameter Name="original_User_Password" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
