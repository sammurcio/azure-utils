using System;
using System.IO;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Diagnostics;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
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

  protected void generateLog_Click(object sender, EventArgs e)
  {
    try
    {
      string output = @"\\az-sofs.fusion.local\logs\test.txt"; // UNC path
      string[] lines = { "Hello", "World!" };
      File.WriteAllLines(output, lines);
    }
    catch (System.Exception ex)
    {
      throw ex;
    }
  }
}
