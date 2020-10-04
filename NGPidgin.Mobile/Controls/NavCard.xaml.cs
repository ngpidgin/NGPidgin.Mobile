using NGPidgin.Mobile.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace NGPidgin.Mobile.Controls
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class NavCard
    {
        public static readonly BindableProperty TextProperty = BindableProperty.Create("Text", typeof(string), typeof(NavCard), string.Empty);
        public static readonly BindableProperty IconProperty = BindableProperty.Create("Icon", typeof(string), typeof(NavCard), string.Empty);
        public static readonly BindableProperty RowProperty = BindableProperty.Create("Row", typeof(int), typeof(NavCard), 0);
        public static readonly BindableProperty ColumnProperty = BindableProperty.Create("Column", typeof(int), typeof(NavCard), 0);
        public static readonly BindableProperty PageNavIdProperty = BindableProperty.Create("PageNavId", typeof(int), typeof(NavCard), 0);

        public string Text
        {
            get => (string)GetValue(NavCard.TextProperty);
            set => SetValue(NavCard.TextProperty, value);
        }

        public string Icon
        {
            get => (string)GetValue(NavCard.IconProperty);
            set => SetValue(NavCard.IconProperty, value);
        }

        public int Row
        {
            get => (int)GetValue(NavCard.RowProperty);
            set => SetValue(NavCard.RowProperty, value);
        }

        public int Column
        {
            get => (int)GetValue(NavCard.ColumnProperty);
            set => SetValue(NavCard.ColumnProperty, value);
        }

        public int PageNavId
        {
            get => (int)GetValue(NavCard.PageNavIdProperty);
            set => SetValue(NavCard.PageNavIdProperty, value);
        }

        public NavCard()
        {
            InitializeComponent();
        }

        private void NavItem_Tapped(object sender, EventArgs e)
        {
            if (this.PageNavId == 0) return;

            Page p = new Page();

            switch (this.PageNavId)
            {
                case 1:
                    p = new DashboardPage();
                    break;
                case 2:
                    p = new WordListPage();
                    break;

                default: return;
            }

            //var c = Navigation.ModalStack.FirstOrDefault(a => a.Id == p.Di);
            //if (c != null)
            //    Navigation.PopModalAsync();

            Navigation.PushModalAsync(p);

            //DependencyService.Get<SnackInterface>().SnackbarShow("A SnackBar in Xamarin.Android");
        }
    }
}