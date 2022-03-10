-- Find the app with an ID of 1880.
SELECT app_name
FROM analytics
WHERE id = 1880;
        app_name
-------------------------
 Web Browser for Android


-- Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name
FROM analytics
WHERE last_updated = '2018-08-01';
  id  |                                     app_name
------+-----------------------------------------------------------------------------------
   10 | Clash Royale
   11 | Candy Crush Saga
   12 | UC Browser - Fast Download Private & Secure
   74 | Score! Hero
  101 | Tiny Flashlight + LED
  102 | Crossy Road
  103 | SimCity BuildIt
  111 | FIFA Soccer
  112 | Angry Birds 2
  125 | Need for Speed™ No Limits
  126 | YouCam Makeup - Magic Selfie Makeovers
  152 | Fallout Shelter
  159 | DU Recorder – Screen Recorder, Video Editor, Live
  160 | Bike Race Free - Top Motorcycle Racing Games
  161 | KakaoTalk: Free Calls & Text
  162 | Dolphin Browser - Fast, Private & Adblock🐬
  163 | Opera Browser: Fast and Secure
  164 | MARVEL Contest of Champions
  184 | Video Editor Music,Cut,No Crop
  226 | Frozen Free Fall
  260 | Chess Free
  276 | ► MultiCraft ― Free Miner! 👍
  277 | Vlogger Go Viral - Tuber Game
  300 | Bad Piggies
  301 | Skater Boy
  356 | S Photo Editor - Collage Maker , Photo Collage
  357 | Magisto Video Editor & Maker
  358 | Itau bank
  359 | DEER HUNTER 2018
  360 | Mobizen Screen Recorder for SAMSUNG
  362 | Bike Racing 3D
  425 | Bomber Friends
  426 | Lep’s World 3 🍀🍀🍀
  431 | MakeupPlus - Your Own Virtual Makeup Artist
  436 | Photo Collage Maker
  465 | ivi - movies and TV shows in HD
  466 | Calculator Plus Free
  467 | Indeed Job Search
  507 | MakeMyTrip-Flight Hotel Bus Cab IRCTC Rail Booking
  569 | Waplog - Free Chat, Dating App, Meet Singles
  570 | ESPN
  580 | Galaxy Attack: Alien Shooter
  620 | HD Camera Ultra
  663 | Fire Emblem Heroes
  664 | Daily Horoscope
  682 | Equestria Girls
  683 | Ingress
  740 | Arrow.io
  757 | Bike Mayhem Free
  758 | GroupMe
  759 | Samsung Max - Data Savings & Privacy Protection
  760 | Wondershare PowerCam
  805 | Psiphon Pro - The Internet Freedom VPN
  806 | Tubi TV - Free Movies & TV
  813 | foodpanda - Local Food Delivery
  814 | Soul Knight
  825 | OkCupid Dating
  892 | Solitaire
  893 | FrostWire: Torrent Downloader & Music Player
  905 | Fox News – Breaking News, Live Video & News Alerts
  950 | Voxer Walkie Talkie Messenger
  964 | ibis Paint X
  965 | A+ Gallery - Photos & Videos
  982 | Word Link
 1022 | Newsroom: News Worth Sharing
 1023 | iTranslate Translator & Dictionary
 1024 | TETRIS Blitz
 1025 | Golden HoYeah Slots - Real Casino Slots
 1026 | Creative Destruction
 1027 | Doctor Kids
 1028 | Edmodo
 1086 | Motorbike Driving Simulator 3D
 1090 | Mr. Number-Block calls & spam
 1098 | Topbuzz: Breaking News, Videos & Funny GIFs
 1099 | Tank Stars
 1104 | Ayat - Al Quran
 1111 | Flightradar24 Flight Tracker
 1131 | CM Flashlight (Compass, SOS)
 1132 | MARVEL Strike Force
 1136 | Cartoon Wars: Blade
 1214 | CONTRACT KILLER: ZOMBIES
 1220 | Free english course
 1221 | ZALORA Fashion Shopping
 1222 | New Launcher 2018
 1223 | Color by Number – New Coloring Book
 1235 | Bunny Skater
 1270 | Drag’n’Boom
 1278 | Girls Craft: Exploration
 1296 | File Manager -- Take Command of Your Files Easily
 1297 | Aviary Stickers: Free Pack
 1325 | StirFry Stunts - We Bare Bears
 1331 | Street Skater 3D
 1356 | 8fit Workouts & Meal Planner
 1403 | World at War: WW2 Strategy MMO
 1405 | Mini Motor Racing WRT
 1462 | Free Dating App - YoCutie - Flirt, Chat & Meet
 1465 | Pocket Heroes
 1497 | FC Barcelona Official App
 1515 | FollowMeter for Instagram
 1564 | HelloTalk — Chat, Speak & Learn Foreign Languages
 1566 | ENCHANT U
 1567 | Bike Race - Bike Blast Rush
 1583 | Surprise Eggs
 1590 | NASCAR MOBILE
 1591 | myAT&T
 1604 | Download Manager
 1605 | Meetup
 1606 | Pregnancy Week By Week
 1607 | Google Analytics
 1612 | Homestyler Interior Design & Decorating Ideas
 1613 | Skype for Business for Android
 1614 | HuffPost - News
 1623 | Mobi Calculator free & AD free!
 1625 | KakaoMap - Map / Navigation
 1626 | AP Mobile - Breaking News
 1627 | Match™ Dating - Meet Singles
 1642 | ZERO Lock Screen
 1690 | Subway Terminator: Smarter Subway
 1696 | The Cube
 1753 | Galaxy at War Online
 1765 | GPS Traffic Speedcam Route Planner by ViaMichelin
 1789 | DashClock Widget
 1791 | Google Primer
 1802 | Lalafo Pulsuz Elanlar
 1804 | HBO NOW: Stream TV & Movies
 1817 | TO-FU Oh!SUSHI
 1835 | iSwipe Phone X
 1894 | Ovia Fertility Tracker & Ovulation Calculator
 1898 | Candy selfie - photo editor, live filter camera
 1905 | Google AdSense
 1985 | 4 in a row
 1989 | Pocket Little Pony
 1990 | metroZONE
 2062 | DC Super Hero Girls™
 2063 | wikiHow: how to do anything
 2076 | BaBe + - Indonesian News
 2103 | BZ Reminder
 2138 | Ulysse Speedometer
 2151 | Download Video Free
 2176 | YouTube TV - Watch & Record Live TV
 2177 | Burn Your Fat With Me! FG
 2178 | Hair saloon - Spa salon
 2179 | RC Monster Truck - Offroad Driving Simulator
 2215 | Mingle2 - Free Online Dating & Singles Chat Rooms
 2275 | ASUS Sound Recorder
 2295 | HISTORY: Watch TV Show Full Episodes & Specials
 2308 | Turbo Download Manager (and Browser)
 2392 | Mad Skills BMX 2
 2520 | Sonic CD Classic
 2567 | Adventure Time Run
 2568 | Vuze Torrent Downloader
 2569 | Color By Number - Sandbox Pixel Coloring Book
 2589 | The Championships, Wimbledon 2018
 2613 | Urban Car Simulator
 2654 | DS Speedometer & Odometer
 2690 | Wisepilot for XPERIA™
 2743 | Colorfit - Drawing & Coloring
 2752 | Clue
 2754 | Fresh EBT - Food Stamp Balance
 2772 | Dr. Shogi
 2809 | Amazon Drive
 2810 | The Game of Life
 2818 | AT&T Smart Wi-Fi
 2883 | Hipmunk Hotels & Flights
 2901 | Camera FV-5
 2934 | The Vikings
 3060 | NPR One
 3068 | Golf GPS Rangefinder: Golf Pad
 3083 | Texas Hold’em Poker
 3086 | Iqiyi (for tablet)
 3109 | SHOWTIME
 3110 | Graphing Calculator
 3220 | Speed Reading
 3221 | Job Korea - Career Jobs
 3222 | WiFi Automatic
 3223 | Circle ratio
 3269 | Dino in City-Dinosaur N Police
 3278 | Rope Hero Return of a Legend
 3348 | Lotte Home Shopping LOTTE Homeshopping
 3351 | English-Myanmar Dictionary
 3352 | Download Manager - File & Video
 3361 | Qapital - Save Small. Live Large
 3415 | My Little Pony AR Guide
 3472 | Yahoo! Weather for SH Forecast for understanding the approach of rain clouds Free
 3485 | Reindeer VPN - Proxy VPN
 3596 | Running & Jogging
 3635 | Fake Chat (Direct Message)
 3661 | Free intellectual training game application |
 3702 | EliteSingles – Dating for Single Professionals
 3721 | Offroad Pickup Truck S
 3746 | My baby firework
 3748 | Your rank CS:GO
 3749 | FlashLight HD LED Pro
 3836 | BGCN TV
 3868 | Crew - Free Messaging and Scheduling
 3869 | Urban Outfitters
 3925 | Study Checker
 3926 | Hotel Insanity
 3940 | Little Fire Station
 3996 | HTC Service － DLNA
 4083 | VitusVet: Pet Health Care App
 4109 | EMT-B Pocket Prep
 4115 | Elemental Knights R Platinum
 4221 | Speed Boat Racing
 4225 | Kids Mode
 4227 | Quiz TRUE or FALSE
 4247 | San Andreas: Gang Crime V
 4252 | Bedroom Decorating Ideas
 4318 | INFAMY RO
 4343 | Teladoc Member
 4405 | Bluetooth Pair
 4454 | Happify
 4551 | HD Video Player
 4600 | Morse Code Reader
 4655 | CB Bank Mobile Banking
 4656 | BT Camera
 4795 | SAY-U
 4796 | Manga Net – Best Online Manga Reader
 4853 | Navigation Plus
 4936 | Myanmar 2D/3D
 5083 | RUN JUMP RUN-fun games for free
 5116 | Truck Transport Raw Material
 5179 | AX Video Player
 5260 | Android P Rotation
 5263 | Alt-C
 5264 | Je Parle ANGLAIS - Apprendre l’anglais Audio cours
 5293 | Digital Clock AW-7
 5370 | English for Everyone
 5382 | Hashtags For Likes.co
 5388 | The EO Bar
 5474 | Gangster City Auto Theft
 5485 | Barcelona Live 2018—Goals & News for Barca FC Fans
 5494 | BI Mobile
 5521 | bm offers
 5583 | Cyprus CU Mobile Banking
 5781 | HTC Sense Input - BG
 5921 | MultiMessage for FB Messenger
 5945 | FD Community FCU Mobile
 5985 | AG Drive 3D
 5998 | GATE CS Engineering 2019 Exam Prep App
 6030 | Music Collector Inventory Organizer UPC Discogs
 6060 | Results for FL Lottery
 6108 | Fortune Quest: Savior
 6116 | Leica Q
 6136 | Bird Sounds & Bird Ringtones for Free 2018
 6161 | Elemental Galaxy Dx - Match3
 6174 | infirmiers
 6328 | Inbox.eu
 6331 | AU Students Zone (Result 2016)
 6405 | VCalendar - VenkatRama and Co
 6550 | Mummatikabalkuragi
 6749 | Peppa Pig: Party Time
 6781 | Ez Texting
 6806 | 17th Edition Cable Sizer
 6879 | Coupons for Dairy Queen
 7013 | EM Launcher Pro
 7025 | Ditto CP Calculator GO
 7901 | CARDI B WALLPAPERS
 7971 | Blood Pressure - Stay Healthy
 8016 | CP Calculator - Poke Go Calc
 8056 | Chat Kids - Chat Room For Kids
 8267 | BTS J-Hope Wallpaper HD for KPOP Fans
 8299 | BL 1-Click Camera
 8452 | BJ TIKET
 8682 | CZ Kompas
 8705 | DEM DZ
 8716 | Vital Tones EI Pro
 8717 | EI HabitTracker
 8719 | ei Calc
 9074 | EXOGEN Connects (US)
 9112 | Popsicle Launcher for Android P 9.0 launcher
 9212 | BA Status
 9242 | BJ’s Community SoundBoard
 9427 | db Meter - sound level meter with data logging
 9527 | EO Forum


-- Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, COUNT(*)
FROM analytics
GROUP BY category;
      category       | count
---------------------+-------
 BOOKS_AND_REFERENCE |   191
 COMMUNICATION       |   342
 BEAUTY              |    46
 EVENTS              |    52
 PARENTING           |    59
 PHOTOGRAPHY         |   313
 GAME                |  1110
 BUSINESS            |   313
 SOCIAL              |   269
 MEDICAL             |   350
 TOOLS               |   753
 TRAVEL_AND_LOCAL    |   234
 ART_AND_DESIGN      |    63
 LIFESTYLE           |   319
 WEATHER             |    79
 COMICS              |    59
 PRODUCTIVITY        |   360
 PERSONALIZATION     |   329
 FINANCE             |   331
 SPORTS              |   338
 ENTERTAINMENT       |   149
 NEWS_AND_MAGAZINES  |   249
 HOUSE_AND_HOME      |    82
 SHOPPING            |   241
 DATING              |   204
 HEALTH_AND_FITNESS  |   298
 EDUCATION           |   156
 MAPS_AND_NAVIGATION |   129
 LIBRARIES_AND_DEMO  |    80
 FOOD_AND_DRINK      |   110
 FAMILY              |  1789
 VIDEO_PLAYERS       |   165
 AUTO_AND_VEHICLES   |    75


-- Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name, reviews
FROM analytics
playstore-# ORDER BY REVIEWS desc LIMIT 5;
                 app_name                 | reviews
------------------------------------------+----------
 Facebook                                 | 78158306
 WhatsApp Messenger                       | 78128208
 Messenger – Text and Video Chat for Free | 69119316
 Instagram                                | 69119316
 Clash of Clans                           | 69109672


-- Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT app_name, rating, reviews
FROM analytics
WHERE rating >= 4.8
ORDER BY reviews desc LIMIT 1;
  app_name  | rating | reviews
------------+--------+---------
 Chess Free |    4.8 | 4559407


-- Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category, AVG(rating)
FROM analytics
GROUP BY category
ORDER BY 2 desc;
      category       |        avg
---------------------+--------------------
 EVENTS              |  4.395238104320708
 EDUCATION           |   4.38903223006956
 ART_AND_DESIGN      |  4.347540949211746
 BOOKS_AND_REFERENCE | 4.3423728633061645
 PERSONALIZATION     |    4.3283387457509
 BEAUTY              |  4.299999970656175
 GAME                |  4.287167731498383
 PARENTING           |  4.285714266251545
 HEALTH_AND_FITNESS  | 4.2743944663902464
 SHOPPING            |  4.253648051376507
 SOCIAL              |  4.245669291244717
 WEATHER             |   4.24399998664856
 SPORTS              |  4.233333332576449
 PRODUCTIVITY        |  4.212173904543338
 AUTO_AND_VEHICLES   |  4.200000017881393
 HOUSE_AND_HOME      |  4.197368430463891
 PHOTOGRAPHY         |  4.196116511489967
 MEDICAL             | 4.1926829182520144
 FAMILY              | 4.1904873752761995
 LIBRARIES_AND_DEMO  | 4.1784615259904125
 FOOD_AND_DRINK      |  4.155660354866172
 COMICS              |  4.155172401461108
 COMMUNICATION       |  4.151234589241169
 FINANCE             |  4.146835436549368
 NEWS_AND_MAGAZINES  |  4.130131007281974
 ENTERTAINMENT       |   4.12617449632427
 BUSINESS            |  4.116666667004849
 TRAVEL_AND_LOCAL    |   4.10179372753263
 LIFESTYLE           |  4.077076400237226
 VIDEO_PLAYERS       |  4.059748438919115
 MAPS_AND_NAVIGATION |  4.058196711735647
 TOOLS               |  4.050627608678331
 DATING              |  3.993684190825412


-- Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
SELECT app_name, price, rating
FROM analytics
WHERE rating < 3
ORDER BY price desc LIMIT 1;
      app_name      | price  | rating
--------------------+--------+--------
 Naruto & Boruto FR | 379.99 |    2.9


-- Find all apps with a min install not exceeding 50, that have a rating.
-- Order your results by highest rated first.
SELECT app_name, min_installs, rating
FROM analytics
WHERE min_installs <=50
GROUP BY  app_name, min_installs, rating
HAVING MIN(rating) > 0
ORDER BY rating desc;
                    app_name                    | min_installs | rating
------------------------------------------------+--------------+--------
 AQ Dentals                                     |           50 |      5
 AQ wisdom +                                    |           10 |      5
 AQ: First Contact                              |            5 |      5
 BTK-FH Online Campus                           |           10 |      5
 BV Bombers                                     |           50 |      5
 Border Ag & Energy                             |           50 |      5
 British Columbia Transit Info                  |           10 |      5
 CI On The Go                                   |           50 |      5
 CQ SIGNAL PRO 5                                |           50 |      5
 DM Adventure                                   |            1 |      5
 DQ Akses                                       |           50 |      5
 DT                                             |           50 |      5
 Dr.Dice - Sic bo analyzer                      |           50 |      5
 E.U. Trademark Search Tool                     |           50 |      5
 EC Designer 2.0                                |           50 |      5
 EP FCU                                         |           50 |      5
 EU Whoiswho                                    |           50 |      5
 ElejaOnline DF                                 |           50 |      5
 FK Events                                      |           10 |      5
 HR Team CQ Region Ed Qld                       |            5 |      5
 Labs on Demand                                 |           50 |      5
 Lord Fairfax EMS Council                       |           50 |      5
 MY GULFPORT FL                                 |           50 |      5
 My CW                                          |           10 |      5
 Otto DM                                        |            5 |      5
 Pekalongan CJ                                  |           50 |      5
 Popsicle Launcher for Android P 9.0 launcher   |           10 |      5
 Q Actions - Digital Assistant                  |           10 |      5
 Radio FG Paris Underground                     |           10 |      5
 Wifi Mingle                                    |           50 |      5
 db Meter - sound level meter with data logging |           10 |      5
 iCluster - The DX-Cluster database             |           50 |      5
 All-night drugstore CI & Price                 |           50 |    4.8
 BW t&t                                         |           50 |    4.8
 CY Spray nozzle                                |           10 |    4.8
 DT CLOTHINGS                                   |           10 |    4.8
 DY Fitness                                     |           10 |    4.8
 Miller’s Bar B-Q                               |           10 |    4.8
 Sensenuts eI                                   |           50 |    4.8
 Custos F.O.                                    |           10 |    4.7
 BL File Explorer                               |           50 |    4.6
 ER                                             |           50 |    4.6
 Audiowalk EB                                   |           50 |    4.5
 BT Satmeter                                    |           50 |    4.5
 Ec Solutions Mobile                            |           10 |    4.5
 FQ - Football Quiz                             |           50 |    4.4
 Reksio cz. 1                                   |           50 |    4.4
 CE Genius Nurses Edition                       |           50 |    4.2
 DF-View                                        |           50 |    4.2
 Ek IRA                                         |           10 |    4.2
 ReDNAKET DB Normalization Tool                 |           50 |    4.2
 EC-Contractors                                 |           10 |      4
 Word Search Tab 1 FR                           |           50 |    3.7
 Cy’s Elma Pharmacy                             |           50 |    3.6
 F-1 watchface by Delta                         |           10 |    3.5
 Dr D K Olukoya                                 |           50 |    3.4
 BibleRead En Cy Zh Yue                         |           50 |    2.8


-- Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name, rating, reviews
FROM analytics
WHERE rating < 3 AND reviews >= 10000;
                    app_name                     | rating | reviews
-------------------------------------------------+--------+---------
 The Wall Street Journal: Business & Market News |    2.8 |  107441
 Vikings: an Archer’s Journey                    |    2.9 |   31596
 Shoot Em Down Free                              |    2.4 |   11773


-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT app_name, reviews, price
FROM analytics
WHERE price BETWEEN .10 AND 1
ORDER BY reviews desc LIMIT 10;
                  app_name                   | reviews | price
---------------------------------------------+---------+-------
 Free Slideshow Maker & Video Editor         |  408292 |  0.99
 Couple - Relationship App                   |   85468 |  0.99
 Anime X Wallpaper                           |   84114 |  0.99
 Dance On Mobile                             |   61264 |  0.99
 Marvel Unlimited                            |   58617 |  0.99
 FastMeet: Chat, Dating, Love                |   58614 |  0.99
 IHG®: Hotel Deals & Rewards                 |   48754 |  0.99
 Live Weather & Daily Local Weather Forecast |   38419 |  0.99
 DreamMapper                                 |   32496 |  0.99
 Můj T-Mobile Business                       |   32344 |  0.99


-- Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible 
-- to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
SELECT app_name, last_updated
FROM analytics
ORDER BY last_updated LIMIT 1;
  app_name  | last_updated
------------+--------------
 CP Clicker | 2010-05-21


