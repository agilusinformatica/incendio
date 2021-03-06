﻿using System;
using Microsoft.Office.Interop.Outlook;
using LogVcom.Classes;

namespace LogVcom
{
    public partial class ThisAddIn
    {
        static NameSpace outlookNameSpace;
        static MAPIFolder outlookFolder;
        private void ThisAddIn_Startup(object sender, EventArgs e)
        {
            outlookNameSpace = Application.GetNamespace("MAPI");
            outlookFolder = outlookNameSpace.GetDefaultFolder(OlDefaultFolders.olFolderInbox);
        }
        static public void emails()
        {
            Items emailsNaoLidos = outlookFolder.Items.Restrict("[Unread]=true");
            Email.Gravar(emailsNaoLidos);
        }
        private void ThisAddIn_Shutdown(object sender, System.EventArgs e)
        {
            // Note: Outlook no longer raises this event. If you have code that 
            //    must run when Outlook shuts down, see http://go.microsoft.com/fwlink/?LinkId=506785
        }

        #region VSTO generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InternalStartup()
        {
            this.Startup += new System.EventHandler(ThisAddIn_Startup);
            this.Shutdown += new System.EventHandler(ThisAddIn_Shutdown);
        }
        
        #endregion
    }
}
