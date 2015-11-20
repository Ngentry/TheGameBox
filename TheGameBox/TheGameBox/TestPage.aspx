<%@ Page Title="" Language="C#" MasterPageFile="~/WebPage.Master" AutoEventWireup="true" CodeBehind="TestPage.aspx.cs" Inherits="TheGameBox.WebForm1" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td>
                    <h2>Calander</h2>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="488px" NextPrevFormat="ShortMonth" Width="517px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                        <DayStyle BackColor="#CCCCCC" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                    </asp:Calendar>
                    <asp:Button ID="AddEventBtn" runat="server" Text="Add Event" />
                    <asp:Button ID="RemoveEventBtn" runat="server" Text="Remove Event" />

                </td>

                <td>
                    <h2>Agenda for DateStart to DateEnd</h2>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="432px" Width="459px"></asp:TextBox></td>
            </tr>

        </table>
    </form>
</asp:Content>
