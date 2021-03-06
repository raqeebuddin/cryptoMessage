﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Rot13
/// </summary>
public class Rot13
{

         private Dictionary<char, char> rot13 = new Dictionary<char, char>();

            /// <summary>
            /// Initialise the dictionary on a per object basis. I guess it could be made static as well?!
          /// </summary>
    public Rot13()
    {
        string lowLower = "abcdefghijklm", highLower = "nopqrstuvwxyz";
        string lowUpper = "ABCDEFGHIJKLM", highUpper = "NOPQRSTUVWXYZ";

        for (int i = 0; i < lowUpper.Length; i++)
        {
            // Convert a => n and A => N.
            rot13.Add(lowLower[i], highLower[i]);
            rot13.Add(highLower[i], lowLower[i]);

            // Convert n => a and N => A.
            rot13.Add(lowUpper[i], highUpper[i]);
            rot13.Add(highUpper[i], lowUpper[i]);
        }
    }

    /// <summary>
            /// Decode a Rot13 string.
            /// </summary>
            /// <param name="data">A Rot13 encoded string.</param>
            /// <returns>The original string.</returns>
    public string Decode(string data)
    {
        return Encode(data);
    }

    /// <summary>
            /// Encode a string to using Rot13.
            /// </summary>
            /// <param name="data">A string to be encoded.</param>
            /// <returns>An encoded string.</returns>
    public string Encode(string data)
    {
        char rotated = new char();
        char[] array = data.ToCharArray();
        for (int i = 0; i < array.Length; i++)
        {
            if (rot13.TryGetValue(array[i], out rotated))
            {
                array[i] = rotated;
            }
        }
        return new string(array);
    }

}


    