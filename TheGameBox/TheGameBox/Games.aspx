<%@ Page Title="" Language="C#" MasterPageFile="~/WebPage.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="TheGameBox.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Games Available</h2>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" DataKeyNames="Game_Id" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
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
        DeleteCommand="DELETE FROM [Games] WHERE [Game_Id] = @Game_Id" 
        InsertCommand="INSERT INTO [Games] ([Game_Title], [Game_Version]) VALUES (@Game_Title, @Game_Version)" 
        SelectCommand="SELECT [Game_Id], [Game_Title], [Game_Version] FROM [Games]" 
        UpdateCommand="UPDATE [Games] SET [Game_Title] = @Game_Title, [Game_Version] = @Game_Version WHERE [Game_Id] = @Game_Id">
        <DeleteParameters>
            <asp:Parameter Name="Game_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Game_Title" Type="String" />
            <asp:Parameter Name="Game_Version" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Game_Title" Type="String" />
            <asp:Parameter Name="Game_Version" Type="Decimal" />
            <asp:Parameter Name="Game_Id" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>
    <br />
    <asp:Label ID="lblDB" runat="server" Visible="false" Text=""></asp:Label>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="485px">

         <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
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
                     <td>Game ID</td>
                     <td><asp:Label ID="Label1" runat="server" Text='<%# Bind("Game_Id") %>'></asp:Label></td>
                 </tr>
                 <tr>
                     <td>Game Title</td>
                    <td><asp:Label ID="Label2" runat="server" Text='<%# Bind("Game_Title") %>'></asp:Label></td>
                 </tr>
                 <tr>
                     <td>Game Genre</td>
                     <td><asp:Label ID="Label3" runat="server" Text='<%# Bind("Gane_Genre") %>'></asp:Label></td>
                 </tr>
                 <tr>
                     <td>Game Publisher</td>
                     <td><asp:Label ID="Label4" runat="server" Text='<%# Bind("Game_Publisher") %>'></asp:Label></td>
                 </tr>
                 <tr>
                     <td>Game Author</td>
                     <td><asp:Label ID="Label5" runat="server" Text='<%# Bind("Game_Author") %>'></asp:Label></td>
                 </tr>
                 <tr>
                     <td>Game Version</td>
                     <td><asp:Label ID="Label6" runat="server" Text='<%# Bind("Game_Version") %>'></asp:Label></td>
                 </tr>
                 <tr>
                     <td>Minimum Players</td>
                     <td><asp:Label ID="Label8" runat="server" Text='<%# Bind("Game_MinPlayers") %>'></asp:Label></td>
                 </tr>
                 <tr>
                     <td>Maximum Players </td>
                     <td><asp:Label ID="Label9" runat="server" Text='<%# Bind("Game_MaxPlayers") %>'></asp:Label></td>
                 </tr>
                 <tr>
                     <td>Game Description</td>
                     <td><asp:Label ID="Label10" runat="server" Text='<%# Bind("Game_Description") %>'></asp:Label></td>
                 </tr>
             </table>
              <asp:LinkButton ID="btnInsert" runat="server" CausesValidation="false" OnClick="lblInsert_Click" Text="Add To Your Games"></asp:LinkButton>
         </ItemTemplate>
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
                     <td>Game ID</td>
                     <td><asp:Label ID="Label1" runat="server" Text='<%# Bind("Game_Id") %>' ></asp:Label></td>
                 </tr>
                 <tr>
                     <td>Game Title</td>
                    <td><asp:TextBox ID="Label2" runat="server" Text='<%# Bind("Game_Title") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Genre</td>
                     <td><asp:TextBox ID="Label3" runat="server" Text='<%# Bind("Gane_Genre") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Publisher</td>
                     <td><asp:TextBox ID="Label4" runat="server" Text='<%# Bind("Game_Publisher") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Author</td>
                     <td><asp:TextBox ID="Label5" runat="server" Text='<%# Bind("Game_Author") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Version</td>
                     <td><asp:TextBox ID="Label6" runat="server" Text='<%# Bind("Game_Version") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Minimum Players</td>
                     <td><asp:TextBox ID="Label8" runat="server" Text='<%# Bind("Game_MinPlayers") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Maximum Players </td>
                     <td><asp:TextBox ID="Label9" runat="server" Text='<%# Bind("Game_MaxPlayers") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Description</td>
                     <td><asp:TextBox ID="Label10" runat="server" Text='<%# Bind("Game_Description") %>' Height="87px" TextMode="MultiLine" Width="334px"></asp:TextBox></td>
                 </tr>
             </table>
             <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="false" CommandName="Update" Text="Update"></asp:LinkButton>
              <asp:LinkButton ID="btnCancel" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
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
                     <td>Game Title</td>
                    <td><asp:TextBox ID="Label2" runat="server" Text='<%# Bind("Game_Title") %>'></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Genre</td>
                     <td><asp:TextBox ID="Label23" runat="server" Text='<%# Bind("Gane_Genre") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Publisher</td>
                     <td><asp:TextBox ID="Label4" runat="server" Text='<%# Bind("Game_Publisher") %>' Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Author</td>
                     <td><asp:TextBox ID="Label5" runat="server" Text='<%# Bind("Game_Author") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Version</td>
                     <td><asp:TextBox ID="Label6" runat="server" Text='<%# Bind("Game_Version") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Minimum Players</td>
                     <td><asp:TextBox ID="Label8" runat="server" Text='<%# Bind("Game_MinPlayers") %>'  Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Maximum Players </td>
                     <td><asp:TextBox ID="Label9" runat="server" Text='<%# Bind("Game_MaxPlayers") %>' Width="334px"></asp:TextBox></td>
                 </tr>
                 <tr>
                     <td>Game Description</td>
                     <td><asp:TextBox ID="Label10" runat="server" Text='<%# Bind("Game_Description") %>'  Height="87px" TextMode="MultiLine" Width="334px"></asp:TextBox></td>
                 </tr>
             </table>
             <asp:LinkButton ID="btnInsert" runat="server" CausesValidation="false" CommandName="Insert" Text="Insert"></asp:LinkButton>
              <asp:LinkButton ID="btnInsertCancel" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
        </InsertItemTemplate>
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" 
        DeleteCommand="DELETE FROM [Games] WHERE [Game_Id] = @Game_Id" 
        InsertCommand="INSERT INTO [Games_Owned] ([User_ID], [Game_ID]) VALUES (@User_ID, @Game_ID)"
        SelectCommand="SELECT [Game_Id], [Game_Title], [Gane_Genre], [Game_Publisher], [Game_Author], [Game_Version], [Game_Image], [Game_MinPlayers], [Game_MaxPlayers], [Game_Description] FROM [Games] WHERE ([Game_Id] = @Game_Id)" 
        UpdateCommand="UPDATE [Games] SET [Game_Title] = @Game_Title, [Gane_Genre] = @Gane_Genre, [Game_Publisher] = @Game_Publisher, [Game_Author] = @Game_Author, [Game_Version] = @Game_Version, [Game_Image] = @Game_Image, [Game_MinPlayers] = @Game_MinPlayers, [Game_MaxPlayers] = @Game_MaxPlayers, [Game_Description] = @Game_Description WHERE [Game_Id] = @Game_Id">
        <DeleteParameters>
            <asp:Parameter Name="Game_Id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Game_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Game_Title" Type="String" />
            <asp:Parameter Name="Gane_Genre" Type="String" />
            <asp:Parameter Name="Game_Publisher" Type="String" />
            <asp:Parameter Name="Game_Author" Type="String" />
            <asp:Parameter Name="Game_Version" Type="Decimal" />
            <asp:Parameter Name="Game_Image" Type="String" />
            <asp:Parameter Name="Game_MinPlayers" Type="Int32" />
            <asp:Parameter Name="Game_MaxPlayers" Type="Int32" />
            <asp:Parameter Name="Game_Description" Type="String" />
            <asp:Parameter Name="Game_Id" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
