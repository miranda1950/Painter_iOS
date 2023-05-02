//
//  HomeViewModel.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class HomeViewModel {
    
    var events = [EventCard]()
    
    func addEvents() {
        events.append(EventCard(date: Date.now, eventDescription: "New tip for your sprayer available now for little price!", eventImage: UIImage(named: "eventImage")))
        
        events.append(EventCard(date: Date.now, eventDescription: "Don’t miss The Farbe Conference nearby!", eventImage: UIImage(named: "eventImage")))
        
        events.append(EventCard(date: Date.now, eventDescription: "New tip for your sprayer available now!", eventImage: UIImage(named: "eventImage")))
        
        events.append(EventCard(date: Date.distantFuture, eventDescription: "Check gun filter on IMPAC 840 HIGH RIDER", eventImage: nil))
        
        events.append(EventCard(date: Date.now, eventDescription: "Don’t miss The Farbe Conference nearby!", eventImage: UIImage(named: "eventImage")))
    }
}
