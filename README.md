![rbBot Promotional Image](rbbot.png)
<br>
[Trello ](https://trello.com/b/aZOuF2f5/rbbot)
[ GitHub] (https://github.com/ceahs/rbBot)
<br>
<br>
<br>
<br>
**Software Requirements & How to Install**
<br>
* **Windows PC or Mac with Ruby installed**
<br> Ruby install guide: https://www.ruby-lang.org/en/documentation/installation/
<br>
<br>

* **How to run the code:**
<br> Use ```bundle install``` when in the 'discordrb' folder to install all the Ruby dependencies required to run the program. After that run ```ruby rbbot.ruby``` to launch the bot and continue to setup.
<br>
<br>
<br>

*If you enter Client-ID or Token wrong from your Discord Developers page, please restart the register function, if you try to sign in, it will not work. Perhaps copying and pasting the wrong Token/ClientID is causing your bot to not start. If you are having password issues, there is a section below on how to fix that. Please note you will not need a 'Client Secrect' anywhere in this program, so ignore that incase you think you might need it. Thank you.*

<br>
<br>

**rbBot - A Discord Command Line Solution**
<br>
This project is rbBot. rbBot is build on DiscordRB. It is an unpopular library for Discord bot developers, for certain reasons like scalability, but my bot solves this issue by each user needing to create  their own bot user before they can run the bot. Each persons terminal will only work for their own bot, so there will be no risk of the bot being used by too many users

<br>
<br>

**How rbBot works.**
<br>
When you first launch rbBot it asks you if you have signed up or not. If the program detects you have no account yet you will be unable to sign-in, as the password is stored locally, so switching computers will require another setup. As you progress through the sign-up page, the program makes creating a bot user extremely easy compared to what it normally is if you decide to code your own bot. With the help of launchy, and the program creating your invite URL for you, making this bot user for your server is an extremely easy and convienient process.
<br>
Once you have set up your bot, your token and password are logged into the files, so you can stop, and resume the bot easily after the sign up is done. All data is saved!.

<br>
<br>

**Help!! I forgot my password!**
<br>
Incase you forget your password, maybe you lost access to your main Discord account, or you closed your direct message, and the bot could not send you your password, you can use an argument to change the password to anything you want! Simply use the command ```ruby reset.ruby NEW_PASSWORD_HERE``` when running the bot, and the password will be overwritten so you can continue using the bot.

<br>
<br>

**Why should you use my program?**
<br>
Now as most of us are aware, there is a thousand and a million other Discord bots on Discord. How is mine any different from a random copy and paste Discord bot? Well.. for starters the command line interface is extremely rare, maybe non-existant in the Discord bot scene. It's new, cool, and can add plenty of functionality to your bot, without even being on Discord. My bot also has a very different setup to most bots. Generally a bot is hosted by a big server and everyone uses the same bot. In rbBot however each person owns their own bot. The logs are theirs, they can change the name, it's their own bot user, they can modify the code, its a refreshing experience from the normal Discord bot experience.

<br>
<br>

**Features and Functions**
<br>

* **!help**
  <br>Sends all the commands that are executable from Discord.
  <br>

* **!flags**
  <br>A fun multi-player geography game! First to say the flag wins.
  <br>

* **!cat**
  <br>Sends a random cat from an API.
  <br>

* **!level**
  <br>Shows how many wins you have in geography.
  <br>

* **!terminalmode**
  <br> (Admin Only!) Open the terminal options remotely from Discord!
  <br>
  <br>

**Terminal Features**
<br>

* **Download Logs**
  <br>Download all the chat logs in the server that rbBot is in.
  <br>

* **Download Flag Logs**
  <br>Download all the flag winners.
  <br>

* **Authentication and Log-in**
  <br> Your password, Discord logs, and token are all safe behind an authentication system. You will never have to set-up the bot again after you have done it once.

* **Send a message remotely**
  <br>Type a message into the terminal and execute it as the bot user on Discord!
  <br>
  <br>

**Passive Functions**
  <br>

  * **Message logging**
  <br>All messages in the server rbBot is in, are collected into a file, that can be downloaded in the terminal features.

<br>
<br>
<br>

**Want to use some of my commands, and improve them?**
<br> Simply copy and paste them to your projects. They are all separate like modules, you will be able to put them into your own project with ease.
