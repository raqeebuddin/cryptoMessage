<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Async="true" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
    <%--  HEADER START--%>   
    <div class="jumbotron text-center">
      
        <div class="col-md-10">
            <h1>CryptoMessenger</h1>
        </div>
        <div class="col-md-2">
            <img src="img/cryptoLogo.png" class="img-responsive" />
        </div>
        <p>Discrete messaging application</p> 
    </div>
    <%-- INTRODUCTION START --%>
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <p>CryptoMessenger has been designed to Encrypt or Decrypt messages with your own password</p>
                <p>It also has the ability to send your message to a recipient via email</p>
            </div>
        </div>
    </div>

    <%-- RADIO ENCR/DECR OPTIONS START--%>
     

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>	 
                             
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <asp:Panel ID="encrDecrPanel" runat="server">
                    <div id ="encrDecrRadioDiv">
                        <h4> STEP 1: Would you like to Encrypt or Decrypt a message?</h4>
                        <asp:RadioButtonList ID="radioList" runat="server" OnSelectedIndexChanged="radioList_SelectedIndexChanged" AutoPostBack="true"> 
                            <asp:ListItem Text="Encrypt"></asp:ListItem>
                            <asp:ListItem Text="Decrypt"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <hr/>
                </asp:Panel>
            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-4">
                <h4>Tip</h4>        
                <p>Tips for each step will appear on the right</p>
            </div>
        </div>
    </div>

   

    <%-- CRYPTO-WORD ENTRY START --%>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <asp:Panel ID="encrPwArea" runat="server" ViewStateMode="Enabled" Visible="False">
                    <h4>STEP 2: Enter your Crypto-Word</h4>
                    <div id="encryPassword">
                        <asp:TextBox ID="encrPwTextBox" runat="server" required ="required" TextMode="Password" Width="262px"></asp:TextBox>
                    </div>
                    <hr/>
                </asp:Panel>
            </div>
    <%-- PASSWORD STRENGTH SECTION START --%>
            <div class="col-sm-2">
                <%--<asp:Panel ID="pwStrengthPanel" runat="server" ViewStateMode="Enabled" Visible="False">
                    <div id="pwStrengthDiv">
                    Your password strength is: 
                    <div class="progress">
                            <div class="progress-bar" role="progressbar"  style="width:80%">
                            <span class="sr-only">70% Complete</span>
                            </div>
                        </div>
                    </div>
                    <hr/>
                </asp:Panel>--%>
            </div>
            <div class="col-sm-4">
                <asp:Panel ID="encrPwTipPanel" runat="server" ViewStateMode="Enabled" Visible="False">
                    <div>    
                    <h4>Tip</h4>        
                    <p>Enter a Crytop-Word, include numbers and symbols to make the Crypto-Word secure.</p>
                    <p>Use the password strength bar to see if your password is secure enough</p>
                    </div>
                    <div class="alert alert-danger">
                        <strong>Warning:</strong> Messages cannot be decrypted without out the Crypto-Word.
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

    <%--  ENCRYPTION MESSAGE BOX START--%>

    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <asp:Panel ID="encrPanel" runat="server" ViewStateMode="Enabled" Visible="False">
                    <h4>STEP 3: Enter your message</h4>
                    <div id="encrDiv">
                        <asp:TextBox ID="encrTextBox" runat="server" required ="required" placeholder="Enter message to be Encrypted" Height="109px" Width="381px" TextMode="MultiLine"></asp:TextBox>
                        <asp:Button ID="encrButton" runat="server" Text="Encrypt" OnClick="encrButton_Click" class="btn"/>
                    </div>
                    <hr/>
                </asp:Panel>
            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-4">
                <asp:Panel ID="encrTipPanel" runat="server" ViewStateMode="Enabled" Visible="False">
                    <h4>Tip</h4>        
                    <p>Please enter the message you want to Encrypt</p>
                    <p>Once you have finished please press the "Encrypt" button.</p>
                </asp:Panel>
            </div>
        </div>
    </div>

     <%--  DECRYPTION MESSAGE BOX START--%>
      <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <asp:Panel ID="decrPanel" runat="server" Visible="False">
                    <h4>STEP 3: Enter your message</h4>
                    <div id =" decrDiv">
                        <asp:TextBox ID="decrTextBox" runat="server" required ="required" placeholder="Enter message to be Decrypted" Height="109px" Width="380px" TextMode="MultiLine"></asp:TextBox>
                        <asp:Button ID="decrButton" runat="server" Text="Decrypt" OnClick="decrButton_Click" class="btn"/>
                    </div>
                    <hr/>
                </asp:Panel>
            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-4">
                <asp:Panel ID="decrTipPanel" runat="server" ViewStateMode="Enabled" Visible="False">
                    <h4>Tip</h4>        
                    <p>Please enter or paste the encrypted message you want to Decrypt</p>
                    <p>Once you hace finished please press the "Decrypt" button.</p>
                </asp:Panel>
            </div>
        </div>
    </div>

    <%-- OUTPUT MESSAGE BOX SECTION START --%>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <asp:Panel ID="outPutPanel" runat="server" ViewStateMode="Enabled" Visible="False">
                    <h4>STEP 4: Here is your Encrypted/Decrypted message:</h4>
                    <div id =" outPutDiv">
                        <asp:TextBox ID="outPutTextBox" runat="server" placeholder="Encrypted/Decrypted message shown here" Height="109px" Width="379px" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <hr/>
                </asp:Panel>
            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-4">
                <asp:Panel ID="outputTipPanel" runat="server" ViewStateMode="Enabled" Visible="False">
                    <h4>Tip</h4>        
                    <p> You can highlight and copy your message or use th Email function in the next step to send it to a recipient</p>
                </asp:Panel>
            </div>
        </div>
    </div>

    <%-- SEND EMAIL SECTION START --%>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <asp:Panel ID="emailPanel" runat="server" Visible="False" ViewStateMode="Enabled">
                    <h4>STEP 5: Send message to an email address</h4>
                    <div id ="emailDiv" class =" panelSubContainer" style="height: 43px">
                        <asp:TextBox ID="emailTextBox" runat="server" Height="22px" Width="379px" ValidateRequestMode="Enabled" TextMode="Email"></asp:TextBox>
                        <asp:Button ID="emailButton" runat="server" Text="Send  " OnClick="emailButton_Click" class="btn" />
                    </div>
                    <hr/>
                </asp:Panel>
            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-4">
                <asp:Panel ID="emailTipPanel" runat="server" ViewStateMode="Enabled" Visible="False">
                    <h4>Tip</h4>        
                    <p>Please enter an email address to send your message.</p>
                    <p>Press send to send the email</p>
                </asp:Panel>
            </div>
        </div>
    </div>
</ContentTemplate>
</asp:UpdatePanel> 
</asp:Content>
