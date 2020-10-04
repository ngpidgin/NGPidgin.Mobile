using NGPidgin.Mobile.Models;
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
    public partial class WordListPage : ContentPage
    {
        public static List<WordModel> _Words = null;
        public List<WordModel> Words => _Words;

        private int order = 1;

        public WordListPage()
        {
            InitializeComponent();

            if (_Words == null && App.DataStore_Words != null & App.DataStore_Words.Any())
            {
                _Words = App.DataStore_Words.OrderBy(a => a.Word).ToList();
            }

            BindingContext = this;
        }

        private void BackMenu_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new AppNavigationPage());
        }

        private void SortBtn_Clicked(object sender, EventArgs e)
        {
            if (order == 1)
            {
                _Words = App.DataStore_Words.OrderByDescending(a => a.Word).ToList();
                order = 2;
                SortBtn.Source = "order_down.png";
            }
            else if (order == 2)
            {
                _Words = App.DataStore_Words.OrderBy(a => a.Word).ToList();
                order = 1;
                SortBtn.Source = "order_up.png";
            }

            ItemsListView.ItemsSource = Words;
        }
    }
}