-- Find the most expensive app (the query is very similar to #11).
SELECT app_name, price
FROM analytics
ORDER BY price desc LIMIT 1;
      app_name      | price
--------------------+-------
 Cardi B Piano Game |   400


-- Count all the reviews in the Google Play Store.
SELECT SUM(reviews)
FROM analytics;
    sum
------------
 4814575866


-- Find all the categories that have more than 300 apps in them.
SELECT category, COUNT(*)
FROM analytics
GROUP BY category
HAVING COUNT(*) > 300;
    category     | count
-----------------+-------
 COMMUNICATION   |   342
 PHOTOGRAPHY     |   313
 GAME            |  1110
 BUSINESS        |   313
 MEDICAL         |   350
 TOOLS           |   753
 LIFESTYLE       |   319
 PRODUCTIVITY    |   360
 PERSONALIZATION |   329
 FINANCE         |   331
 SPORTS          |   338
 FAMILY          |  1789


-- Find the app that has the highest proportion of min_installs to reviews, among apps that have
-- been installed at least 100,000 times. Display the name of the app along with the number of
-- reviews, the min_installs, and the proportion.
SELECT app_name, reviews, min_installs, ROUND(min_installs/reviews,3) AS proportion
FROM analytics
WHERE min_installs >= 100000
GROUP BY app_name, reviews, min_installs
ORDER by 4 desc LIMIT 1;
     app_name     | reviews | min_installs | proportion
------------------+---------+--------------+------------
 Kim Bu Youtuber? |      66 |     10000000 | 151515.000

 
--Further Study: Bonus Queries
-- FS1. Find the name and rating of the top rated apps in each category, among apps that have been installed at least 50,000 times.
SELECT app_name, rating, category, min_installs
FROM analytics A
WHERE min_installs >= 50000
  AND rating = (SELECT MAX(rating) FROM analytics B
WHERE A.category = B.category)
ORDER by 3,2,1;
                    app_name                     | rating |     category      | min_installs
-------------------------------------------------+--------+-------------------+--------------
 Sokoban Land DX                                 |    4.8 | ART_AND_DESIGN    |        50000
 AC Remote For LG                                |    4.9 | AUTO_AND_VEHICLES |       100000
 BURGER KING® Puerto Rico                        |    4.9 | AUTO_AND_VEHICLES |       100000
 DU Flashlight - Brightest LED & Flashlight Free |    4.9 | AUTO_AND_VEHICLES |      1000000
 Train Sim Pro                                   |    4.9 | AUTO_AND_VEHICLES |       100000
 NOOK App for NOOK Devices                       |    4.9 | BEAUTY            |      1000000
 Facetune - For Free                             |    4.9 | EDUCATION         |      1000000
 Skylink Live TV CZ                              |    4.7 | ENTERTAINMENT     |      1000000
 Christian Questions Podcast                     |    4.8 | FOOD_AND_DRINK    |        50000
 ScreenMeet. Easy Phone Meeting                  |    4.8 | HOUSE_AND_HOME    |       100000
 PHARMAGUIDE (DZ)                                |    4.9 | PARENTING         |       100000
 Mortgage by Zillow: Calculator & Rates          |    4.8 | WEATHER           |       100000
 Post Bank                                       |    4.8 | WEATHER           |      1000000

-- FS2. Find all the apps that have a name similar to “facebook”.
Answer:  None but there are some smiliar to "Facebook"
SELECT app_name
FROM analytics
WHERE app_name LIKE '%Facebook%';
                      app_name
----------------------------------------------------
 Facebook
 Facebook Lite
 Facebook Pages Manager
 Video Downloader for Facebook
 Who Viewed My Facebook Profile - Stalkers Visitors
 Lite for Facebook Messenger
 Friendly for Facebook
 Profile Tracker - Who Viewed My Facebook Profile
 EZ Video Download for Facebook
 Faster for Facebook Lite
 HD Video Download for Facebook
 Facebook Ads Manager
 HTC Social Plugin - Facebook
 Stickers for Facebook
 Puffin for Facebook
 Phoenix - Facebook & Messenger
 Swift for Facebook Lite
 Pink Color for Facebook
 Facebook Local
 Facebook Face to Face Events
 Facebook Creator
 Download Facebook Photo Albums
 IDM for Facebook ★ Downloader
 Faster Social for Facebook
 Mini for Facebook lite
 Lite Messenger for Facebook Lite
 Dp for Facebook
 Videos downloader for Facebook:fast fb video saver

-- FS3. Find all the apps that have more than 1 genre.
SELECT app_name, array_length(genres,1)
FROM analytics
GROUP BY app_name, genres
HAVING array_length(genres,1) > 1;
                             app_name                              | array_length
-------------------------------------------------------------------+--------------
 Video Wallpaper Show                                              |            2
 My Ex Girlfriend Comes Back                                       |            2
 Weapon AK-74 Live Wallpaper                                       |            2
 Live 3D Neon Blue Love Heart Keyboard Theme                       |            2
 Taco Bell                                                         |            2
 Body scanner (prank)                                              |            2
 Good&Co: Career match tests                                       |            2
 Dance Magic Fashion Style Games                                   |            2
 BG Sports News                                                    |            2
 Elevate - Brain Training Games                                    |            2
 Garden Fever - Free!                                              |            2
 Simple Recipes                                                    |            2
 Wallpaper                                                         |            2
 Legion of Heroes                                                  |            2
 Digi Dex for DW Next Order @PS4                                   |            2
 GPS Speedometer - Trip Meter - Altimeter                          |            2
 RULES OF SURVIVAL                                                 |            2
 CG Shikshak                                                       |            2
 E! News                                                           |            2
 EZ Cleaner - Booster Optimizer                                    |            2
 Bike Race Free - Top Motorcycle Racing Games                      |            2
 Bingo Party - Free Bingo Games                                    |            2
 Youboox - Livres, BD et magazines                                 |            2
 EC - Encumbrance Search - telangana state                         |            2
 BK Chat                                                           |            2
 Yoga Studio: Mind & Body                                          |            2
 Weather BZ                                                        |            2
 Denis Brogniart - AH !                                            |            2
 OpenRice                                                          |            2
 Flashlight Free w/ compass                                        |            2
 Animal Planet GO                                                  |            2
 STARDOM: THE A-LIST                                               |            2
 BC iptv player                                                    |            2
 Angry Birds Space HD                                              |            2
 Fish|Hunt FL                                                      |            2
 BD Hospital’s                                                     |            2
 Whataburger                                                       |            2
 T-Mobile Tuesdays                                                 |            2
 Rate Guide Bill Letter                                            |            2
 Maps CU                                                           |            2
 NetSpend Prepaid                                                  |            2
 MARVEL Contest of Champions                                       |            2
 Attack the Light                                                  |            2
 Leica Q                                                           |            2
 Free Cam Girls - Live Webcam                                      |            2
 Cook ’n Learn Smart Kitchen                                       |            2
 KBA-EZ Health Guide                                               |            2
 Calculator with Percent (Free)                                    |            2
 Skin Care and Natural Beauty                                      |            2
 Hotstar                                                           |            2
 Ah! Cutie                                                         |            2
 DS video                                                          |            2
 20 minutes (CH)                                                   |            2
 CB Pay                                                            |            2
 FL State Parks Guide                                              |            2
 Transport DK                                                      |            2
 BANGLA TV 3G/4G                                                   |            2
 Image 2 Wallpaper                                                 |            2
 Clock L                                                           |            2
 Camera360: Selfie Photo Editor with Funny Sticker                 |            2
 Cook Baked Lasagna                                                |            2
 SW Battlefront Companion                                          |            2
 EyeEm - Camera & Photo Filter                                     |            2
 PlacarTv Futebol Ao Vivo                                          |            2
 My Style CM 13 Theme                                              |            2
 Magazine Luiza Online Shopping                                    |            2
 CP ToolBox                                                        |            2
 CJ’s Coffee Cafe                                                  |            2
 Servers Ultimate Pack B                                           |            2
 My Photo Keyboard                                                 |            2
 My baby Phone                                                     |            2
 Despegar.com Hotels and Flights                                   |            2
 Motocross Beach Jumping 3D                                        |            2
 mysms SMS Text Messaging Sync                                     |            2
 mon guide au bank populaire -infos et instructions                |            2
 Virtual Cigarette Smoking (prank)                                 |            2
 Apple Daily Apple News                                            |            2
 EP Search and Find                                                |            2
 KakaoTalk: Free Calls & Text                                      |            2
 ricardo.ch                                                        |            2
 Tastely                                                           |            2
 DX Simulation Belt for Build henshin                              |            2
 The Home Depot                                                    |            2
 Kids Learn Languages by Mondly                                    |            2
 Apartments.com Rental Search                                      |            2
 Fancy Pants Adventures                                            |            2
 Brightest Flashlight Free ®                                       |            2
 Bank of Brazil                                                    |            2
 Bullshite!                                                        |            2
 First Federal Bank of Florida                                     |            2
 Hostelworld: Hostels & Cheap Hotels Travel App                    |            2
 Opera Browser: Fast and Secure                                    |            2
 Beauty Makeup – Photo Makeover                                    |            2
 FC Barcelona Fantasy Manager: Real football mobile                |            2
 DM Transfers Dalaman Transfers                                    |            2
 Sugar Daddy Dating App                                            |            2
 Age of Procreation DX                                             |            2
 Google+                                                           |            2
 Google My Business                                                |            2
 Aurum Blade EX                                                    |            2
 Strawberry Shortcake Ice Cream Island                             |            2
 My Horse                                                          |            2
 Black Survival                                                    |            2
 Listen to the story~The Story of the Fairy Tales                  |            2
 Car G-Force Meter                                                 |            2
 Radarbot Free: Speed Camera Detector & Speedometer                |            2
 Fraction Calculator Plus Free                                     |            2
 Ad Detect Plugin - Handy Tool                                     |            2
 AE Air Hockey                                                     |            2
 Calcium Pro                                                       |            2
 Rush                                                              |            2
 Drawing Clothes Fashion Ideas                                     |            2
 Niche: College, K-12, and Neighborhood Search                     |            2
 RollerCoaster Tycoon® Classic                                     |            2
 W Pro - Weather Forecast & Animated Weather Maps                  |            2
 1LINE – One Line with One Touch                                   |            2
 Word Search                                                       |            2
 CU of Colorado Mobile Banking                                     |            2
 BeFunky Photo Editor Pro                                          |            2
 Stickman and Axe                                                  |            2
 Bitcoin Ticker Widget                                             |            2
 BuzzFeed: News, Tasty, Quizzes                                    |            2
 Resume ( CV Editor )                                              |            2
 White Noise for Baby                                              |            2
 COOKING MAMA Let’s Cook!                                          |            2
 Buff Thun - Daily Free Webtoon / Comics / Web Fiction / Mini Game |            2
 F-Sim Space Shuttle                                               |            2
 JetBlue                                                           |            2
 FlexBook                                                          |            2
 Bible with EGW Comments                                           |            2
 All Football GO- Live Score, Games                                |            2
 BV Smart                                                          |            2
 MileIQ - Free Mileage Tracker for Business                        |            2
 I Know Stuff                                                      |            2
 Билеты ПДД CD 2019 PRO                                            |            2
 DS Thermometer                                                    |            2
 Easy Voice Recorder                                               |            2
 Sydney FC Official App                                            |            2
 Christella VoiceUp                                                |            2
 Note Everything                                                   |            2
 AP Math & Computer Science                                        |            2
 Polaris Office - Word, Docs, Sheets, Slide, PDF                   |            2
 Pro App for Craigslist                                            |            2
 w UN map                                                          |            2
 video player                                                      |            2
 Rande.cz                                                          |            2
 Five Nights at Neighbor House                                     |            2
 BD Online Passport Application                                    |            2
 Free Dating App & Flirt Chat - Cheers                             |            2
 Dragon Ball Wallpaper - Ringtones                                 |            2
 C by GE                                                           |            2
 Used cars for sale - Trovit                                       |            2
 Power Pop Bubbles                                                 |            2
 NerdWallet: Personal Finance, Credit Score & Cash                 |            2
 FK Crvena zvezda                                                  |            2
 SnowMobile Parking Adventure                                      |            2
 BD Attendance                                                     |            2
 X Home Bar - Home Bar Gesture Pro                                 |            2
 Ultimate F1 Racing Championship                                   |            2
 EC MANAGER                                                        |            2
 FC Barcelona Official Keyboard                                    |            2
 Do I Snore or Grind                                               |            2
 BQ Camera                                                         |            2
 ADW Launcher 2                                                    |            2
 Numbers Into Words                                                |            2
 My Diet Diary Calorie Counter                                     |            2
 CALCU™ Stylish Calculator Free                                    |            2
 Face Filter, Selfie Editor - Sweet Camera                         |            2
 Slice: Package Tracker                                            |            2
 Experian - Free Credit Report                                     |            2
 3D Color Pixel by Number - Sandbox Art Coloring                   |            2
 REV Robotic Enhance Vehicles                                      |            2
 CZ-USA                                                            |            2
 Learn To Draw Glow Flower                                         |            2
 Poshmark - Buy & Sell Fashion                                     |            2
 Flame - درب عقلك يوميا                                            |            2
 Awake Dating                                                      |            2
 EGW Writings                                                      |            2
 Ad Remove Plugin for App2SD                                       |            2
 Don’t Starve: Pocket Edition                                      |            2
 kicker football news                                              |            2
 Quizlet: Learn Languages & Vocab with Flashcards                  |            2
 Adult Dating - AdultFinder                                        |            2
 Fisher-Price® Smart Connect™                                      |            2
 AfreecaTV                                                         |            2
 Galactic Core Free Wallpaper                                      |            2
 Facetune - For Free                                               |            2
 Adobe Illustrator Draw                                            |            2
 myQ                                                               |            2
 ao                                                                |            2
 Baseball Boy!                                                     |            2
 Be My Princess                                                    |            2
 Samsung Video Library                                             |            2
 Soccer Manager 2018                                               |            2
 Nighty Night Circus                                               |            2
 Delivery Club-food delivery: pizza, sushi, burger, salad          |            2
 My Nexus for CS:S & CS:GO                                         |            2
 Extreme Super Car Driving 3D                                      |            2
 Orfox: Tor Browser for Android                                    |            2
 TV+                                                               |            2
 PIP Selfie Camera Photo Editor                                    |            2
 Sarajevo Film Festival - Official                                 |            2
 Gun Mod: Guns in Minecraft PE                                     |            2
 Orbitz - Hotels, Flights & Package Deals                          |            2
 RoboPad++                                                         |            2
 LineStar For DK                                                   |            2
 Family Dollar                                                     |            2
 Complete Spanish Movies                                           |            2
 Hypertension Hi blood pressure                                    |            2
 Mayo Clinic                                                       |            2
 FP Boss                                                           |            2
 C Programming - Learn Code, Theory & Discuss                      |            2
 Aviary Effects: Classic                                           |            2
 Visage Lab – face retouch                                         |            2
 Corporate B.S. Generator                                          |            2
 AC DC Power Monitor                                               |            2
 Piczle Lines DX                                                   |            2
 Sound Meter                                                       |            2
 Shopee: No.1 Belanja Online                                       |            2
 T Uploader                                                        |            2
 BURGER KING® App                                                  |            2
 Dolphins Live Wallpaper                                           |            2
 Apartment, Home Rental Search: Realtor.com Rentals                |            2
 Cute Pet Puppies                                                  |            2
 Sudoku Master                                                     |            2
 Drive 4x4 Luxury SUV Jeep                                         |            2
 SuperLivePro                                                      |            2
 Sports Lite                                                       |            2
 Lux Home Decorating Room Games                                    |            2
 Armed Cam Gun Pack                                                |            2
 AX Battery Saver                                                  |            2
 CQ-Alert                                                          |            2
 Alchemy Classic Ad Free                                           |            2
 Bike Rivals                                                       |            2
 Vote 4 DC                                                         |            2
 Restaurantführer Südbaden                                         |            2
 Tracks                                                            |            2
 MegaNDS (NDS Emulator)                                            |            2
 EY Forensics                                                      |            2
 CT and XR Dose Calculator                                         |            2
 Abs workout 7 minutes                                             |            2
 fi                                                                |            2
 Blurfoto : Auto blur photo background & DSLR focus                |            2
 Lumosity: #1 Brain Games & Cognitive Training App                 |            2
 Easy Installer - Apps On SD                                       |            2
 Abs workout - 21 Day Fitness Challenge                            |            2
 Official Madhuban Murli                                           |            2
 GO Keyboard - Emoticon keyboard, Free Theme, GIF                  |            2
 Earn to Die 2                                                     |            2
 Cristiano Ronaldo Wallpaper                                       |            2
 Myanmar 2D/3D                                                     |            2
 CK Multimedia - Gaming Accessories                                |            2
 Dr. Panda Ice Cream Truck Free                                    |            2
 Eating Show - Food BJ                                             |            2
 SnpCupid Dating                                                   |            2
 Recipes for hair and face tried                                   |            2
 T-Mobile Visual Voicemail                                         |            2
 Launcher Oreo 8.1                                                 |            2
 Ríos de Fe                                                        |            2
 Rized ‼️ Color By Number & Pixel Coloring Book                     |            2
 I am Rich!                                                        |            2
 Florida Lottery Results                                           |            2
 I am rich VIP                                                     |            2
 Philips Hue                                                       |            2
 sugar, sugar                                                      |            2
 Unclouded - Cloud Manager                                         |            2
 PlayKids - Educational cartoons and games for kids                |            2
 SW-100.tch by Callstel                                            |            2
 Smart Keyboard Trial                                              |            2
 Learn English Vocabulary - 6,000 Words                            |            2
 Basket Manager 2018 Free                                          |            2
 Fake Call From Wengie Prank                                       |            2
 TED                                                               |            2
 100 Doors of Revenge                                              |            2
 La Liga - Spanish Soccer League Official                          |            2
 Flo’s CH Boss Timer                                               |            2
 El Nuevo Día                                                      |            2
 AV Tools                                                          |            2
 Birds Sounds Ringtones & Wallpapers                               |            2
 Used car search Goo net whole car Go to net                       |            2
 NetClient CS                                                      |            2
 AC Air condition Troubleshoot,Repair,Maintenance                  |            2
 Mummatikabalkuragi                                                |            2
 Ultimate Fighter Z                                                |            2
 JOBS.bg                                                           |            2
 Scientific Calculator Free                                        |            2
 Me-eh                                                             |            2
 Crisis Action: 2018 NO.1 FPS                                      |            2
 DaBang - Rental Homes in Korea                                    |            2
 SOLEM AG                                                          |            2
 Sway Medical                                                      |            2
 DM AirDisk NAS                                                    |            2
 Premier League - Official App                                     |            2
 ASOS                                                              |            2
 Chrome Canary (Unstable)                                          |            2
 CV EXAMPLES                                                       |            2
 T-Mobile® FamilyMode™                                             |            2
 Anno: Build an Empire                                             |            2
 Strike! Ten Pin Bowling                                           |            2
 Run on Earth                                                      |            2
 Force LTE Only                                                    |            2
 eCooltra: scooter sharing. Share electric scooters                |            2
 Manga Books                                                       |            2
 EJ Insight                                                        |            2
 Stickers for Imo, fb, whatsapp                                    |            2
 감성학원 BL 첫사랑                                                 |            2
 Diabetes, Blood Pressure, Health Tracker App                      |            2
 Makeup Editor -Beauty Photo Editor & Selfie Camera                |            2
 Supermarket Manager: Cashier Simulator Kids Games                 |            2
 Bed Time Fan - White Noise Sleep Sounds                           |            2
 Deep Sleep and Relax Hypnosis                                     |            2
 My Dressing - Fashion closet                                      |            2
 BlackJack 21 Pro                                                  |            2
 Insight Timer - Free Meditation App                               |            2
 Q Quiz SK                                                         |            2
 Tamilnadu Electricity Info                                        |            2
 Airplane Pilot Car Transporter                                    |            2
 Network Signal Info                                               |            2
 Meet – Talk to Strangers Using Random Video Chat                  |            2
 Al-Quran 30 Juz free copies                                       |            2
 The Ledger - Lakeland, Florida                                    |            2
 Golden telegram                                                   |            2
 Todoist: To-do lists for task management & errands                |            2
 Kicker U Lite                                                     |            2
 Zap-Map: EV charging points UK                                    |            2
 Toon Blast                                                        |            2
 Free Coupons for Burger King                                      |            2
 Hungry Hearts Diner: A Tale of Star-Crossed Souls                 |            2
 Learn English with Aco                                            |            2
 Gun Builder ELITE                                                 |            2
 RocketDial Dialer & Contacts                                      |            2
 ChefTap Recipes & Grocery List                                    |            2
 iGun Pro -The Original Gun App                                    |            2
 Schengen/EU App                                                   |            2
 Workout Tracker & Gym Trainer - Fitness Log Book                  |            2
 Choices: Stories You Play                                         |            2
 Faustop Sounds                                                    |            2
 eBiblio                                                           |            2
 The Ah Yeah! Button                                               |            2
 DF-Server Mobile                                                  |            2
 7 Day Food Journal Challenge                                      |            2
 NissanConnect® EV & Services                                      |            2
 FJ 4x4 Cruiser Offroad Driving                                    |            2
 CYANOGEN. Rent, buy an apartment, a room, a cottage 3+            |            2
 O Launcher 8.0 for Android™ O Oreo Launcher                       |            2
 Terminal Emulator for Android                                     |            2
 DM EVOLUTION                                                      |            2
 Ey Sey Storytime រឿងនិទានតាឥសី                                   |            2
 Resume Maker:Free CV Maker,Templates Builder                      |            2
 CF Life                                                           |            2
 EP Lab Digest                                                     |            2
 Viva Decora - Decoration, Photos, Architecture, House             |            2
 DQSalmaan - A fan made App                                        |            2
 Mama Lala ’s song                                                 |            2
 Siren Ringtones                                                   |            2
 Touch DV                                                          |            2
 AfterFocus                                                        |            2
 Visual Voicemail by MetroPCS                                      |            2
 FL Racing Manager 2018 Pro                                        |            2
 Tuner - gStrings Free                                             |            2
 Disney Crossy Road                                                |            2
 U Guard                                                           |            2
 Age Calculator                                                    |            2
 CONTRACT KILLER: ZOMBIES (NR)                                     |            2
 CJ WOW SHOP                                                       |            2
 J.ME Fly                                                          |            2
 BBMoji - Your personalized BBM Stickers                           |            2
 Beauty Camera - Selfie Camera                                     |            2
 Portes du Soleil                                                  |            2
 FRONTLINE COMMANDO                                                |            2
 Absolute RC Heli Simulator                                        |            2
 Anime et Manga Amino en Français                                  |            2
 5 Minute Ab Workouts                                              |            2
 Samsung+                                                          |            2
 AJ Cam                                                            |            2
 MyASUS - Service Center                                           |            2
 Hamilton — The Official App                                       |            2
 OurHome – chores, rewards, groceries and calendar                 |            2
 Become a Job - Find a job or advertise                            |            2
 Bualuang mBanking                                                 |            2
 Gangstar Vegas - mafia game                                       |            2
 HTC Transfer Tool                                                 |            2
 Top Mercato: football news                                        |            2
 The Holy Rosary                                                   |            2
 Pocket GMAT Math                                                  |            2
 Block Gun 3D: Haunted Hollow                                      |            2
 Cheap hotel deals and discounts — Hotellook                       |            2
 Fruit Boom                                                        |            2
 Five nights at Minecraft                                          |            2
 TAXLANDIA                                                         |            2
 J-Stars Victory VS Guide                                          |            2
 Birmingham City FC                                                |            2
 Summer Camp Island AR                                             |            2
 ER Injection Simulator: Blood Test Doctor Hospital                |            2
 Brain Waves - Binaural Beats                                      |            2
 EMT Tutor NREMT-B Study Guide                                     |            2
 Florida Today                                                     |            2
 Accounting App - Zoho Books                                       |            2
 BL 女性向け恋愛ゲーム◆ごくメン                                    |            2
 DuraSpeed                                                         |            2
 U - Webinars, Meetings & Messenger                                |            2
 IHG®: Hotel Deals & Rewards                                       |            2
 Propel BI APP                                                     |            2
 TN Patta, Chitta, EC                                              |            2
 Blitzer.de                                                        |            2
 Counter Terrorist Gun Strike CS: Special Forces                   |            2
 AppBrain Ad Detector                                              |            2
 Advanced EX for NISSAN                                            |            2
 The Societe Generale App                                          |            2
 Wedding LookBook by The Knot                                      |            2
 I am rich(premium)                                                |            2
 European War 6: 1804                                              |            2
 CM Security Lite - Antivirus                                      |            2
 DG Report Reminder                                                |            2
 EW Widgets for Zooper                                             |            2
 Bird - Enjoy The Ride                                             |            2
 EZ Usenet for Easynews®                                           |            2
 Every disease has a drug without internet                         |            2
 Insave-Download for Instagram                                     |            2
 BH Patrole                                                        |            2
 Kids Animals Jigsaw Puzzles 😄                                   |            2
 Dead Target Zombie Shooting US Sniper Killer Squad                |            2
 Convert degree Celsius to Fahrenheit or °F to °C                  |            2
 Toca Life: Hospital                                               |            2
 Litnet - E-books                                                  |            2
 Discovery K!ds Play!                                              |            2
 Herpes Dating: 1,000K+ Singles                                    |            2
 Mass Effect: Andromeda APEX HQ                                    |            2
 Learn English from Persian: Persian to English                    |            2
 Dolphin Browser - Fast, Private & Adblock🐬                       |            2
 CT POSITIONING                                                    |            2
 Mirror - Zoom & Exposure -                                        |            2
 Video Editor,Crop Video,Movie Video,Music,Effects                 |            2
 Alto’s Adventure                                                  |            2
 DW - Breaking World News                                          |            2
 BQ-መጽሐፍ ቅዱሳዊ ጥያቄዎች                                            |            2
 Official NBSTSA CSFA Exam Prep                                    |            2
 Bacterial Vaginosis Symptoms                                      |            2
 Space Z 🌏 🚀Icon Pack Theme                                     |            2
 US Mission - buy gourmet movie KTV                                |            2
 Dairy Queen                                                       |            2
 Yahoo Finance                                                     |            2
 Sun & Moon AR Locator                                             |            2
 The Wall Street Journal: Business & Market News                   |            2
 AEMET’s time                                                      |            2
 True Contact - Real Caller ID                                     |            2
 ClanHQ                                                            |            2
 Quran Khmer Offline AY                                            |            2
 Turbo FAST                                                        |            2
 Groupon - Shop Deals, Discounts & Coupons                         |            2
 TI-84 CE Graphing Calculator Manual TI 84                         |            2
 Merge Dragons!                                                    |            2
 BF CG Abstract Pictures                                           |            2
 PlayStation App                                                   |            2
 DG Coupon                                                         |            2
 CB Trader                                                         |            2
 Moonlight GO Weather EX                                           |            2
 Mirror Photo:Editor Collage (HD)                                  |            2
 Simple Notepad                                                    |            2
 CA Auth ID                                                        |            2
 C Offline Tutorial                                                |            2
 Kariyer.net                                                       |            2
 Ghostery Privacy Browser                                          |            2
 Doctor On Demand                                                  |            2
 E-cigarette for free                                              |            2
 Smokes for CS:GO                                                  |            2
 Background Changer & Eraser                                       |            2
 AdventureQuest Dragons                                            |            2
 Food Calorie Calculator                                           |            2
 Race Manager FP                                                   |            2
 DH Pineapple Poker OFC                                            |            2
 Money Manager Ex for Android                                      |            2
 Curriculum vitae App CV Builder Free Resume Maker                 |            2
 Doctors Care                                                      |            2
 DW Contacts widget                                                |            2
 DB for Fallout Shelter                                            |            2
 Ultimate Quiz for CS:GO - Skins | Cases | Players                 |            2
 Princess Palace: Royal Pony                                       |            2
 Grubhub: Food Delivery                                            |            2
 Knife&Axe Throwing                                                |            2
 DU Recorder – Screen Recorder, Video Editor, Live                 |            2
 AS Guía de las Ligas 2017-2018                                    |            2
 CG Freelancer                                                     |            2
 5 Nights at Cube Pizzeria City                                    |            2
 Brightest LED Flashlight                                          |            2
 JustSayHi- Dating App. Chat & Meet Singles Nearby                 |            2
 FN Cam                                                            |            2
 Fuelio: Gas log & costs                                           |            2

-- FS4. Find all the apps that have education as one of their genres.
SELECT app_name, genres
FROM analytics
WHERE array_position(genres, 'Education') > 0 ;
                                   app_name                                    |              genres
-------------------------------------------------------------------------------+----------------------------------
 GO Keyboard - Emoticon keyboard, Free Theme, GIF                              | {Education,Education}
 DU Recorder – Screen Recorder, Video Editor, Live                             | {Education,Education}
 Bike Race Free - Top Motorcycle Racing Games                                  | {Education,Education}
 KakaoTalk: Free Calls & Text                                                  | {Education,Education}
 Dolphin Browser - Fast, Private & Adblock🐬                                    | {Education,Education}
 Opera Browser: Fast and Secure                                                | {Education,Education}
 MARVEL Contest of Champions                                                   | {Education,Education}
 FotMob - Live Soccer Scores                                                   | {Education}
 Internet Speed Meter Lite                                                     | {Education}
 Hitman Sniper                                                                 | {Education}
 SAMURAI vs ZOMBIES DEFENSE                                                    | {Education}
 Grindr - Gay chat                                                             | {Education}
 ZenUI Help                                                                    | {Education}
 Yahoo Finance                                                                 | {Tools,Education}
 Carousell: Snap-Sell, Chat-Buy                                                | {Education}
 Sonic the Hedgehog™ Classic                                                   | {Education}
 Terminal Emulator for Android                                                 | {Adventure,Education}
 Beauty Camera - Selfie Camera                                                 | {Adventure,Education}
 Motocross Beach Jumping 3D                                                    | {Education,"Brain Games"}
 100 Doors of Revenge                                                          | {Education,"Brain Games"}
 DHgate-Shop Wholesale Prices                                                  | {Education}
 Launcher                                                                      | {Education}
 Ovia Pregnancy Tracker & Baby Countdown Calendar                              | {Education}
 Business Calendar 2                                                           | {Education}
 Microsoft Remote Desktop                                                      | {Education}
 Dr. Chess                                                                     | {Education}
 Glam Doll Salon - Chic Fashion                                                | {Education}
 SW Battlefront Companion                                                      | {Education,"Brain Games"}
 NASCAR MOBILE                                                                 | {Education}
 myAT&T                                                                        | {Education}
 Download Manager                                                              | {Education}
 Meetup                                                                        | {Education}
 Pregnancy Week By Week                                                        | {Education}
 Google Analytics                                                              | {Education}
 Mobi Calculator free & AD free!                                               | {Education}
 KakaoMap - Map / Navigation                                                   | {Education}
 AP Mobile - Breaking News                                                     | {Education}
 Match™ Dating - Meet Singles                                                  | {Education}
 Guess The Emoji                                                               | {Education}
 AE 3D MOTOR :Racing Games Free                                                | {Education}
 Gangster Town                                                                 | {Education}
 Dino T-Rex                                                                    | {Education}
 Downtown Mafia: Gang Wars (Mobster Game) Free                                 | {Education}
 NHL                                                                           | {Education}
 Real DJ Simulator                                                             | {Education}
 Millionaire Quiz Free: Be Rich                                                | {Education}
 Real Estate sale & rent Trovit                                                | {Education}
 Fuelio: Gas log & costs                                                       | {Education,Education}
 Adobe Illustrator Draw                                                        | {Education,Education}
 Smart Keyboard Trial                                                          | {Education,Education}
 Blitzer.de                                                                    | {Education,Education}
 Chrome Dev                                                                    | {Education}
 kicker football news                                                          | {Education,Education}
 Cook Baked Lasagna                                                            | {Education,Education}
 The Holy Rosary                                                               | {Education,Education}
 RadarNow!                                                                     | {Education}
 Facetune - For Free                                                           | {Education,Education}
 Calculator with Percent (Free)                                                | {Education,Education}
 Daum Mail - Next Mail                                                         | {Education}
 PDF Viewer & Book Reader                                                      | {Education}
 Moto File Manager                                                             | {Education}
 VUE: video editor & camcorder                                                 | {Education}
 AndStream - Streaming Download                                                | {Education}
 mysms SMS Text Messaging Sync                                                 | {Educational,Education}
 Urbanspoon Restaurant Reviews                                                 | {Education}
 Intesa Sanpaolo Mobile                                                        | {Education}
 Love Sticker                                                                  | {Education}
 Pink Roses Live Wallpaper                                                     | {Education}
 Skype Lite - Free Video Call & Chat                                           | {Education}
 Golden Launcher                                                               | {Education}
 Regal Cinemas                                                                 | {Education}
 Shoot Bubble - Fruit Splash                                                   | {Education}
 Pluto TV - It’s Free TV                                                       | {Education}
 Down Dog: Great Yoga Anywhere                                                 | {Education}
 Microsoft Edge                                                                | {Education}
 Ruler                                                                         | {Education}
 Esporte Interativo Plus                                                       | {Education}
 The translator                                                                | {Education}
 LEGO® Friends: Heartlake Rush                                                 | {Education}
 Experian - Free Credit Report                                                 | {Education,"Pretend Play"}
 Extreme Super Car Driving 3D                                                  | {Education,"Pretend Play"}
 Chrome Canary (Unstable)                                                      | {Education,"Brain Games"}
 RetroArch                                                                     | {Education}
 eBoox: book reader fb2 epub zip                                               | {Education}
 Zoopla Property Search UK - Home to buy & rent                                | {Education}
 Groovebook Photo Books & Gifts                                                | {Education}
 Office Bike Racing Simulator                                                  | {Education}
 DU Browser Mini(Small&Fast)                                                   | {Education}
 El Laberinto del Demonio 3D                                                   | {Education}
 Discovery K!ds Play!                                                          | {Education,Education}
 SONIC Drive-In                                                                | {Education}
 Doctor On Demand                                                              | {Educational,Education}
 Puffin Browser Pro                                                            | {Education}
 Fandom: Five Nights at Freddys                                                | {Education}
 Drugs.com Medication Guide                                                    | {Education}
 OO Launcher for Android O 8.0 Oreo™ Launcher                                  | {Education}
 Shooter Sniper CS - FPS Games                                                 | {Education}
 Sandbox Number Coloring Book Art - Color By Number                            | {Education}
 Tencent Video - Supporting the whole network                                  | {Education}
 stranger chat - anonymous chat                                                | {Education}
 My Dressing - Fashion closet                                                  | {Educational,Education}
 DS video                                                                      | {Education,"Pretend Play"}
 Al-Quran 30 Juz free copies                                                   | {Education,"Music & Video"}
 Simple Notepad                                                                | {Education,"Music & Video"}
 SnowMobile Parking Adventure                                                  | {Educational,Education}
 Huntington Mobile                                                             | {Education}
 RollerCoaster Tycoon® Classic                                                 | {Simulation,Education}
 White Noise Baby                                                              | {Education}
 Zombie Hunter King                                                            | {Education}
 Makeup Photo Editor: Makeup Camera & Makeup Editor                            | {Education}
 Apartment, Home Rental Search: Realtor.com Rentals                            | {Education,"Pretend Play"}
 AdventureQuest Dragons                                                        | {Education,"Pretend Play"}
 Farsi Keyboard                                                                | {Education}
 Gyft - Mobile Gift Card Wallet                                                | {Education}
 Baby ABC in box! Kids alphabet games for toddlers!                            | {Education}
 Five nights at Minecraft                                                      | {Educational,Education}
 The TK-App - everything under control                                         | {Education}
 Weather BZ                                                                    | {Education,Education}
 Litnet - E-books                                                              | {Education,Education}
 Survival Mobile:10,000 BC                                                     | {Education}
 Manga Books                                                                   | {Educational,Education}
 Game for KIDS: KIDS match’em                                                  | {Education}
 U - Webinars, Meetings & Messenger                                            | {Educational,Education}
 Masha and the Bear. Games for kids                                            | {Education}
 BackCountry Navigator TOPO GPS PRO                                            | {Education}
 Monica Toy TV                                                                 | {Education}
 Rock N’ Cash Casino Slots -Free Vegas Slot Games                              | {Education}
 Walmart MoneyCard                                                             | {Education}
 Pro App for Craigslist                                                        | {Educational,Education}
 F-Sim Space Shuttle                                                           | {Educational,Education}
 Workout Tracker & Gym Trainer - Fitness Log Book                              | {Educational,Education}
 FC Barcelona Official Keyboard                                                | {Education,Education}
 Where to travel - ticket. hotel. train ticket. car ticket. travel. tickets    | {Education}
 BeFunky Photo Editor Pro                                                      | {Casual,Education}
 How Old am I?                                                                 | {Education}
 English to Urdu Dictionary                                                    | {Education}
 Curriculum vitae App CV Builder Free Resume Maker                             | {Simulation,Education}
 Basketball FRVR - Shoot the Hoop and Slam Dunk!                               | {Education}
 H Band 2.0                                                                    | {Education}
 Dr. Panda Restaurant 2                                                        | {Education}
 My baby Game (Balloon POP!)                                                   | {Education}
 Toca Life: Hospital                                                           | {Education,Creativity}
 Moto Photo Editor                                                             | {Education}
 Wedding LookBook by The Knot                                                  | {Education,Education}
 Dr. Panda & Toto’s Treehouse                                                  | {Education}
 DRAGON QUEST VI                                                               | {Education}
 ER Injection Simulator: Blood Test Doctor Hospital                            | {Education,"Pretend Play"}
 My Ex Girlfriend Comes Back                                                   | {Education,"Pretend Play"}
 Smokes for CS:GO                                                              | {Education,"Pretend Play"}
 OurHome – chores, rewards, groceries and calendar                             | {Educational,Education}
 SYFY                                                                          | {Education}
 eBiblio                                                                       | {Educational,Education}
 ACE Elite                                                                     | {Education}
 C Programming - Learn Code, Theory & Discuss                                  | {Educational,Education}
 REV Robotic Enhance Vehicles                                                  | {Education,"Action & Adventure"}
 English Communication - Learn English for Chinese (Learn English for Chinese) | {Education}
 Zagat                                                                         | {Education}
 Ultimate Quiz for CS:GO - Skins | Cases | Players                             | {Educational,Education}
 10 Best Foods for You                                                         | {Education}
 NerdWallet: Personal Finance, Credit Score & Cash                             | {Education,"Pretend Play"}
 dz NEWS Algerie                                                               | {Education}
 Strava.cz                                                                     | {Education}
 Mayo Clinic                                                                   | {"Health & Fitness",Education}
 MegaNDS (NDS Emulator)                                                        | {Education,Creativity}
 Blurfoto : Auto blur photo background & DSLR focus                            | {Education,Creativity}
 Drive 4x4 Luxury SUV Jeep                                                     | {Educational,Education}
 My CookBook Pro (Ad Free)                                                     | {Education}
 MIUI Style GO Weather EX                                                      | {Education}
 Xero Accounting Software                                                      | {Education}
 Kids Learn Languages by Mondly                                                | {Casual,Education}
 Get Free V-bucks_fortnite Hints                                               | {Education}
 The Grand Way                                                                 | {Education}
 Walking: Pedometer diet                                                       | {Education}
 T-Mobile DIGITS                                                               | {Education}
 Microsoft Power BI–Business data analytics                                    | {Education}
 Faustop Sounds                                                                | {Education,"Music & Video"}
 JOBS.bg                                                                       | {Entertainment,Education}
 Eh Volevi!                                                                    | {Education}
 FJ 4x4 Cruiser Snow Driving                                                   | {Education}
 Kairo XP (for HD Widgets)                                                     | {Education}
 Hamilton — The Official App                                                   | {Educational,Education}
 Twice: Buy, Sell Clothing                                                     | {Education}
 Emo Ads Blocker Browser                                                       | {Education}
 Izneo, Read Manga, Comics & BD                                                | {Education}
 FK Crvena Zvezda Izzy                                                         | {Education}
 Elifba Quran Learning Game                                                    | {Education}
 European War 6: 1804                                                          | {Educational,Education}
 Ey Sey Storytime រឿងនិទានតាឥសី                                                  | {Educational,Education}
 Em Fuga Brasil                                                                | {Education}
 Recipes for hair and face tried                                               | {Education,"Pretend Play"}
 The Video Messenger App                                                       | {Education}
 Picktrainer: India’s largest photo contest app                                | {Education}
 Masterchef Cooking Games: Fun Restaurant & Kitchen                            | {Education}
 Armed Cam Gun Pack                                                            | {Parenting,Education}
 Educationboard Results BD                                                     | {Education}
 FD Shift Calendar Widget                                                      | {Education}
 Just She - Top Lesbian Dating                                                 | {Education}
 AE Air Hockey                                                                 | {Educational,Education}
 Easy V-Bux free                                                               | {Education}
 OWLIE BOO                                                                     | {Education}
 Blackpink as if it’s your last                                                | {Education}
 Svenska Dagbladet                                                             | {Education}
 Keyboard for Sony Xperia J                                                    | {Education}
 FREE LIVE TALK                                                                | {Education}
 DS Tower Defence                                                              | {Education}
 Florida Lottery Results                                                       | {Parenting,Education}
 FD VR Video Player - (Stored)                                                 | {Education}
 Dairy Queen                                                                   | {Education,"Action & Adventure"}
 Summer Camp Island AR                                                         | {Education,Education}
 AK Interactive                                                                | {Education}
 Bacterial Vaginosis Symptoms                                                  | {Education,"Pretend Play"}
 Beautiful Design Birthday Cake                                                | {Education}
 Skin Care and Natural Beauty                                                  | {Education,Creativity}
 TN Patta, Chitta, EC                                                          | {Parenting,Education}
 Truck Transport Raw Material                                                  | {Education}
 EMT Tutor NREMT-B Study Guide                                                 | {Parenting,Education}
 Tunisian Dinar: Exchange rate                                                 | {Education}
 Tracks                                                                        | {Lifestyle,Education}
 Going Abroad                                                                  | {Education}
 Bulgarian French Dictionary Fr                                                | {Education}
 Run on Earth                                                                  | {Education,Education}
 m:go BiH                                                                      | {Education}
 DK Pittsburgh Sports                                                          | {Education}
 Offroad Oil Tanker Driver Transport Truck 2019                                | {Education}
 Lifeguard Beach Rescue ER Emergency Hospital Games                            | {Education}
 Florida Blue                                                                  | {Education}
 Acupuncture Assistant                                                         | {Education}
 Portable Wi-Fi hotspot Premium                                                | {Education}
 Paramedic Pocket Prep                                                         | {Education}
 ESLock File Recovery Lite                                                     | {Education}
 Numbers Into Words                                                            | {Educational,Education}
 Birthdays & Other Events                                                      | {Education}
 IHOP®                                                                         | {Education}
 Cy-Fair FCU Mobile Banking                                                    | {Education}
 SportCAM                                                                      | {Education}
 Nighty Night Circus                                                           | {Education,Education}
 Golden telegram                                                               | {Strategy,Education}
 Artificial Intelligence                                                       | {Education}
 Digital Clock : Simple, Tiny, Ad-free Desk Clock.                             | {Education}
 My Style CM 13 Theme                                                          | {Education,Education}
 أحداث وحقائق | خبر عاجل في اخبار العالم                                       | {Education}
 University of Alabama                                                         | {Education}
 Hypertension Hi blood pressure                                                | {Education,Education}
 Ultimate Watch 2 watch face                                                   | {Education}
 Sugar Daddy Dating App                                                        | {Educational,Education}
 GRE Tutor                                                                     | {Education}
 AQ Aspergers Test                                                             | {Education}
 KMTV 3 News Now                                                               | {Education}
 Maps CU                                                                       | {Education,Education}
 MyAV Remote for Denon & Marantz AV Receivers                                  | {Education}
 Dead Target Zombie Shooting US Sniper Killer Squad                            | {Education,Education}
 Essential Resources                                                           | {Education}
 CP Plus Showcase                                                              | {Education}
 Permit Test AZ Arizona MVD DOT                                                | {Education}
 Fon WiFi App – WiFi Connect                                                   | {Education}
 Calvin Klein – US Store                                                       | {Education}
 Alabama DMV Permit Test - AL                                                  | {Education}
 BS Calendar / Patro / पात्रो                                                   | {Education}
 Ham Radio Prefixes                                                            | {Education}
 Stickers for Imo, fb, whatsapp                                                | {Educational,Education}
 Painting By Numbers                                                           | {Education}
 CV Engineer - Free Resume Maker & CV Templates                                | {Education}
 CG Shikshak                                                                   | {Education,"Music & Video"}
 Counter Terrorist Gun Strike CS: Special Forces                               | {Education,"Music & Video"}
 Florida Today                                                                 | {Education,"Pretend Play"}
 Space Z 🌏 🚀Icon Pack Theme                                                    | {Education,Creativity}
 CB Pay                                                                        | {Educational,Education}
 Smart Wi-Fi Hotspot PRO                                                       | {Education}
 BQ-መጽሐፍ ቅዱሳዊ ጥያቄዎች                                                            | {Educational,Education}
 Birmingham City FC                                                            | {Education,Education}
 감성학원 BL 첫사랑                                                            | {Education,Creativity}
 CP Calculator                                                                 | {Education}
 m>notes notepad                                                               | {Education}
 Wrinkles and rejuvenation                                                     | {Education}
 FD Community FCU Mobile                                                       | {Education}
 Remote Control For All AC - Universal Remote                                  | {Education}
 Modern Sniper Strike: Best Commando Action 2k18                               | {Education}
 DV-2019 Results                                                               | {Education}
 Q Wunder                                                                      | {Education}
 Jump’N’Shoot Attack                                                           | {Education}
 Digi Dex for DW Next Order @PS4                                               | {Puzzle,Education}
 dB Meter - measure sound & noise level in Decibel                             | {Education}
 Z Camera                                                                      | {Education}
 TAXLANDIA                                                                     | {Education,Education}
 Ríos de Fe                                                                    | {Education,"Action & Adventure"}
 Vienna U-Bahn                                                                 | {Education}
 Job CV Maker-Portfolio Maker , Resume Maker                                   | {Education}
 C BOOK-C PROGRAMS                                                             | {Education}
 Official NBSTSA CSFA Exam Prep                                                | {Education,"Action & Adventure"}
 First Federal Bank of Florida                                                 | {Educational,Education}
 FG Mobile                                                                     | {Education}
 N Launcher: Nougat Theme                                                      | {Education}
 Villains vs Superheroes                                                       | {Education}
 Resume / CV                                                                   | {Education}
 infirmiers                                                                    | {Education}
 FE CREDIT - TET VUI                                                           | {Education}
 DNS Changer - BEST (Gprs/Edge/3G/H/H+/4G)                                     | {Education}
 BD Fishpedia                                                                  | {Education}
 SCM FPS Status                                                                | {Education}
 Who Viewed My FB Profile                                                      | {Education}
 ck-modelcars Shop                                                             | {Education}
 DC Comics Amino                                                               | {Education}
 Sun & Moon AR Locator                                                         | {Educational,Education}
 Q-Ticketing                                                                   | {Education}
 CV Maker for Job Applications:Photo Resume Builder                            | {Education}
 Lite Messenger for Facebook Lite                                              | {Education}
 Ad Blocker Turbo - Adblocker Browser                                          | {Education}
 FlexBook                                                                      | {Educational,Education}
 Eating Show - Food BJ                                                         | {Education,Education}
 Mama Lala ’s song                                                             | {Casual,Education}
 Santa Panda Bubble Christmas                                                  | {Education}
 BD Attendance                                                                 | {Education,Education}
 Florida Keys                                                                  | {Education}
 I will return his eggs                                                        | {Education}
 DM Me - Chat                                                                  | {Education}
 BG Metro - Red voznje                                                         | {Education}
 The Ledger - Lakeland, Florida                                                | {Education,Education}
 C Offline Tutorial                                                            | {Education,Education}
 X Home Bar - Home Bar Gesture Pro                                             | {Education,Education}
 Táxi Nacional BR                                                              | {Education}
 Little Teddy Bear Colouring Book Game                                         | {Education}
 Bomb and Nade Timer for CS:GO                                                 | {Education}
 abeoCoder                                                                     | {Education}
 VITEK EH DVR Viewer (Pro)                                                     | {Education}
 Calcium Pro                                                                   | {Educational,Education}
 NewTek NDI                                                                    | {Education}
 BI-LO Rx                                                                      | {Education}
 RoboPad++                                                                     | {"Books & Reference",Education}
 Dr. McDougall Mobile Cookbook                                                 | {Education}
 T Uploader                                                                    | {Educational,Education}
 Flashlight Free w/ compass                                                    | {Educational,Education}
 U Pull It Auto Dismantler                                                     | {Education}
 CP ToolBox                                                                    | {Education,Education}
 Mummatikabalkuragi                                                            | {Education,Creativity}
 Listen to the story~The Story of the Fairy Tales                              | {Education,"Action & Adventure"}
 Stickman and Axe                                                              | {Education,"Action & Adventure"}
 Where Am I? GPS Loc                                                           | {Education}
 Ai File Viewer                                                                | {Education}
 Central Bank and Trust Co.                                                    | {Education}
 Patron DB                                                                     | {Education}
 AAFP                                                                          | {Education}
 Latest Emmanuella Comedy Video                                                | {Education}
 FL SW Fishing Regulations                                                     | {Education}
 CB Mobile Access                                                              | {Education}
 X Back - Icon Pack                                                            | {Education}
 Dp for Facebook                                                               | {Education}
 Learn To Draw Kawaii Characters                                               | {Education}
 K-Otic Universe                                                               | {Education}
 FD Mobile                                                                     | {Education}
 Jax Sheriff (FL)                                                              | {Education}
 Deck Builder & Analyzer for CR                                                | {Education}
 Fanfic-FR                                                                     | {Education}
 Doctor Games For Girls - Hospital ER                                          | {Education}
 EZ TV Player                                                                  | {Education}
 cluster.dk                                                                    | {Education}
 Tamago egg                                                                    | {Education}
 Bullshite!                                                                    | {Education,"Pretend Play"}
 CL Pro Client for Craigslist                                                  | {Education}
 98point6                                                                      | {Education}
 Restaurantführer Südbaden                                                     | {Education,"Pretend Play"}
 Vote 4 DC                                                                     | {Education,"Pretend Play"}
 CH info                                                                       | {Education}
 DT NO.I                                                                       | {Education}
 Learn C Programming (Examples) (OFFLINE)                                      | {Education}
 Explore Sedona & Northern AZ                                                  | {Education}
 DG Phone Call Task Switcher                                                   | {Education}
 Niche: College, K-12, and Neighborhood Search                                 | {Education,Education}
 I am extremely Rich                                                           | {Education}
 Quran Khmer Offline AY                                                        | {Educational,Education}
 BG Sports News                                                                | {Education,Education}
 Cl-app!                                                                       | {Education}
 EG Movi                                                                       | {Education}
 The Daily BJ                                                                  | {Education}
 BAC DZ Questionnaire                                                          | {Education}
 payermonstationnement.fr                                                      | {Education}
 AP Math & Computer Science                                                    | {Educational,Education}
 SenseView BT Zephyr Sensor                                                    | {Education}
 CL Notifier                                                                   | {Education}
 BP Tracker-Symptoms & Solution                                                | {Education}
 Houlihan Lawrence                                                             | {Education}
 End Anxiety Pro - Stress, Panic Attack Help                                   | {Education}
 BK Murli Offline April 2017                                                   | {Education}
 DW Mobile                                                                     | {Education}
 TattooSupplies.eu                                                             | {Education}
 My baby firework (Remove ad)                                                  | {Education}
 Eternal Light AG                                                              | {Education}
 BD Online News                                                                | {Education}
 edp re:dy smarthome                                                           | {Education}
 FL House                                                                      | {Education}
 J.ME Fly                                                                      | {Education,Education}
 Math Games for Pre-K - Grade 4                                                | {Education}
 BV Smart                                                                      | {Education,Education}
 Ultra CE calculator                                                           | {Education}
 AC Air condition Troubleshoot,Repair,Maintenance                              | {Education,Education}
 BH Patrole                                                                    | {Educational,Education}
 Check Lottery Tickets - Florida                                               | {Education}
 EF-myHR                                                                       | {Education}
 EG-Boost                                                                      | {Education}
 EV Connect                                                                    | {Education}
 Scratch-Off Guide for FL Lotto                                                | {Education}
 Materialistic P Wallpapers                                                    | {Education}
 R Studio                                                                      | {Education}
 Sisense Mobile BI                                                             | {Education}
 Catholic La Bu Zo Kam                                                         | {Education}
 Puck AI Personal Assistant Robot                                              | {Education}
 Weapons simulator AK-47                                                       | {Education}
 Poker Equity Calculator Pro for No Limit Hold’em                              | {Education}
 Q Call                                                                        | {Education}
 AI Draw | Art Filter for Selfie                                               | {Education}
 Movement BE                                                                   | {Education}
 BJ Bridge Free (2018)                                                         | {Education}
 BF Scale Health Fitness Tool                                                  | {Education}
 CX-60                                                                         | {Education}
 ACCDB MDB DB Manager Pro - Editor for MS Access                               | {Education}
 EF Calculator                                                                 | {Education}
 Cardinal Glennon ER Reference                                                 | {Education}
 Pin-fo                                                                        | {Education}
 AJ Styles Wallpaper 2018 - AJ Styles HD Wallpaper                             | {Education}
 CT POSITIONING                                                                | {Education,Education}
 5 Minute Veterinary Consult: Canine & Feline                                  | {Education}
 Q-Tech Companion App                                                          | {Education}
 Learn R Language Easy Way                                                     | {Education}
 A-Z Screen Recorder -                                                         | {Education}
 Kovax Europe B.V.                                                             | {Education}
 Prosperity                                                                    | {Education}
 CA Case Management                                                            | {Education}
 Live DV                                                                       | {Education}
 Sports Lite                                                                   | {Education,Education}
 FP BW LCD View                                                                | {Education}
 Helping BD                                                                    | {Education}
 CQ Hotels                                                                     | {Education}
 Dotti EU                                                                      | {Education}
 An Elite Warrior Ex                                                           | {Education}
 Cv maker / Job cv maker                                                       | {Education}
 BH Rocking                                                                    | {Education}
 Bo’s Bedtime Story                                                            | {Education}
 CV Templates 2018                                                             | {Education}
 RETRO Shocked DW-6000                                                         | {Education}
 FILL EC                                                                       | {Education}
 Me-eh                                                                         | {Parenting,Education}
 EP Kalkulator el. energije                                                    | {Education}
 PopStar                                                                       | {Education}
 Whist - Tinnitus Relief                                                       | {Education}
 BD Online Passport Application                                                | {Education,"Pretend Play"}
 BD Hospital’s                                                                 | {Education,"Pretend Play"}
 Monastery of El Escorial                                                      | {Education}
 BURST Professionals                                                           | {Education}
 W Pro - Weather Forecast & Animated Weather Maps                              | {Parenting,Education}
 CB Trader                                                                     | {Educational,Education}
 DV 2018 Winners Guide                                                         | {Education}
 Sanu Ek Pal Chain Song Videos - RAID Movie Songs                              | {Education}
 EP Lab Digest                                                                 | {Educational,Education}
 Calvary.ch App                                                                | {Education}
 CX North America                                                              | {Education}
 AV MAX                                                                        | {Education}
 MbH BP                                                                        | {Education}
 Wuwu & Co.                                                                    | {Education}
 CW Studio ®                                                                   | {Education}
 EP Spotter                                                                    | {Education}
 EP Cloud                                                                      | {Education}
 Calculator Fn                                                                 | {Education}
 BK Arogyam Task Track                                                         | {Education}
 CK Eorzea Timepiece                                                           | {Education}
 BM Tahmin: Ücretsiz İddaa Tahminleri                                          | {Education}
 Wallpaper.cz                                                                  | {Education}
 Kiamichi EC                                                                   | {Education}
 Invasion: Defend EU                                                           | {Education}
 EY Forensics                                                                  | {"Books & Reference",Education}
 FR Calculator                                                                 | {Education}
 Sarajevo Film Festival - Official                                             | {Education,"Pretend Play"}
 SAMSUNG RETAILMODE 2018                                                       | {Education}
 G-NetWiFi Pro                                                                 | {Education}
 The Pursuit of God                                                            | {Education}
 BG TV App                                                                     | {Education}
 BM SPM Practice                                                               | {Education}
 TuenMun BM                                                                    | {Education}
 Bo’s Dinnertime Story                                                         | {Education}
 CG - Conference Call Add-On                                                   | {Education}
 CX-95WIFI                                                                     | {Education}
 RoutePlan.cz                                                                  | {Education}
 DW Security                                                                   | {Education}
 Human Dx                                                                      | {Education}
 EB-TV                                                                         | {Education}
 DMC ER Now                                                                    | {Education}
 EasyLive - FB Live Helper                                                     | {Education}
 FK Sarajevo                                                                   | {Education}
 Online Girls Chat Group                                                       | {Education}
 AG Fast Service Automotive                                                    | {Education}
 CJ’s Tire & Automotive                                                        | {Education}
 Interactive NPC DM Tool                                                       | {Education}
 DS-Students                                                                   | {Education}
 EW Widgets for Zooper                                                         | {Parenting,Education}
 Ew, the small alien                                                           | {Education}
 FO RCBT                                                                       | {Education}
 Fo Fo Fish                                                                    | {Education}
 KBA-EZ Health Guide                                                           | {Educational,Education}
 mon guide au bank populaire -infos et instructions                            | {Education,Education}
 Ay Sabz Gunbad Waly                                                           | {Education}
 Phonics Puzzles                                                               | {Education}
 CF Life                                                                       | {Education,Education}
 CI Capital - Dynamic                                                          | {Education}
 CJ Wilson’s ZoomZoomnation                                                    | {Education}
 MYCU TX Mobile Banking                                                        | {Education}
 CW Deposit                                                                    | {Education}
 dt Pro                                                                        | {Education}
 FO AIRBUS TLSE                                                                | {Education}
 Fr. Mike Schmitz Audio Teachings                                              | {Education}
 Sway Medical                                                                  | {Educational,Education}
 Cute Questions BF                                                             | {Education}
 BH Açaí                                                                       | {Education}
 Propel BI APP                                                                 | {Educational,Education}
 BS Tractor                                                                    | {Education}
 CB Mobile Biz                                                                 | {Education}
 CK Pharmacies                                                                 | {Education}
 CL 2ne1 Wallpaper KPOP HD Best                                                | {Education}
 CQ-Alert                                                                      | {Education,Education}
 CT and XR Dose Calculator                                                     | {Education,Education}
 CY Digital Net                                                                | {Education}
 DB Manager                                                                    | {Education}
 The DG Buddy                                                                  | {Education}
 ODTMobile v4                                                                  | {Education}
 DV KING 4K                                                                    | {Education}
 EJ Elite Prospects League                                                     | {Education}
 FK Zemun                                                                      | {Education}
 Awake Dating                                                                  | {Educational,Education}
 Pinkalicious Party                                                            | {Education}
 FHR 5-Tier 2.0                                                                | {Education}
 Ag Tools                                                                      | {Education}
 Analog BW - Camera filter effect foto film retouch                            | {Education}
 CI View                                                                       | {Education}
 CL-Customer Care                                                              | {Education}
 Trauma CT Head Rules                                                          | {Education}
 Droidbug BusyBox Advance PRO                                                  | {Education}
 DM הפקות                                                                      | {Education}
 DY TECHNICAL GYAN                                                             | {Education}
 EC MANAGER                                                                    | {Simulation,Education}
 EC Apps List                                                                  | {Education}
 EF Forms                                                                      | {Education}
 EP FCU                                                                        | {Education}
 EU Life Explorer                                                              | {Education}
 EY Digital Tax AR                                                             | {Education}
 Familial Hypercholesterolaemia Handbook                                       | {Education}
 FK Teplice                                                                    | {Education}
 Austria Wien FK - Fussball - Inoffizielle App                                 | {Education}
 TCF National Conference                                                       | {Education}
 PatientPORTAL by InteliChart                                                  | {Education}
 SOLEM AG                                                                      | {Education,"Pretend Play"}
 A.J. Styles HD Wallpapers 2018                                                | {Education}
 AW Radio                                                                      | {Education}
 Axe Throw: Flip Champ Axes Champion Throwing Games                            | {Education}
 Read it easy for BK                                                           | {Education}
 bk Group Mobile                                                               | {Education}
 SLANGY-Perfect BK World Theme                                                 | {Education}
 Capital Bk Mobile Business Dep                                                | {Education}
 BK Travel Solutions                                                           | {Education}
 UM BP Track                                                                   | {Education}
 van Gennip Textiles BV                                                        | {Education}
 TI-84 CE Graphing Calculator Manual TI 84                                     | {Education,"Pretend Play"}
 CI Crew                                                                       | {Education}
 CJ the REALTOR                                                                | {Education}
 UFO-CQ                                                                        | {Education}
 30WPM Amateur ham radio Koch CW Morse code trainer                            | {Education}
 DB FahrtProfi                                                                 | {Education}
 LC-DB                                                                         | {Education}
 DF Glue Board                                                                 | {Education}
 Touch DV                                                                      | {Education,"Pretend Play"}
 EC Reps                                                                       | {Education}
 EJ Trívia Game                                                                | {Education}
 The FN "Baby" pistol explained                                                | {Education}
 Private Dating, Hide App- Blue for PrivacyHider                               | {Education}
 Visualmed                                                                     | {Education}
 RT 516 VET                                                                    | {Education}
 Doctors Care                                                                  | {Education,"Pretend Play"}
 Drug Calculator                                                               | {Education}
 ear super hearing                                                             | {Education}
 Video Wallpaper Show                                                          | {Trivia,Education}
 Popsicle Launcher for Android P 9.0 launcher                                  | {Education}
 Z PIVOT                                                                       | {Education}
 Oklahoma Ag Co-op Council                                                     | {Education}
 Border Ag & Energy                                                            | {Education}
 AJ AUTO                                                                       | {Education}
 AJ Rafael Music Lyrics                                                        | {Education}
 AJ-COMICS                                                                     | {Education}
 Wallpapers New AK 47 Assault Rifle Guns Arms                                  | {Education}
 Jigsaw Puzzles AK 74M                                                         | {Education}
 AQ wisdom +                                                                   | {Education}
 AQ Dentals                                                                    | {Education}
 Top #5 Bσσkie in AU                                                           | {Education}
 AV Anthony’s                                                                  | {Education}
 INTERACTIVE CALCULUS PRO                                                      | {Education}
 25 Mins Ako ay may lobo Etc Pinoy Kid Song Offline                            | {Education}
 AY Oakmont                                                                    | {Education}
 Basic Strategy Training BJ 21                                                 | {Education}
 BN Inscript Improved Keyboard                                                 | {Education}
 B. R. Ambedkar Jayanti SMS                                                    | {Education}
 Corporate B.S. Generator                                                      | {Education,"Pretend Play"}
 DHV accountancy BV                                                            | {Education}
 BV Teknisk App                                                                | {Education}
 Register.ca Mobile                                                            | {Education}
 CB Land                                                                       | {Education}
 CG Vidhansabha Chunav 2018                                                    | {Education}
 CJ Infinity                                                                   | {Education}
 USMLE CK Clinical Knowledge Flashcards 2018 Ed                                | {Education}
 C.P. CERVANTES (TOBARRA)                                                      | {Education}
 CY Spray nozzle                                                               | {Education}
 Hlášenírozhlasu.cz                                                            | {Education}
 Wallpapers CZ 75 85                                                           | {Education}
 D.C. Driving/Walking Tours                                                    | {Education}
 ElejaOnline DF                                                                | {Education}
 Aproveita DF                                                                  | {Education}
 HDWallpaper DK                                                                | {Education}
 D.N. College Meerut                                                           | {Education}
 DT                                                                            | {Education}
 BlueDV AMBE                                                                   | {Education}
 EB Demo for Android                                                           | {Education}
 Eb & flow Yoga Studio                                                         | {Education}
 EF Staff                                                                      | {Education}
 Verdant EI                                                                    | {Education}
 EI App 2                                                                      | {Education}
 EU RCD Guide                                                                  | {Education}
 EY Team Connect                                                               | {Education}
 Tenh Ey                                                                       | {Education}
 Santa Fe Espresso & News                                                      | {Education}
 FL Bankers                                                                    | {Education}
 FO SODEXO                                                                     | {Education}
 F-O-Meter                                                                     | {Education}
 FP Live                                                                       | {Education}
 The FP Shield                                                                 | {Education}