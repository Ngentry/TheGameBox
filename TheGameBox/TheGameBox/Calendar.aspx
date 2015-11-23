<%@ Page Title="" Language="C#" MasterPageFile="~/WebPage.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="TheGameBox.WebForm1" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td>
                    <h2>Calendar</h2>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="452px" NextPrevFormat="ShortMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="468px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                        <DayStyle BackColor="#CCCCCC" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                        <TodayDayStyle BackColor="#999999" ForeColor="White" />
                    </asp:Calendar>
                    <asp:Button ID="AddEventBtn" runat="server" Text="Add Event" OnClick="AddEventBtn_Click" />
                    <asp:Button ID="RemoveEventBtn" runat="server" Text="Remove Event" OnClick="RemoveEventBtn_Click" />

                </td>

                <td>
                    <h2>Agenda for <asp:Label ID="DateStartLbl" runat="server" Text="Label"></asp:Label> - <asp:Label ID="DateEndLbl" runat="server" Text="Label"></asp:Label></h2>
                <asp:TextBox ID="AgendaBox" runat="server" TextMode="MultiLine" Height="432px" Width="459px"></asp:TextBox></td>
            </tr>

            <tr>
                <td>
                    <br />
                    <br />
                    <asp:Panel ID="AddEventPanel" runat="server" Visible="False">
                        <table style="width:100%;">
                            <tr>
                                <td style="width: 194px">Add Event</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 194px">Event Date</td>
                                <td>
                                    <asp:TextBox ID="EventDateTxtBx" runat="server" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 194px">Event Name</td>
                                <td>
                                    <asp:TextBox ID="EventNameTxtBox" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 194px">Event Description</td>
                                <td>
                                    <asp:TextBox ID="EventDescriptionTxtBox" runat="server" Height="74px" TextMode="MultiLine" Width="334px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 194px">Time Start</td>
                                <td>
                                    <asp:DropDownList ID="TimeStartDrpList" runat="server" Width="172px">
                                        <asp:ListItem>12:00 AM</asp:ListItem>
                                        <asp:ListItem>12:15 AM</asp:ListItem>
                                        <asp:ListItem>12: 30 AM</asp:ListItem>
                                        <asp:ListItem>12:45 AM</asp:ListItem>
                                        <asp:ListItem>1:00 AM</asp:ListItem>
                                        <asp:ListItem>1:15 AM</asp:ListItem>
                                        <asp:ListItem>1:30 AM</asp:ListItem>
                                        <asp:ListItem>1:45 AM</asp:ListItem>
                                        <asp:ListItem>2:00 AM</asp:ListItem>
                                        <asp:ListItem>2:15 AM</asp:ListItem>
                                        <asp:ListItem>2:30 AM</asp:ListItem>
                                        <asp:ListItem>2:45 AM</asp:ListItem>
                                        <asp:ListItem>3:00 AM</asp:ListItem>
                                        <asp:ListItem>3:15 AM</asp:ListItem>
                                        <asp:ListItem>3:30 AM</asp:ListItem>
                                        <asp:ListItem>3:45 AM</asp:ListItem>
                                        <asp:ListItem>4:00 AM</asp:ListItem>
                                        <asp:ListItem>4:15 AM</asp:ListItem>
                                        <asp:ListItem>4:30 AM</asp:ListItem>
                                        <asp:ListItem>4:45 AM</asp:ListItem>
                                        <asp:ListItem>5:00 AM</asp:ListItem>
                                        <asp:ListItem>5:15 AM</asp:ListItem>
                                        <asp:ListItem>5:30 AM</asp:ListItem>
                                        <asp:ListItem>5:45 AM</asp:ListItem>
                                        <asp:ListItem>6:00 AM</asp:ListItem>
                                        <asp:ListItem>6:15 AM</asp:ListItem>
                                        <asp:ListItem>6:30 AM</asp:ListItem>
                                        <asp:ListItem>6:45 AM</asp:ListItem>
                                        <asp:ListItem>7:00 AM</asp:ListItem>
                                        <asp:ListItem>7:15 AM</asp:ListItem>
                                        <asp:ListItem>7:30 AM</asp:ListItem>
                                        <asp:ListItem>7:45 AM</asp:ListItem>
                                        <asp:ListItem>8:00 AM</asp:ListItem>
                                        <asp:ListItem>8:15 AM</asp:ListItem>
                                        <asp:ListItem>8:30 AM</asp:ListItem>
                                        <asp:ListItem>8:45 AM</asp:ListItem>
                                        <asp:ListItem>9:00 AM</asp:ListItem>
                                        <asp:ListItem>9:15 AM</asp:ListItem>
                                        <asp:ListItem>9:30 AM</asp:ListItem>
                                        <asp:ListItem>9:45 AM</asp:ListItem>
                                        <asp:ListItem>10:00 AM</asp:ListItem>
                                        <asp:ListItem>10:15 AM</asp:ListItem>
                                        <asp:ListItem>10:45 AM</asp:ListItem>
                                        <asp:ListItem>11:00 AM</asp:ListItem>
                                        <asp:ListItem>11:15 AM</asp:ListItem>
                                        <asp:ListItem>11:30 AM</asp:ListItem>
                                        <asp:ListItem>11:45 AM</asp:ListItem>
                                        <asp:ListItem>12:00 PM</asp:ListItem>
                                        <asp:ListItem>12:15 PM</asp:ListItem>
                                        <asp:ListItem>12:30 PM</asp:ListItem>
                                        <asp:ListItem>12:45 PM</asp:ListItem>
                                        <asp:ListItem>1:00 PM</asp:ListItem>
                                        <asp:ListItem>1:15 PM</asp:ListItem>
                                        <asp:ListItem>1:30 PM</asp:ListItem>
                                        <asp:ListItem>1:45 PM</asp:ListItem>
                                        <asp:ListItem>2:00 PM</asp:ListItem>
                                        <asp:ListItem>2:15 PM</asp:ListItem>
                                        <asp:ListItem>2:30 PM</asp:ListItem>
                                        <asp:ListItem>2:45 PM</asp:ListItem>
                                        <asp:ListItem>3:00 PM</asp:ListItem>
                                        <asp:ListItem>3:15 PM</asp:ListItem>
                                        <asp:ListItem>3:30 PM</asp:ListItem>
                                        <asp:ListItem>3:45 PM</asp:ListItem>
                                        <asp:ListItem>4:00 PM</asp:ListItem>
                                        <asp:ListItem>4:15 PM</asp:ListItem>
                                        <asp:ListItem>4:30 PM</asp:ListItem>
                                        <asp:ListItem>4:45 PM</asp:ListItem>
                                        <asp:ListItem>5:00 PM</asp:ListItem>
                                        <asp:ListItem>5:15 PM</asp:ListItem>
                                        <asp:ListItem>5:30 PM</asp:ListItem>
                                        <asp:ListItem>5:45 PM</asp:ListItem>
                                        <asp:ListItem>6:00 PM</asp:ListItem>
                                        <asp:ListItem>6:15 PM</asp:ListItem>
                                        <asp:ListItem>6:30 PM</asp:ListItem>
                                        <asp:ListItem>6:45 PM</asp:ListItem>
                                        <asp:ListItem>7:00 PM</asp:ListItem>
                                        <asp:ListItem>7:15 PM</asp:ListItem>
                                        <asp:ListItem>7:30 PM</asp:ListItem>
                                        <asp:ListItem>7:45 PM</asp:ListItem>
                                        <asp:ListItem>8:00 PM</asp:ListItem>
                                        <asp:ListItem>8:15 PM</asp:ListItem>
                                        <asp:ListItem>8:30 PM</asp:ListItem>
                                        <asp:ListItem>8:45 PM</asp:ListItem>
                                        <asp:ListItem>9:00 PM</asp:ListItem>
                                        <asp:ListItem>9:15 PM</asp:ListItem>
                                        <asp:ListItem>9:30 PM</asp:ListItem>
                                        <asp:ListItem>9:45 PM</asp:ListItem>
                                        <asp:ListItem>10:00 PM</asp:ListItem>
                                        <asp:ListItem>10:15 PM</asp:ListItem>
                                        <asp:ListItem>10:30 PM</asp:ListItem>
                                        <asp:ListItem>10:45 PM</asp:ListItem>
                                        <asp:ListItem>11:00 PM</asp:ListItem>
                                        <asp:ListItem>11:15 PM</asp:ListItem>
                                        <asp:ListItem>11:30 PM</asp:ListItem>
                                        <asp:ListItem>11:45 PM</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 194px">Time End</td>
                                <td>
                                    <asp:DropDownList ID="TimeEndDrpList" runat="server" Width="172px">
                                        <asp:ListItem>12:00 AM</asp:ListItem>
                                        <asp:ListItem>12:15 AM</asp:ListItem>
                                        <asp:ListItem>12: 30 AM</asp:ListItem>
                                        <asp:ListItem>12:45 AM</asp:ListItem>
                                        <asp:ListItem>1:00 AM</asp:ListItem>
                                        <asp:ListItem>1:15 AM</asp:ListItem>
                                        <asp:ListItem>1:30 AM</asp:ListItem>
                                        <asp:ListItem>1:45 AM</asp:ListItem>
                                        <asp:ListItem>2:00 AM</asp:ListItem>
                                        <asp:ListItem>2:15 AM</asp:ListItem>
                                        <asp:ListItem>2:30 AM</asp:ListItem>
                                        <asp:ListItem>2:45 AM</asp:ListItem>
                                        <asp:ListItem>3:00 AM</asp:ListItem>
                                        <asp:ListItem>3:15 AM</asp:ListItem>
                                        <asp:ListItem>3:30 AM</asp:ListItem>
                                        <asp:ListItem>3:45 AM</asp:ListItem>
                                        <asp:ListItem>4:00 AM</asp:ListItem>
                                        <asp:ListItem>4:15 AM</asp:ListItem>
                                        <asp:ListItem>4:30 AM</asp:ListItem>
                                        <asp:ListItem>4:45 AM</asp:ListItem>
                                        <asp:ListItem>5:00 AM</asp:ListItem>
                                        <asp:ListItem>5:15 AM</asp:ListItem>
                                        <asp:ListItem>5:30 AM</asp:ListItem>
                                        <asp:ListItem>5:45 AM</asp:ListItem>
                                        <asp:ListItem>6:00 AM</asp:ListItem>
                                        <asp:ListItem>6:15 AM</asp:ListItem>
                                        <asp:ListItem>6:30 AM</asp:ListItem>
                                        <asp:ListItem>6:45 AM</asp:ListItem>
                                        <asp:ListItem>7:00 AM</asp:ListItem>
                                        <asp:ListItem>7:15 AM</asp:ListItem>
                                        <asp:ListItem>7:30 AM</asp:ListItem>
                                        <asp:ListItem>7:45 AM</asp:ListItem>
                                        <asp:ListItem>8:00 AM</asp:ListItem>
                                        <asp:ListItem>8:15 AM</asp:ListItem>
                                        <asp:ListItem>8:30 AM</asp:ListItem>
                                        <asp:ListItem>8:45 AM</asp:ListItem>
                                        <asp:ListItem>9:00 AM</asp:ListItem>
                                        <asp:ListItem>9:15 AM</asp:ListItem>
                                        <asp:ListItem>9:30 AM</asp:ListItem>
                                        <asp:ListItem>9:45 AM</asp:ListItem>
                                        <asp:ListItem>10:00 AM</asp:ListItem>
                                        <asp:ListItem>10:15 AM</asp:ListItem>
                                        <asp:ListItem>10:45 AM</asp:ListItem>
                                        <asp:ListItem>11:00 AM</asp:ListItem>
                                        <asp:ListItem>11:15 AM</asp:ListItem>
                                        <asp:ListItem>11:30 AM</asp:ListItem>
                                        <asp:ListItem>11:45 AM</asp:ListItem>
                                        <asp:ListItem>12:00 PM</asp:ListItem>
                                        <asp:ListItem>12:15 PM</asp:ListItem>
                                        <asp:ListItem>12:30 PM</asp:ListItem>
                                        <asp:ListItem>12:45 PM</asp:ListItem>
                                        <asp:ListItem>1:00 PM</asp:ListItem>
                                        <asp:ListItem>1:15 PM</asp:ListItem>
                                        <asp:ListItem>1:30 PM</asp:ListItem>
                                        <asp:ListItem>1:45 PM</asp:ListItem>
                                        <asp:ListItem>2:00 PM</asp:ListItem>
                                        <asp:ListItem>2:15 PM</asp:ListItem>
                                        <asp:ListItem>2:30 PM</asp:ListItem>
                                        <asp:ListItem>2:45 PM</asp:ListItem>
                                        <asp:ListItem>3:00 PM</asp:ListItem>
                                        <asp:ListItem>3:15 PM</asp:ListItem>
                                        <asp:ListItem>3:30 PM</asp:ListItem>
                                        <asp:ListItem>3:45 PM</asp:ListItem>
                                        <asp:ListItem>4:00 PM</asp:ListItem>
                                        <asp:ListItem>4:15 PM</asp:ListItem>
                                        <asp:ListItem>4:30 PM</asp:ListItem>
                                        <asp:ListItem>4:45 PM</asp:ListItem>
                                        <asp:ListItem>5:00 PM</asp:ListItem>
                                        <asp:ListItem>5:15 PM</asp:ListItem>
                                        <asp:ListItem>5:30 PM</asp:ListItem>
                                        <asp:ListItem>5:45 PM</asp:ListItem>
                                        <asp:ListItem>6:00 PM</asp:ListItem>
                                        <asp:ListItem>6:15 PM</asp:ListItem>
                                        <asp:ListItem>6:30 PM</asp:ListItem>
                                        <asp:ListItem>6:45 PM</asp:ListItem>
                                        <asp:ListItem>7:00 PM</asp:ListItem>
                                        <asp:ListItem>7:15 PM</asp:ListItem>
                                        <asp:ListItem>7:30 PM</asp:ListItem>
                                        <asp:ListItem>7:45 PM</asp:ListItem>
                                        <asp:ListItem>8:00 PM</asp:ListItem>
                                        <asp:ListItem>8:15 PM</asp:ListItem>
                                        <asp:ListItem>8:30 PM</asp:ListItem>
                                        <asp:ListItem>8:45 PM</asp:ListItem>
                                        <asp:ListItem>9:00 PM</asp:ListItem>
                                        <asp:ListItem>9:15 PM</asp:ListItem>
                                        <asp:ListItem>9:30 PM</asp:ListItem>
                                        <asp:ListItem>9:45 PM</asp:ListItem>
                                        <asp:ListItem>10:00 PM</asp:ListItem>
                                        <asp:ListItem>10:15 PM</asp:ListItem>
                                        <asp:ListItem>10:30 PM</asp:ListItem>
                                        <asp:ListItem>10:45 PM</asp:ListItem>
                                        <asp:ListItem>11:00 PM</asp:ListItem>
                                        <asp:ListItem>11:15 PM</asp:ListItem>
                                        <asp:ListItem>11:30 PM</asp:ListItem>
                                        <asp:ListItem>11:45 PM</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 33px; width: 194px">
                                    <asp:Button ID="AddEventFinalBtn" runat="server" Text="Add Event" OnClick="AddEventFinalBtn_Click" />
                                </td>
                                <td style="height: 33px">
                                    <asp:Button ID="AddEventCancel" runat="server" OnClick="AddEventCancel_Click" Text="Cancel" Width="112px" />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:Panel>

                        <asp:Panel ID="RemoveEventPanel" runat="server" Visible="False">
                            <table style="width: 101%;">
                                <tr>
                                    <td style="width: 194px">Remove Event</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 194px">Select Event</td>
                                    <td>
                                        <asp:DropDownList ID="RemoveEventDrpDwn" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource1" DataTextField="Calendar_EventName" DataValueField="Calendar_EventID" OnSelectedIndexChanged="RemoveEventDrpDwn_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 194px">Remove Event Summary</td>
                                    <td>
                                        <asp:TextBox ID="RemoveInfoTxtBox" runat="server" Height="73px" ReadOnly="True" TextMode="MultiLine" Width="334px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 194px">
                                        <asp:Button ID="FinalRemoveEventBtn" runat="server" Text="Remove Event" Width="112px" OnClick="FinalRemoveEventBtn_Click" />
                                    </td>
                                    <td>
                                        <asp:Button ID="RemoveCancel" runat="server" Text="Cancel" Width="112px" OnClick="RemoveCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />

                </td>

                <td>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TheGameBoxConnectionString %>" SelectCommand="SELECT * FROM [Calendar] ORDER BY [Calendar_EventDate]"></asp:SqlDataSource>
                        </td>
            </tr>

            <tr>
                <td>
                    &nbsp;</td>

                <td>
                    &nbsp;</td>
            </tr>

        </table>
    </form>
</asp:Content>
