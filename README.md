# Love app

#### Video demo: https://youtu.be/9lxaXaQSxkU

## Description:

This project was developed as a special gift for my girlfriend to celebrate our anniversary. It’s an Android app created using Dart and Flutter, and I integrated various libraries such as Firebase for handling notifications and database management, as well as audio integration for voice messages. This app is designed to enhance the experience with intuitive navigation and personalization features. 

One of the key design elements is the bottom animated navigation bar, which allows smooth transitions between different screens. Each screen serves a unique purpose, offering a personalized experience that makes every interaction special.

### Welcome screen
The app starts with a welcome message that appears only the first time the app is opened. It’s a brief introduction that explains what each section of the app does. I implemented this feature using a key storage mechanism, which detects if the app has been opened before. This prevents the welcome message from showing up on subsequent launches, keeping the user experience clean and intuitive for future use. It serves as a helpful introduction, especially since it’s designed to be a gift, guiding my girlfriend through the app's features the first time she uses it.

### Main screen: Daily messages
At the heart of the app is the daily message feature. Every day, a beautiful message is updated, and my girlfriend can tap a button to reveal it. This screen helps maintain the excitement of receiving a new message every day, adding a touch of surprise and sweetness. To make sure she doesn’t forget to check the message, I integrated Firebase for sending a daily notification at 7:00 AM, reminding her to open the app. I wanted this part to feel magical—a moment in her day when she gets reminded of my love for her.

The top bar on this screen also includes a switch that lets her revisit old messages, creating a collection of memories she can always go back to. The entire flow was designed to be seamless, focusing on delivering an elegant and personalized experience.

### Special day messages
The next screen is reserved for special occasions like birthdays, anniversaries, and Valentine’s Day. These are not your regular daily messages but larger, more heartfelt notes. Normally, the screen displays a countdown to the next special day, building anticipation. Once the day arrives, the screen bursts into celebration with confetti animations and reveals the special message.

Similar to the daily messages screen, this section has a secondary tab where my girlfriend can revisit these bigger, more sentimental notes. This feature was particularly challenging but rewarding to implement, as it had to ensure the countdown was accurate and the animations triggered at the right moments.

### Voice messages
The next screen is dedicated to audio messages. These are similar to WhatsApp voice messages, where my girlfriend can play, pause, or seek through the recordings. I added notification controls for the audio, allowing her to manage playback without needing to keep the app open. This feature enables her to listen to the messages even while using other apps or when the screen is off. It adds another level of intimacy and personalization to the app, allowing me to share spoken messages alongside written ones.

### Messages to me
One of the more interactive features is the ability for my girlfriend to send me messages. This screen includes a button that uses Firebase APIs to send a message directly to my phone. To avoid excessive costs, I limited the feature to one message per day. This ensures the feature remains special, and it’s a fun way for her to quickly reach out to me and continue the conversation through the app.

### "Settings" and other quirks
Lastly, I wanted to add a playful element to the app. There’s a screen with random "funny" settings, which includes a picture of me with my girlfriend and a count of how many days we’ve been together. These quirky subscreens add an element of humor and lightheartedness, making the app more than just a tool for sending messages. It’s a reflection of our relationship, filled with love, laughter, and fun moments.

### Challenges and decisions
This project wasn’t without its difficulties. Initially, I envisioned an even larger scope but had to pare it down to meet the one-month deadline. At first, I started the project in Java, but soon realized Flutter’s declarative layouts and Material 3 widgets would offer a better design experience. Switching to Flutter meant learning Dart from scratch in a short amount of time. This transition was tough but worth it in the end.

One of the most complex aspects was integrating Firebase for notifications and database management, as I had no prior experience working with remote databases. Ensuring that the app’s state was preserved when switching between screens or running in the background was also challenging, especially for the audio features. Making sure the audio messages continued playing even when the app was minimized required a lot of testing and troubleshooting. But through all the hurdles, I managed to implement everything on time.
