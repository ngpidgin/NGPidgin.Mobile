using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using NGPidgin.Mobile.Services;
using NGPidgin.Mobile.Views;

namespace NGPidgin.Mobile
{
    public partial class App : Application
    {

        public App()
        {
            Device.SetFlags(new string[] { "Shapes_Experimental" });
            InitializeComponent();

            DependencyService.Register<MockDataStore>();
            MainPage = new Splash();
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
