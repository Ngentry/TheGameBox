<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPage.Master" AutoEventWireup="true" CodeBehind="Group_Control.aspx.cs" Inherits="TheGameBox.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h2>Group Control</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="Group_Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" ShowFooter="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="Group_Id" InsertVisible="False" SortExpression="Group_Id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Group_Id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Group_Id") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="btnInsert" runat="server" OnClick="lblInsert_Click">Insert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Group_Name" SortExpression="Group_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Group_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Group_Name") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGroupName" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Group_Creater" SortExpression="Group_Creater">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Group_Creater") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Group_Creater") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGroupCreater" runat="server"></asp:TextBox>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" DeleteCommand="DELETE FROM [Group] WHERE [Group_Id] = @Group_Id" InsertCommand="INSERT INTO [Group] ([Group_Name], [Group_Creater]) VALUES (@Group_Name, @Group_Creater)" SelectCommand="SELECT [Group_Id], [Group_Name], [Group_Creater] FROM [Group] ORDER BY [Group_Id]" UpdateCommand="UPDATE [Group] SET [Group_Name] = @Group_Name, [Group_Creater] = @Group_Creater WHERE [Group_Id] = @Group_Id">
        <DeleteParameters>
            <asp:Parameter Name="Group_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Group_Name" Type="String" />
            <asp:Parameter Name="Group_Creater" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Group_Name" Type="String" />
            <asp:Parameter Name="Group_Creater" Type="Int32" />
            <asp:Parameter Name="Group_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <!--********************************************************************************
        <br /> DEBUGGING CODE
        <asp:Button ID="Button1" runat="server" Text="Button Test" OnClick="Button1_Click" />
        <asp:Label ID="lblDebug" runat="server" Text="Button NOT Pressed"></asp:Label>
        ************************************************************************************-->
    </form>
</asp:Content>
