using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestASP
{
    public partial class Registratie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string VoornaamNaam = this.CreateUserWizard1.UserName;
            string[] split = VoornaamNaam.Split('.');
            string tempSplitVoornaam = split[0].ToUpper();
            string tempSplitNaam = split[1].ToUpper();

            LabelVoornaam.Text = split[0];
            LabelNaam.Text = split[1];
            
            
            int persNr = 0;
            var datalijst = (DataView)AccessDataSourcePersoon.Select(DataSourceSelectArguments.Empty);
            for (int i = 0; i < datalijst.Count; i++)
            {
                string tempVoornaam = datalijst.Table.Rows[i][2].ToString();
                string tempNaam = datalijst.Table.Rows[i][1].ToString();
                if ( tempVoornaam == tempSplitVoornaam && tempNaam == tempSplitNaam)
                {
                    persNr = (int)datalijst.Table.Rows[i][0];
                    Session["PersNr"] = persNr;
                }
            }
            LabelPersNr.Text = Session["PersNr"].ToString();
            
        }
    }
}