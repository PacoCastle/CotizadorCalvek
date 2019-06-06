<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calendario.aspx.cs" Inherits="Calendario_Calendario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" language="javascript">
      function retornaValor(){
        if(document.getElementById('txtFecha').value == "")
        {
          if(dialogArguments == "")
            returnValue = "";
          else
            returnValue = dialogArguments;
        }
      }
    </script>
<base target="_self" />
</head>
<body onload="retornaValor();">
    <form id="form1" runat="server">
    <div style="position:absolute; top:0; left:0;">
        </div>
        <asp:Calendar ID="cal" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid"
            CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px"
            NextPrevFormat="ShortMonth" Width="330px" OnSelectionChanged="cal_SelectionChanged">
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <DayStyle BackColor="#CCCCCC" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt"
                ForeColor="White" Height="12pt" />
        </asp:Calendar>
        <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
    </form>
</body>
</html>
