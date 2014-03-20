<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestASP.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>U kan zich hier 
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registratie.aspx">hier</asp:HyperLink>&nbsp;registreren.</p>
    <p>Indien u al geregistreerd bent kan u zich hieronder aanmelden.</p>
    <asp:Login ID="Login1" runat="server" BorderStyle="Solid" BackColor="Silver" 
        RememberMeSet="False" onloggedin="LoginUser_LoggedIn" 
        DestinationPageUrl="~/Personeelsleden/LoggedIn.aspx" >
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="center" colspan="2">
                                    Log In</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">voornaam.familienaam :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="Gebruikersnaam vereist." 
                                        ToolTip="Gebruikersnaam vereist." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">familienaam_personeelnr :</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Paswoord vereist." 
                                        ToolTip="Paswoord vereist." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                        ValidationGroup="Login1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
    <asp:AccessDataSource ID="AccessDataSourcePersNr" runat="server" 
        DataFile="~/App_Data/afdelingen.mdb" 
        
        SelectCommand="SELECT [nummer] FROM [Personen] WHERE (([voornaam] = ?) AND ([naam] = ?))">
        <SelectParameters>
            <asp:ControlParameter ControlID="LabelVoornaam" Name="voornaam" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LabelNaam" Name="naam" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:Label ID="LabelVoornaam" runat="server" Text="Label" Visible="False"></asp:Label><br />
    <asp:Label ID="LabelNaam" runat="server" Text="Label" Visible="False"></asp:Label><br />
    <asp:Label ID="LabelPersNr" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content>
