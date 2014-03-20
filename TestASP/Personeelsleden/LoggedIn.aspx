<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoggedIn.aspx.cs" Inherits="TestASP.LoggedIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:AccessDataSource ID="AccessDataSourceDetail" runat="server" 
        DataFile="~/App_Data/afdelingen.mdb" 
        SelectCommand="SELECT * FROM [Personen])">        
    </asp:AccessDataSource>
    <p>Uw persoonlijke gegevens :</p>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        AutoGenerateRows="False">
        <Fields>
            <asp:BoundField DataField="nummer" HeaderText="nummer" 
                SortExpression="nummer" />
            <asp:BoundField DataField="naam" HeaderText="naam" SortExpression="naam" />
            <asp:BoundField DataField="voornaam" HeaderText="voornaam" 
                SortExpression="voornaam" />
            <asp:BoundField DataField="afdeling" HeaderText="afdeling" 
                SortExpression="afdeling" />
            <asp:TemplateField HeaderText="datum_in_dienst" SortExpression="datum_in_dienst">                
                <ItemTemplate>
                    <asp:Calendar ID="CalendarInDienst" runat="server" SelectedDate='<%# Bind("datum_in_dienst") %>' VisibleDate='<%# Bind("datum_in_dienst") %>'></asp:Calendar>                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="geslacht" SortExpression="geslacht">                
                <ItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonListGeslacht" runat="server" selectedValue='<%# Bind("geslacht") %>' >
                        <asp:ListItem Value="M" Text="Man"></asp:ListItem>
                        <asp:ListItem Value="V" Text="Vrouw"></asp:ListItem>
                    </asp:RadioButtonList>                    
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <br />
    <asp:Label ID="LabelPersNr" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    </asp:Content>
