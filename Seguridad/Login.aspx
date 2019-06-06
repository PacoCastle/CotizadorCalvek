<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Seguridad_Login" CodeBehind="Login.aspx.cs"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/Estilos/StyleSheet.css" rel="Stylesheet" />
    <title>SIM</title>
</head>
<body>

    <form id="form1" runat="server">
   
        <div>
            
                    <div class="box">
                        <div class="content">
                            <span class="title">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/logoAMI.PNG" /></span>
                            <h1>SISTEMA DE INFORMACIÓN AMI</h1>
                        
                        <asp:DropDownList class="field" ID="ubicacion" runat="server" Width="105%" >
                            <asp:ListItem Value="0">SUCURSAL...</asp:ListItem>
                            <asp:ListItem Value="1">Queretaro</asp:ListItem>
                            <asp:ListItem Value="2">Celaya</asp:ListItem>
                            <asp:ListItem Value="3">El Marqués</asp:ListItem>
                            <asp:ListItem Value="4">UMM</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator id="reqStatus" Text="*" ValidationGroup="Login1" InitialValue="0" ControlToValidate="ubicacion" Runat="server" SetFocusOnError="True" BorderStyle="NotSet" />
                         
                            <asp:Login ID="Login1" runat="server" Style="width: 100%;">
                       <LayoutTemplate>
                        
                       
                            <asp:TextBox class="field" placeholder="Nombre de Usuario" ID="UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            <br>

                            <asp:TextBox class="field" placeholder="Contraseña" ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            <br>
                            <asp:Button class="btn" ID="LoginButton" runat="server" CommandName="Login" Text="Ingresar" ValidationGroup="Login1" OnClick="LoginButton_Click"></asp:Button>
                            <br>
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </div>
                      </LayoutTemplate>
            </asp:Login>
                    </div>
              

        </div>
   
   
         </form>
</body>


</html>
 
