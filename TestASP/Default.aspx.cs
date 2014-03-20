using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestASP
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LoginUser_LoggedIn(object sender, EventArgs e)
        {
            MembershipUser gebruiker = Membership.GetUser(Login1.UserName);
            if (Roles.IsUserInRole(gebruiker.UserName, "Admin"))
            { Login1.DestinationPageUrl = @"~/Beheerder/Overview.aspx"; }
            else
            {
                //Login1.DestinationPageUrl = @"~/Personeelsleden/LoggedIn.aspx";
                string VoornaamNaam = Login1.UserName;
                string[] split = VoornaamNaam.Split('.');
                string tempSplitVoornaam = split[0].ToUpper();
                string tempSplitNaam = split[1].ToUpper();
                LabelVoornaam.Text = tempSplitVoornaam;
                LabelNaam.Text = tempSplitNaam;
                var tempPersNr = (DataView)AccessDataSourcePersNr.Select(DataSourceSelectArguments.Empty);
                string temp = tempPersNr[0][0].ToString();
                Session["PersNr"] = temp;
                var tempSession = temp;
            }

            
        }        
    }
}