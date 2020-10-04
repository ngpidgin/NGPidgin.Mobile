using System;
using System.Collections.Generic;
using System.Text;

namespace NGPidgin.Mobile.Models
{
    public class WordModel
    {
        public string Word { get; set; }
        public string Meaning { get; set; }
        public string Example { get; set; }
        public string Similar { get; set; }
        public string Pronunciation { get; set; }

        public override string ToString()
        {
            return Word.ToString();
        }
    }

    public class SentenceModel
    {
        public string Category { get; set; }
        public string Sentence { get; set; }
        public string Translations { get; set; }
    }
}
