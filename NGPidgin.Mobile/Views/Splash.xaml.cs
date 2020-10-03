using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace NGPidgin.Mobile.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Splash : ContentPage
    {
        public Splash()
        {
            InitializeComponent();
        }

        private async Task Startup()
        {
            await Task.Delay(3000);
            await Navigation.PushModalAsync(new MainPage());
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            await Startup();
        }
    }
}