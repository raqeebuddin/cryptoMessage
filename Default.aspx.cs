using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

public partial class _Default : Page
{
    static string messageStatus;

    protected void Page_Load(object sender, EventArgs e)
    {
      
        //Behaviours to begin on page load
        //encrPwArea.Visible = true;
        //pwStrengthPanel.Visible = true;
        //encrPanel.Visible = true;
        //decrPanel.Visible = true;
        //outPutPanel.Visible = true;
        //emailPanel.Visible = true;
    }

    protected void radioList_SelectedIndexChanged(object sender, EventArgs e)
    {
       //Resets page view when racio button is pressed
        encrPwArea.Visible = false;
        //pwStrengthPanel.Visible = false;
        encrPwTipPanel.Visible = false;
        encrPanel.Visible = false;
        encrTipPanel.Visible = false;
        decrPanel.Visible = false;
        decrTipPanel.Visible = false;
        outPutPanel.Visible = false;
        outputTipPanel.Visible = false;
        emailPanel.Visible = false;
        emailTipPanel.Visible = false;
        encrPwTextBox.Text = "";
        encrTextBox.Text = "";
        decrTextBox.Text = "";
        outPutTextBox.Text = "";
        
        if (Convert.ToString(radioList.SelectedItem)== "Encrypt")
        {
            encrPwArea.Visible = true;
            //pwStrengthPanel.Visible = true;
            encrPwTipPanel.Visible = true;
            encrPanel.Visible = true;
            encrTipPanel.Visible = true;
            encrPwTextBox.Attributes.Add("placeholder", "Create a Crypto-Word");
        }
        else
        {
            encrPwArea.Visible = true;
            decrPanel.Visible = true;
            decrTipPanel.Visible = true;
            encrPwTextBox.Attributes.Add("placeholder", "Enter Crypto-Word");
        }
    }

    protected void encrButton_Click(object sender, EventArgs e)
    {
        //setup message, Add password first, add input text, add 'encryption' key word at end
        string encryPassw = encrPwTextBox.Text.Replace(" ", String.Empty).ToLower(); //converts password into a single word with no space
        encryPassw += " ";
        string verifyMessageStatus = " encrypted";
        string inputToEncry = encryPassw;
        inputToEncry += encrTextBox.Text;
        //decrypt last word
        string lastWord = inputToEncry.Split(' ').Last();
        
        ////encryption with no password START
        if (lastWord == "rapelcgrq")
        {
            outPutTextBox.Text = "This message is already encrypted, Please select the Decrypt option";
            outPutPanel.Visible = true;
        }
        else
        {
            inputToEncry += verifyMessageStatus;
            Rot13 rot13 = new Rot13();
            string encodedString = rot13.Encode(inputToEncry); // Encode the string.
            outPutTextBox.Text = encodedString;
            outPutPanel.Visible = true;
            outputTipPanel.Visible = true;

            encrTipPanel.Visible = true;
            messageStatus = "Encrypted";
            emailPanel.Visible = true;
            emailTipPanel.Visible = true;
            ////encryption with no password END 
     
        }
    }

    protected void decrButton_Click(object sender, EventArgs e)
    {
        string encryPassw = encrPwTextBox.Text.Replace(" ", String.Empty).ToLower(); //converts password into a single word with no space
        string inputToDecry = decrTextBox.Text;
        string encrPassword = inputToDecry.Split(' ').First();// identifies the first word which is the password
        inputToDecry = inputToDecry.Replace(inputToDecry.Split(' ').Last(), "");
        Rot13 decrPw = new Rot13();
        string decrPassword = decrPw.Decode(encrPassword); // Decode the rotated st

        if (encryPassw != decrPassword)
        {
            encrTextBox.Text = "Crypto-Word INCORRECT!";
        }   
        else
        {
            //DECRYPTION START
            Rot13 rot13 = new Rot13();
            string decodedString = rot13.Decode(inputToDecry.Replace(encrPassword, "")); // Decode the rotated st
            outPutTextBox.Text = decodedString;
            messageStatus = "Decrypted";
            outPutPanel.Visible = true;
            decrTipPanel.Visible = true;
            emailPanel.Visible = true;
            emailTipPanel.Visible = true;
            //DECRYPTION END
        }
    }

    protected void emailButton_Click(object sender, EventArgs e)
    {
        //EMAIL START

        string from = "cryptomessengerapplication@gmail.com"; //Replace this with your own correct Gmail Address
        string to = emailTextBox.Text; //Replace this with the Email Address to whom you want to send the mail

        MailMessage mail = new MailMessage();
        mail.To.Add(to);
        mail.From = new MailAddress(from, "Crypto Messenger", System.Text.Encoding.UTF8);
        mail.Subject = "You have a " + messageStatus +  " message " + DateTime.Now.ToString();
        mail.SubjectEncoding = System.Text.Encoding.UTF8;
        mail.Body = outPutTextBox.Text;
        mail.BodyEncoding = System.Text.Encoding.UTF8;
        mail.IsBodyHtml = true;
        mail.Priority = MailPriority.High;

        SmtpClient client = new SmtpClient();
        //Add the Creddentials- use your own email id and password

        client.Credentials = new System.Net.NetworkCredential(from, "Justit123");

        client.Port = 587; // Gmail works on this port
        client.Host = "smtp.gmail.com";
        client.EnableSsl = true; //Gmail works on Server Secured Layer
        try
        {
            client.Send(mail);
        }
        catch (Exception ex)
        {
            Exception ex2 = ex;
            string errorMessage = string.Empty;
            while (ex2 != null)
            {
                errorMessage += ex2.ToString();
                ex2 = ex2.InnerException;
            }
            HttpContext.Current.Response.Write(errorMessage);
        }
        //EMAIL END
    }
}