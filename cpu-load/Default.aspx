<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Debug="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <p style="text-align: center; font-size:xx-large; font-weight:bold">
          Server you are on:&nbsp;
          <asp:Label ID="lblHostname" runat="server"></asp:Label>
      </p>
      <p style="text-align: center; font-size:large; font-weight:bold">
        CPU Load Test
      </p>
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
      <p style="text-align: center; font-size:large; font-weight:bold">
        Log File Write to UNC Path
      </p>
      <p style="text-align: center">
        How long it took to write sample log file: <%=writeSec%> seconds
      </p>
      <p style="text-align: center">
        <asp:Button ID="generateLog" runat="server" OnClick="btnLogWrite_Click" Text="Write Log File"/>
      </p>
      <br />
      <p style="text-align: center; font-size:large; font-weight:bold">
        Copy Server-Side File to UNC Path
      </p>
      <p style="text-align: center">
        Path of file on server to copy
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
      <br />
      <p style="text-align: center; font-size:large; font-weight:bold">
        Copy Server-Side File to Azure File Share
      </p>
      <p style="text-align: center">
        Path of file on server to copy
        <asp:TextBox ID="srcFile2" runat="server"></asp:TextBox>
      </p>
      <p style="text-align: center">
        Storage Account Name
        <asp:TextBox ID="sAccountName" runat="server"></asp:TextBox>
      </p>
      <p style="text-align: center">
        Share Name
        <asp:TextBox ID="shareName" runat="server"></asp:TextBox>
      </p>
      <p style="text-align: center">
        Access Key
      <asp:TextBox ID="accessKey" runat="server"></asp:TextBox>
      </p>
      <p style="text-align: center">
        Size of the specified file: <%=filesizeazfs%> MBs
      </p>
      <p style="text-align: center">
        How long it took to copy the specified file: <%=copysecazfs%> seconds
      </p>
      <p style="text-align: center">
        Destination Path: <%=destpathazfs%>
      </p>
      <p style="text-align: center">
        <asp:Button ID="copyFileAZFS" runat="server" OnClick="btnCopyFileAZFS_Click" Text="Copy File"/>
      </p>
    </div>
    </form>
</body>
</html>
<footer>
    <p>Version: 3.5</p>
</footer>