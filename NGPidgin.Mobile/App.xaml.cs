using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using NGPidgin.Mobile.Services;
using NGPidgin.Mobile.Views;
using Xamarin.Essentials;
using System.Collections.Generic;
using NGPidgin.Mobile.Models;

namespace NGPidgin.Mobile
{
    public partial class App : Application
    {
        public static string DataStore_Path => FileSystem.CacheDirectory;
        public static string DataStore_WordJsonFile => "Words.json";
        public static string DataStore_SentenceJsonFile => "Sentences.json";

        public static string DataStore_Word_Path => $"{DataStore_Path}/{DataStore_WordJsonFile}";
        public static string DataStore_Sentence_Path => $"{DataStore_Path}/{DataStore_WordJsonFile}";

        public static List<WordModel> DataStore_Words = new List<WordModel>();
        public static List<SentenceModel> DataStore_Sentences = new List<SentenceModel>();

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
