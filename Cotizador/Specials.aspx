<%@ Page Language="C#" MasterPageFile="~/Cotizador/Cotizador.master" AutoEventWireup="true" CodeFile="Specials.aspx.cs" Inherits="Cotizador_Specials" Title="Untitled Page" %>

<asp:Content id="Specials" ContentPlaceHolderID="CONTENT" Runat="Server">

<asp:Label ID="Label1" Text="Specials" Font-Size="14pt" ForeColor="#990000" 
Runat="Server"/>

<asp:AccessDataSource id="SpecialsSource" Runat="Server"
  DataFile="../Databases/BooksDB.mdb"
  SelectCommand="SELECT * FROM Books WHERE BookSale = True ORDER BY BookID"/>
	
<asp:GridView id="BookGrid" Runat="Server"
  DataSourceID="SpecialsSource"
  AutoGenerateColumns="False"
  HeaderStyle-BackColor="#990000"
  HeaderStyle-ForeColor="#FFFFFF"
  Cellpadding="5"
  Style="margin-top:10px">
  
  <Columns>
  
  <asp:BoundField
    HeaderText="ID"
    DataField="BookID"
    ItemStyle-Width="60"/>
  
  <asp:BoundField
    HeaderText="Title"
    DataField="BookTitle"
    ItemStyle-Width="200"/>
  
  <asp:TemplateField
    HeaderText="Price"
    ItemStyle-Width="70"
    ItemStyle-HorizontalAlign="Right">
    <ItemTemplate>
      <asp:Label ID="Label2" Runat="Server"
        Text='<%# String.Format("{0:C}", Eval("BookPrice")) %>'/>
    </ItemTemplate>
  </asp:TemplateField>
  
  <asp:TemplateField
    HeaderText="Special" 
    ItemStyle-Width="70"
    ItemStyle-HorizontalAlign="Right"
    ItemStyle-Font-Bold="True">
    <ItemTemplate>
      <asp:Label ID="Label3"  Runat="Server"
        Text='<%# String.Format("{0:C}",Double.Parse(Eval("BookPrice").ToString()) * Double.Parse(Application["Discount"].ToString())) %>'/>
    </ItemTemplate>
  </asp:TemplateField>
  
  <asp:TemplateField
    HeaderText="View Details"
    ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
      <asp:LinkButton ID="LinkButton1" Text="Details" Runat="Server"
        OnCommand="View_Details"
        CommandName='<%# Eval("BookID") %>'/>
    </ItemTemplate>
  </asp:TemplateField>
  
  </Columns>

</asp:GridView>

</asp:Content>

