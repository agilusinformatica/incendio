using Microsoft.Office.Tools.Ribbon;

namespace LogVcom
{
    public partial class MyRibbon
    {
        private void button1_Click(object sender, RibbonControlEventArgs e)
        {
            ThisAddIn.emails();
        }
    }
}
