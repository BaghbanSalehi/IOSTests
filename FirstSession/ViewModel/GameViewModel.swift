//
//  FilmViewModel.swift
//  FirstSession
//
//  Created by Shayan on 7/14/20.
//  Copyright © 2020 fr.epita. All rights reserved.
//

import Foundation

class GameViewModel {
    
    private var array : [Game]
    
    init() {
        array = [Game(name : "Streets of rage 4",characteristics : "Beat'em up,Action,Indie,Fighting,Single-player,Online Co-op,Online PVP",summary:"streets of Rage 4 will be the first entry to the core series in 25 years, standing as Axel, Adam and Blaze’s glorious return to serving up side-scrolling beatdowns. With lush hand-drawn animations, new combat abilities, and fresh tracks from an amazing team of composers, Streets of Rage 4 will be a masterful tribute to and revitalization of the classic action fans adore The series is known for its electronic dance influenced music around the world. The soundtrack of Streets of Rage 4 is handled by an all-star line-up of musicians like Yuzō Koshiro, Motohiro Kawashima, Yoko Shimomura, Harumi Fujita, Keiji Yamagishi and many more whom will create new amazing tracks for this new episode of the Streets of Rage series. ",developer:Company(name :"Dotemu"),publisher:Company(name:"Dotemu"),year:"2020",rate:8, imageName: "Street of rage",url:"https://store.steampowered.com/app/985890/Streets_of_Rage_4/"),
                 Game(name : "Company of heroes",characteristics : "Strategy,World War 2,RTS,War,Single-player,Online co-op,Online PVP",summary:"Delivering a visceral WWII gaming experience, Company of Heroes redefines real time strategy gaming by bringing the sacrifice of heroic soldiers, war-ravaged environments, and dynamic battlefields to life. Beginning with the D-Day Invasion of Normandy, players lead squads of Allied soldiers into battle against the German war machine through some of the most pivotal battles of WWII. Through a rich single player campaign, players experience the cinematic intensity and bravery of ordinary soldiers thrust into extraordinary events.",developer:Company(name :"Relic Entertainment"),publisher:Company(name:"SEGA"),year:"2006",rate:9, imageName: "Company", url: "https://store.steampowered.com/app/228200/Company_of_Heroes/"),
                 Game(name : "7 Days to die",characteristics : "Survival,Zombies,Open world,Crafting,Single-player,Cross-Platform Multiplayer",summary:"With nearly 10 million copies sold, 7 Days to Die has defined the survival genre, with unrivaled crafting and world-building content. Set in a brutally unforgiving post-apocalyptic world overrun by the undead, 7 Days to Die is an open-world game that is a unique combination of first person shooter, survival horror, tower defense, and role-playing games. It presents combat, crafting, looting, mining, exploration, and character growth, in a way that has seen a rapturous response from fans worldwide. Play the definitive zombie survival sandbox RPG that came first. Navezgane awaits!",developer:Company(name :"The Fun Pimps"),publisher:Company(name:"The Fun Pimps"),year:"2013",rate:6, imageName: "7days", url: "https://store.steampowered.com/app/251570/7_Days_to_Die/"),
                 Game(name : "Dark Souls 3",characteristics : "Difficult,RPG,Single-Player,Online Co-op",summary:"As fires fade and the world falls into ruin, journey into a universe filled with more colossal enemies and environments. Players will be immersed into a world of epic atmosphere and darkness through faster gameplay and amplified combat intensity. Fans and newcomers alike will get lost in the game hallmark rewarding gameplay and immersive graphics.Now only embers remain… Prepare yourself once more and Embrace The Darkness!",developer:Company(name :"FromSoftware"),publisher:Company(name:"BANDAI NAMCO Entertainment"),year:"2016",rate:8, imageName: "Souls", url: "https://store.steampowered.com/app/374320/DARK_SOULS_III/"),
                 Game(name : "Dead by Daylight",characteristics : "Horror,Mulitplayer,Online Co-op",summary:"Dead by Daylight is a multiplayer (4vs1) horror game where one player takes on the role of the savage Killer, and the other four players play as Survivors, trying to escape the Killer and avoid being caught, tortured and killed.Survivors play in third-person and have the advantage of better situational awareness. The Killer plays in first-person and is more focused on their prey.The Survivors' goal in each encounter is to escape the Killing Ground without getting caught by the Killer - something that sounds easier than it is, especially when the environment changes every time you play.",developer:Company(name :"Behaviour Interactive Inc."),publisher:Company(name:"Behaviour Interactive Inc."),year:"2016",rate:5, imageName: "Deadby", url: "https://store.steampowered.com/app/381210/Dead_by_Daylight/"),
                 Game(name : "The Witcher® 3: Wild Hunt",characteristics : "Open wrold,RPG,Story rich,Masterpiece,Advanture",summary:"The Witcher: Wild Hunt is a story-driven open world RPG set in a visually stunning fantasy universe full of meaningful choices and impactful consequences. In The Witcher, you play as professional monster hunter Geralt of Rivia tasked with finding a child of prophecy in a vast open world rich with merchant cities, pirate islands, dangerous mountain passes, and forgotten caverns to explore.",developer:Company(name :"CD PROJEKT RED"),publisher:Company(name:"CD PROJEKT RED"),year:"2015",rate:10, imageName: "Witcher", url: "https://store.steampowered.com/app/292030/The_Witcher_3_Wild_Hunt/"),
                 Game(name : "Mortal Kombat 11",characteristics : "Fighting,Violent,Blood,Action,Single-Player,Online PVP",summary:"Experience Mortal Kombat's first-ever major expansion. Aftermath features a brand-new cinematic story centered around trust and deceit. Fire God Liu Kang, the new keeper of time and protector of Earthrealm, looks to secure the future he envisions. In order to do so, he is forced to enlist the help of some unlikely allies and familiar foes. Players will have to decide who they can trust and who they must defeat with fate on the line. Forge a new history. ",developer:Company(name :"NetherRealm Studios"),publisher:Company(name:"Warner Bros Interactive Entertainment"),year:"2019",rate:7, imageName: "Mortal", url: "https://store.steampowered.com/app/976310/Mortal_Kombat11/"),
                 Game(name : "Watch_Dogs® 2",characteristics : "Open world,Hacking,Stealth,Action,Single-Player,Online co-op,Online PVP",summary:"Play as Marcus Holloway, a brilliant young hacker living in the birthplace of the tech revolution, the San Francisco Bay Area.Team up with Dedsec, a notorious group of hackers, to execute the biggest hack in history; take down ctOS 2.0, an invasive operating system being used by criminal masterminds to monitor and manipulate citizens on a massive scale.",developer:Company(name :"Ubisoft"),publisher:Company(name:"Ubisoft"),year:"2016",rate:9, imageName: "Dogs", url: "https://store.steampowered.com/app/447040/Watch_Dogs_2/"),
                 Game(name : "Rainbow Six® Siege",characteristics : "FPS,Hero shooter,Tactical,Multiplayer",summary:"Master the art of destruction and gadgetry in Tom Clancy’s Rainbow Six Siege. Face intense close quarters combat, high lethality, tactical decision making, team play and explosive action within every moment. Experience a new era of fierce firefights and expert strategy born from the rich legacy of past Tom Clancy's Rainbow Six games.",developer:Company(name :"Ubisoft Montreal"),publisher:Company(name:"Ubisoft"),year:"2015",rate:7, imageName: "Rainbow", url: "https://store.steampowered.com/app/359550/Tom_Clancys_Rainbow_Six_Siege/"),
                 Game(name : "Red Dead Redemption 2",characteristics : "Advanture,Action,Masterpiece,Open world,Single-Player,Online Multiplayer",summary:"America 1889,Arthur Morgan and the Van der Linde gang are outlaws on the run. With federal agents and the best bounty hunters in the nation massing on their heels, the gang must rob, steal and fight their way across the rugged heartland of America in order to survive. As deepening internal divisions threaten to tear the gang apart, Arthur must make a choice between his own ideals and loyalty to the gang who raised him.",developer:Company(name :"Rockstar Games"),publisher:Company(name:"Rockstar Games"),year:"2019",rate:10, imageName: "Red", url: "https://store.steampowered.com/app/1174180/Red_Dead_Redemption_2/"),
                 Game(name : "Left 4 Dead",characteristics : "Zombies,Action,Co-op,Mulitplayer,Single-Player",summary:"Set in the zombie apocalypse, Left 4 Dead 2 (L4D2) is the highly anticipated sequel to the award-winning Left 4 Dead, the #1 co-op game of 2008.This co-operative action horror FPS takes you and your friends through the cities, swamps and cemeteries of the Deep South, from Savannah to New Orleans across five expansive campaigns.",developer:Company(name :"Valve"),publisher:Company(name:"Valve"),year:"2009",rate:5, imageName: "Left", url: "https://store.steampowered.com/app/550/Left_4_Dead_2/"),
                 Game(name : "The Division™",characteristics : "Open world,Third-person shooter,Multiplayer",summary:"During Black Friday, a devastating pandemic sweeps through New York City, and one by one, basic services fail. In only a few days, without food or water, society collapses into chaos. The Division, an autonomous unit of tactical agents, is activated. Leading seemingly ordinary lives among us, these Agents are trained to operate independently in order to save society.",developer:Company(name :"Massive Entertainment"),publisher:Company(name:"Ubisoft"),year:"2016",rate:7, imageName: "Division", url: "https://store.steampowered.com/app/365590/Tom_Clancys_The_Division/"),
                 Game(name : "Stronghold Crusader HD",characteristics : "Strategy,Medival,RTS,Classic,Single-Player,Local Multiplayer",summary:"Journey to distant Arabian lands renowned for brave warriors and fearsome weaponry in Stronghold Crusader HD. The highly anticipated sequel to the best-selling Stronghold, Crusader throws you into historic battles from the Crusades with fiendish AI opponents, new units, 4 historical campaigns and over 100 unique skirmish missions.",developer:Company(name :"FireFly Studios"),publisher:Company(name:"FireFly Studios"),year:"2002",rate:8, imageName: "Strong", url: "https://store.steampowered.com/app/40970/Stronghold_Crusader_HD/"),
                 Game(name : "Fallout 4",characteristics : "Open world,RPG,Exploring,Action,Advanture,Single-Player",summary:"Bethesda Game Studios, the award-winning creators of Fallout 3 and The Elder Scrolls V: Skyrim, welcome you to the world of Fallout 4 – their most ambitious game ever, and the next generation of open-world gaming.As the sole survivor of Vault 111, you enter a world destroyed by nuclear war. Every second is a fight for survival, and every choice is yours. Only you can rebuild and determine the fate of the Wasteland. Welcome home.",developer:Company(name :"Bethesda Game Studios"),publisher:Company(name:"Bethesda Softworks"),year:"2015",rate:8, imageName: "Fallout", url: "https://store.steampowered.com/app/377160/Fallout_4/"),
                 Game(name : "Destiny 2",characteristics : "Free to play,Looter Shooter,FPS,Multiplayer,Online co-op",summary:"Dive into the free-to-play world of Destiny 2 to experience responsive first-person shooter combat, explore the mysteries of our solar system, and unleash elemental abilities against powerful enemies. Download today to create your Guardian and collect unique weapons, armor, and gear to customize your look and playstyle. Experience Destiny 2’s cinematic story alone or with friends, join other Guardians for challenging co-op missions, or compete against them in a variety of PvP modes. You decide your legend.",developer:Company(name :"Bungie"),publisher:Company(name:"Bungie"),year:"2019",rate:7, imageName: "Destiny", url: "https://store.steampowered.com/app/1085660/Destiny_2/"),
                 Game(name : "Green hell",characteristics : "Survival,Open world,Realistic,Single-player,Online co-op",summary:"GREEN HELL is an Open World Survival Simulator set in the uncharted unique setting of the Amazonian rainforest.You are left alone in the jungle without any food or equipment, trying to survive and find your way out. Clinging to life, the player is set on a journey of durability as the effects of solitude wear heavy not only on the body but also the mind. How long can you survive against the dangers of the unknown?",developer:Company(name :"Creepy Jar"),publisher:Company(name:"Creepy Jar"),year:"2019",rate:8, imageName: "Green", url: "https://store.steampowered.com/app/815370/Green_Hell/"),
                 Game(name : "Stardew valley",characteristics : "Farming Sim,Life Sim,Pixel,Single-Player,Online co-op",summary:"You've inherited your grandfather's old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life. Can you learn to live off the land and turn these overgrown fields into a thriving home? It won't be easy. Ever since Joja Corporation came to town, the old ways of life have all but disappeared. The community center, once the town's most vibrant hub of activity, now lies in shambles. But the valley seems full of opportunity. With a little dedication, you might just be the one to restore Stardew Valley to greatness!",developer:Company(name :"ConcernedApe"),publisher:Company(name:"ConcernedApe"),year:"2016",rate:9, imageName: "Star", url: "https://store.steampowered.com/app/413150/Stardew_Valley/"),
                 Game(name : "State of decay 2",characteristics : "Open world,Survivor,Zombies,Single-player,Online multiplayer",summary:"State of Decay 2 is an open-world survival-fantasy game set just after the zombie apocalypse. Your small community of survivors seeks to rebuild a corner of civilization, and you get to make all the decisions about how that happens.",developer:Company(name :"Undead Labs"),publisher:Company(name:"Xbox games Studios"),year:"2020",rate:7, imageName: "State", url: "https://store.steampowered.com/app/495420/State_of_Decay_2_Juggernaut_Edition/"),
                 Game(name : "Need for Speed™ Heat",characteristics : "Racing,Action,Advanture,Driving,Single-player,Multiplayer",summary:"Hustle by day and risk it all at night in Need for Speed™ Heat, a white-knuckle street racer, where the lines of the law fade as the sun starts to set. By day, Palm City hosts the Speedhunter Showdown, a sanctioned competition where you earn Bank to customize and upgrade your high-performance cars. At night, ramp up the intensity in illicit street races that build your reputation, getting you access to bigger races and better parts. But stay ready – cops are waiting and not all of them play fair.",developer:Company(name :"Ghost Games"),publisher:Company(name:"Electronic Arts"),year:"2020",rate:7, imageName: "nfs", url: "https://store.steampowered.com/app/1222680/Need_for_Speed_Heat/"),
                 Game(name : "Cyberpunk 2077",characteristics : "Masterpiece,Open world,Cyberpunk,Action,Single-player",summary:"Cyberpunk 2077 is an open-world, action-adventure story set in Night City, a megalopolis obsessed with power, glamour and body modification. You play as V, a mercenary outlaw going after a one-of-a-kind implant that is the key to immortality. You can customize your character’s cyberware, skillset and playstyle, and explore a vast city where the choices you make shape the story and the world around you.",developer:Company(name :"CD PROJEKT RED"),publisher:Company(name:"CD PROJEKT RED"),year:"2020",rate:10, imageName: "Cyber", url: "https://store.steampowered.com/app/1091500/Cyberpunk_2077/"),]
    }
    
    func game(at index : IndexPath) -> Game {
        return array[index.row]
    }
    
    func numberOfGames() -> Int {
        return array.count
    }
    
    
    
    
}
