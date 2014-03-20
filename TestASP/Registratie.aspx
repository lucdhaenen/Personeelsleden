<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registratie.aspx.cs" Inherits="TestASP.Registratie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:AccessDataSource ID="AccessDataSourcePersoon" runat="server" 
        DataFile="~/App_Data/afdelingen.mdb" 
        
        SelectCommand="SELECT [nummer], [naam], [voornaam] FROM [Personen]">
        <SelectParameters>
            <asp:ControlParameter ControlID="LabelNaam" Name="naam" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="LabelVoornaam" Name="voornaam" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        RequireEmail="False" oncreateduser="CreateUserWizard1_CreatedUser" 
        CancelDestinationPageUrl="~/Default.aspx" 
        ContinueDestinationPageUrl="~/Personeelsleden/LoggedIn.aspx">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" colspan="2">
                                Sign Up for Your New Account</td>
                        </tr>
                        <tr>
                            <td align="right">
                                Username (voornaam.familienaam) :</td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ErrorMessage="voornaam.familienaam" ControlToValidate="UserName" 
                                    ValidationGroup="CreateUserWizard1" ValidationExpression="[a-zA-Z]+\.[a-zA-Z]+">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Password (familienaam_personeelsnummer) :</td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                    ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ErrorMessage="familienaam_personeelsnummer" 
                                    ValidationExpression="[a-zA-Z_]+[0-9]" ValidationGroup="CreateUserWizardStep1" 
                                    ControlToValidate="Password">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Herhaal familienaam_personeelsnummer :</td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Confirm Password is required." 
                                    ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                    ControlToValidate="ConfirmPassword" ErrorMessage="familienaam_personeelsnummer" 
                                    ValidationExpression="[a-zA-Z_]+[0-9]" ValidationGroup="CreateUserWizard1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>                        
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                    ControlToValidate="Question" ErrorMessage="Security question is required." 
                                    ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                    ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                    ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <CustomNavigationTemplate>
                    <table border="0" cellspacing="5" style="width:100%;height:100%;">
                        <tr align="right">
                            <td align="right" colspan="0">
                                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" />
                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                                    Text="Create User" ValidationGroup="CreateUserWizard1" Width="102px" />
                            </td>
                        </tr>
                    </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
        <StartNavigationTemplate>
            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                Text="Next" PostBackUrl="~/Personeelsleden/LoggedIn.aspx" />
        </StartNavigationTemplate>
    </asp:CreateUserWizard>
    <asp:Label ID="LabelVoornaam" runat="server" Text="Label" Visible="False"></asp:Label><br />
    <asp:Label ID="LabelNaam" runat="server" Text="Label" Visible="False"></asp:Label><br />
    <asp:Label ID="LabelPersNr" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content>
