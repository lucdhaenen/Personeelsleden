using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestASP
{
    public partial class LoggedIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            AccessDataSourceDetail.Dispose();
            AccessDataSourceDetail.SelectCommand = "SELECT * FROM [Personen] WHERE ([nummer] = ?)";
            string persNummer = string.Empty;
            string huidigeURL = Request.Url.AbsoluteUri;
            if (huidigeURL.Contains("aspx"))
            {
                persNummer = Session["PersNr"].ToString();
            }
            else
            {
                if (huidigeURL.Contains("admin"))
                {
                    Page.ResolveClientUrl("~/Beheerder/Overview.aspx");
                }
                else
                {
                    persNummer = Page.RouteData.Values["nummer"].ToString();
                    Session["PersNr"] = persNummer;
                }
            }
            
            AccessDataSourceDetail.SelectParameters.Add("PersNr", persNummer);         
            DetailsView1.DataSource = AccessDataSourceDetail;
            DetailsView1.DataBind();
        }
    }
}