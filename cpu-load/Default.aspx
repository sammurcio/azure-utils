<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Debug="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <p style="text-align: center; font-size:x-large; font-weight:bold">
          Server you are on:&nbsp;
          <asp:Label ID="lblHostname" runat="server"></asp:Label>
      </p>
      <br />
      <p style="text-align: center">
        How long to generate CPU load in seconds
        <asp:TextBox ID="txtTime" runat="server"></asp:TextBox>
      </p>
      <p style="text-align: center">
        *This is a multi-threaded test, if accessed through LB it will only load the server displayed above.
      </p>
      <p style="text-align: center">
        <br />
        <asp:Button ID="btnMaxCPU" runat="server" OnClick="btnMaxCPU_Click" Text="Generate workload" />
      </p>
      <br />
      <br />
      <p style="text-align: center">
        How long it took to write sample log file: <%=writeSec%> seconds
      </p>
      <p style="text-align: center">
        <asp:Button ID="generateLog" runat="server" OnClick="btnLogWrite_Click" Text="Write Log File"/>
      </p>
      <br />
      <br />
      <p style="text-align: center">
        Path of local file to copy
        <asp:TextBox ID="srcFile" runat="server"></asp:TextBox>
      </p>
      <p style="text-align: center">
        Destination path of file
        <asp:TextBox ID="destPath" runat="server"></asp:TextBox>
      </p>
      <p style="text-align: center">
        Size of the specified file: <%=filesize%> MBs
      </p>
      <p style="text-align: center">
        How long it took to copy the specified file: <%=copySec%> seconds
      </p>
      <p style="text-align: center">
        <asp:Button ID="copyFile" runat="server" OnClick="btnCopyFile_Click" Text="Copy File"/>
      </p>
    </div>
    </form>
</body>
</html>
<footer>
    <p>Version: 3.0</p>
</footer>