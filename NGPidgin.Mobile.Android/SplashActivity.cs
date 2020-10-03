using Android.App;
using Android.Content;
using Android.OS;
using Android.Support.V7.App;
using System.Threading;
using System.Threading.Tasks;

namespace NGPidgin.Mobile.Droid
{
    [Activity(Label = "SplashActivity", Theme = "@style/MainTheme", NoHistory = true)]
    public class SplashActivity : AppCompatActivity
    {
        public override void OnCreate(Bundle savedInstanceState, PersistableBundle persistentState)
        {
            base.OnCreate(savedInstanceState, persistentState);
        }

        // Launches the startup task
        protected override void OnResume()
        {
            base.OnResume();
            Task startupWork = new Task(() => { Startup(); });
            startupWork.Start();
        }

        // Prevent the back button from canceling the startup process
        public override void OnBackPressed() { }

        private void Startup()
        {
            Thread.Sleep(2000);
            StartActivity(new Intent(Application.Context, typeof(MainActivity)));
        }
    }
}