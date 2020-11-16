using System;
using Dlubal.RSTAB8;

namespace DlubalPortabilityTest
{
    class Program
    {
        static void Main(string[] args)
        {
            var comment = new Comment
            {
                Text = "Hello Dlubal!"
            };
            Console.WriteLine(comment.Text);
        }
    }
}
