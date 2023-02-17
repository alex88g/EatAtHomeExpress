//
//  LocationDataService.swift
//  EatAtHomeExpress
//
//  Created by Alexander Gallorini on 2023-02-15.
//
import Foundation
import MapKit
import CoreLocation

class LocationsDataService{
    
    static let locations: [Location] = [
    
        Location(name: "Restaurant", restaurant: "Deli Di Luca", coordinates: CLLocationCoordinate2D(latitude:59.31604, longitude:18.08394), description: "Om Deli Di Luca Deli Di Luca är en restaurang som erbjuder Italiensk vällagad mat med de bästa råvarorna. Vi utgår från det traditionella köket men tillåter oss att tillaga och presentera rätterna med inslag av det moderna nutida Italienska köket. Vi har en gedigen vinlista med viner från de flesta italienska regionerna som är anpassade för vår meny. Njut av god mat och dryck hos oss i en skön atmosfär, eller köp med er och njut hemma. Välkommen till oss på Folkungagatan 110.", image: ["Deli Di Luca", "Deli Di Luca 2", "Deli Di Luca 3"], link: "https://www.delidiluca.se/"),
       
        Location(name: "Restaurant", restaurant: "Primo Ciao Ciao Nytorget", coordinates: CLLocationCoordinate2D(latitude: 59.31367, longitude: 18.08248), description: "Kom som du är, känn dig som hemma, välj efter behag, luta dig tillbaka och njut! Stämningen, dofterna och smakerna! Hos oss finner du det bästa från Italien. Från en enkel espresso till en god prosecco, från en vällagad lunch a la minute till en omsorgsfullt tillagad avsmakningsmeny. Med passion och kärlek serverar vi väl genomtänkta smakkombinationer. För vinälskaren finns en gedigen och härlig vinlista från de olika italienska vindistrikten att botanisera i. I baren servas härliga drinkar efter säsong, italiensk öl, utsökta viner, fantastiska grappor och annat smått & gott, bara att slå sig ner och slappna av! Känn värmen och hör sprakandet från vedugnen, i den bakar våra ”pizzaioli” med stolthet våra välkända napoletanska vedugnspizzor. Härligt krispiga och sega på samma gång, med utsökta San Marzano tomater och smält Fior di Latte ost, lämnar varje pizza vår ugn med en doft och smak som gör varje människa glad, mätt och belåten. ", image: ["Primo Cao Cao Nytorget", "Primo Ciao Ciao Nytorget 2", "Primo Ciao Ciao Nytorget 3"], link: "https://primociaociaonytorget.se/"),
        
        Location(name: "Restaurant", restaurant: "Olja&Oliv Deli", coordinates: CLLocationCoordinate2D(latitude: 59.31489, longitude: 18.09082), description: "ITALIENSKA PREMIUMDELIKATESSER Hos oss hittar du premiumdelikatesser med tonvikt på det italienska köket. Men det finns så klart mycket mer att njuta av och därför hittar du delikatesser även från länder så som Spanien, Grekland, Portugal mfl. Hela medelhavsregionen har ett fantastiskt utbud av godsaker och vi har valt ut det som vi själva gillar helt enkelt. Vi värnar om små producenter med regionala specialiteter och traditionell tillverkning. Vi har en personlig relation med många av våra producenter och tar hem våra varor direkt utan mellanhänder. På så sätt vet vi att produkterna är genuina och småskaliga. Välkomna in!", image: ["Olja&Oliv Deli","Olja&Oliv Deli 2", "Olja&Oliv Deli 3" ], link: "https://www.olja-oliv.se/" ),
        
        Location(name: "Restaurant", restaurant: "O'PIZZICATO", coordinates: CLLocationCoordinate2D(latitude: 59.31411, longitude: 18.06515), description: "Välkommen till O’Pizzicato, en familjeägd italiensk restaurang sedan 15 år tillbaka.Till oss kommer du för att avnjuta en god middag med familj, vänner eller arbetskollegorna. Vi serverar klassiska italienska maträtter så som Osso Buco, Porchetta och Risotto för att nämna några. Du hittar alltid flertalet hängmörade kötträtter och glöm inte att fråga efter våra populära färska pastafavoriter. Goda charkuterier som trancheras med vår exklusiva berkelmaskin, specialtillverkad just för parmaskinka.", image: ["O'PIZZICATO", "O'PIZZICATO 2", "O'PIZZICATO 3"], link: "https://www.opizzicato.se/"),
        
        Location(name: "Restaurant", restaurant: "La Perla", coordinates: CLLocationCoordinate2D(latitude: 59.31364, longitude: 18.06973), description: "It all started at Il Conte, located in Grevgatan, Stockholm, in the winter of 1994. Since then, much has happened, a lot of good food has been enjoyed, wines have been savoured, and menus created. La Perla in Italians means “The Pearl” In La Perla’s menu, I have chosen dishes that have a special place in the hearts of myself and my family. Some of the dishes are a “blast from the past”, but there are also many new and exciting dishes and flavours from the country I love so much!", image: ["La Perla", "La Perla 2", "La Perla 3"], link: "https://www.laperla-ingrosso.com/s-dermalm"),
   
    ]
    
    
}
