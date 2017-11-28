<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressBook.aspx.cs" Inherits="LamichhaneAngat_AddressBooks.AddressBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 30px;
        }
        .auto-style4 {
            width: 105px;
        }
        .auto-style5 {
            height: 30px;
            width: 105px;
        }
        .auto-style6 {
            height: 23px;
            width: 105px;
        }
        .auto-style7 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">First Name:
                    </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="232px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Last name:
                    </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="231px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Email:
                    </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="230px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Phone:&nbsp;
                    </td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox4" runat="server" Width="228px"></asp:TextBox>
                </td>
            </tr>
            <tr>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="NextButton" runat="server" OnClick="NextButton_Click" Text="Next" Width="54px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="PreviousButton" runat="server" OnClick="PreviousButton_Click" Text="Previous" />
&nbsp;&nbsp;&nbsp;&nbsp;
                  
                    <asp:Button ID="FirstButton" runat="server" OnClick="FirstButton_Click" Text="First" Width="48px" />
                  
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="ClearButton" runat="server" OnClick="ClearButton_Click" Text="Clear" Width="54px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="AddButton" runat="server" OnClick="AddButton_Click" Text="Add" Width="75px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="FindButton" runat="server" CssClass="auto-style7" OnClick="FindButton_Click" Text="Find" Width="47px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="DeleteButton" runat="server" OnClick="DeleteButton_Click" Text="Delete" Height="26px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="UpdateButton" runat="server" OnClick="UpdateButton_Click" Text="Update" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox5" runat="server" OnTextChanged="TextBox5_TextChanged" Visible="False" Width="205px"></asp:TextBox>
                </td>
            </tr>
        </table>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Addresses] WHERE [AddressID] = @AddressID" InsertCommand="INSERT INTO [Addresses] ([FirstName], [LastName], [Email], [PhoneNumber]) VALUES (@FirstName, @LastName, @Email, @PhoneNumber)" SelectCommand="SELECT * FROM [Addresses]" UpdateCommand="UPDATE [Addresses] SET [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [PhoneNumber] = @PhoneNumber WHERE [AddressID] = @AddressID">
            <DeleteParameters>
                <asp:Parameter Name="AddressID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="AddressID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
