using System;
using System.IO;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
  public string writeSec;
  public string copySec;
  public string filesize;

  protected void Page_Load(object sender, EventArgs e)
  {
    lblHostname.Text = Environment.MachineName;
  }

  public static void CPUKill(object cpuUsage)
  {
    Parallel.For(0, 1, new Action<int>((int i) =>
    {
      Stopwatch watch = new Stopwatch();
      watch.Start();
      while (true)
      {
        if (watch.ElapsedMilliseconds > (int)cpuUsage)
        {
          Thread.Sleep(100 - (int)cpuUsage);
          watch.Reset();
          watch.Start();
        }
      }
    }));
  }

  public static void app()
  {
    int cpuUsage = 80;
    int time = 10000;
    List<Thread> threads = new List<Thread>();
    for (int i = 0; i < Environment.ProcessorCount; i++)
    {
      Thread t = new Thread(new ParameterizedThreadStart(CPUKill));
      t.Start(cpuUsage);
      threads.Add(t);
    }
    Thread.Sleep(time);
    foreach (var t in threads)
    {
      t.Abort();
    }
  }

  protected void btnMaxCPU_Click(object sender, EventArgs e)
  {
    var timeToRun = System.DateTime.Now.AddSeconds(int.Parse(txtTime.Text));
    while (timeToRun > System.DateTime.Now)
    {
      app();
    }
  }

  protected void btnLogWrite_Click(object sender, EventArgs e)
  {
    try
    {
      string output = @"\\az-sofs.fusion.local\logs\test.txt";
      string[] lines = { "Hello", "World!" };

      var watchwrite = System.Diagnostics.Stopwatch.StartNew();
      File.WriteAllLines(output, lines);
      watchwrite.Stop();
      this.writeSec = watchwrite.Elapsed.TotalSeconds.ToString();
    }
    catch (System.Exception ex)
    {
      throw ex;
    }
  }

  protected void btnCopyFile_Click(object sender, EventArgs e)
  {
    try
    {
      string srcfile = srcFile.Text;
      string destpath = destPath.Text;
      //string[] separators = {"\\", "/"};
      //string destfile = string.Format(@"{1}\{0}",srcfile.Split(separators, StringSplitOptions.RemoveEmptyEntries).Last());
      long fi = new FileInfo(srcfile).Length;
      this.filesize = ((fi / 1024f) / 1024f).ToString();

      var watchcopy = System.Diagnostics.Stopwatch.StartNew();
      File.Copy(srcfile, destpath, true);
      watchcopy.Stop();
      this.copySec = watchcopy.Elapsed.TotalSeconds.ToString();
    }
    catch (System.Exception ex)
    {
      throw ex;
    }
  }
}
