using Newtonsoft.Json;
using NGPidgin.Mobile.Models;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using Xamarin.Essentials;
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

            using (var stream = await FileSystem.OpenAppPackageFileAsync("Words.json"))
            {
                using (var rd = new StreamReader(stream))
                {
                    string content = rd.ReadToEnd();

                    if (!string.IsNullOrEmpty(content))
                    {
                        App.DataStore_Words = JsonConvert.DeserializeObject<List<WordModel>>(content);
                    }
                }

                //using (var sw = new FileStream(App.DataStore_Word_Path, FileMode.Create, FileAccess.Write))
                //{
                //    await stream.CopyToAsync(sw);
                //}

                //string x = File.ReadAllText(App.DataStore_Word_Path);

                //File.WriteAllText(App.DataStore_Word_Path, "XXX");
            }


            //var assembly = System.Reflection.IntrospectionExtensions.GetTypeInfo(typeof(Splash)).Assembly;
            //System.IO.Stream stream = assembly.GetManifestResourceStream("NGPidgin.Mobile.DataStore.Words.json");
            //using (var reader = new System.IO.StreamReader(stream))
            //{
            //    string content = reader.ReadToEnd();
            //    if (!string.IsNullOrEmpty(content))
            //    {
            //        List<WordModel> list = JsonConvert.DeserializeObject<List<WordModel>>(content);
            //    }
            //}

            Application.Current.MainPage = new NavigationPage(new DashboardPage());
        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            await Startup();
        }
    }
}