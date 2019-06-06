<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="caidaEtiquetasold.aspx.cs" Inherits="Almacen_Etiquetas_caidaEtiquetas" Title="Untitled Page" %>
<%@ PreviousPageType virtualPath="~/Almacen/Etiquetas/formularioOrdenEntrada.aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <table border="1" cellpadding="0" cellspacing="0" style="width: 207px">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <asp:Repeater ID="Repeater1" runat="server">
            </asp:Repeater>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

