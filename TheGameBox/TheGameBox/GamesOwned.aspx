<%@ Page Title="" Language="C#" MasterPageFile="~/WebPage.Master" AutoEventWireup="true" CodeBehind="GamesOwned.aspx.cs" Inherits="TheGameBox.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Label ID="Label2" runat="server" Text="<h2>Your Game Library</h2>" ></asp:Label>
    <asp:Label ID="lblDB" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="Game_Title" SortExpression="Game_Title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Game_Title") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Game_Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Game_Version" SortExpression="Game_Version">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Game_Version") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGameTitle" runat="server" Text='<%# Bind("Game_Version") %>'></asp:Label>
                </ItemTemplate>
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
        DeleteCommand="DELETE FROM Games_Owned WHERE (User_Id = @UserId) AND (Game_ID = @GameID)" 
        SelectCommand="SELECT Games.Game_Title, Games.Game_Version, Games_Owned.User_Id, Games_Owned.Game_ID FROM Games INNER JOIN Games_Owned ON Games.Game_Id = Games_Owned.Game_ID WHERE (Games_Owned.User_Id = @UserID)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="UserID" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
