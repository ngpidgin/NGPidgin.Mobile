using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace NGPidgin.Mobile.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class DashboardPage : ContentPage
    {
        private bool hambugger_isEnabled = true;

        public DashboardPage()
        {
            InitializeComponent();

            NavigationPage.SetHasNavigationBar(this, false);
        }

        private async void MenuBtn_Clicked(object sender, EventArgs e)
        {
            if (hambugger_isEnabled)
            {
                hambugger_isEnabled = false;
                await Navigation.PushModalAsync(new AppNavigationPage());
                hambugger_isEnabled = true;
            }
        }

        protected override bool OnBackButtonPressed()
        {
            return false;
        }
    }
}