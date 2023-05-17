//
//  FleetViewModel.swift
//  Painter
//
//  Created by COBE on 11.04.2023..
//

import Foundation
import UIKit

final class FleetViewModel {
    
    var showAddModal: (()->Void)?
    var dummyPumps = [Pumps]()
    
    func createDummyData() {
        
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "PowerPainter® 90", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "Control_Pro")!, name: "ControlPro® 350", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "ProSpray 3.25 Cart", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "PowerPainter® 90", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "Control_Pro")!, name: "ProSpray 3.31 Cart", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "PowerPainter3", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "Control_Pro")!, name: "PowerPainter® 90", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "Control_Pro")!, name: "ProSpray 3.31 Cart", impact: "Mighty Impact"))
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: "PowerPainter® 90", impact: "Mighty Impact"))
        print("Miran\(dummyPumps.count)")
    }
    
    func createNewData(_ pumpName: String) {
        print("mm\(dummyPumps.count)")
        dummyPumps.append(Pumps(image: UIImage(named: "pump")!, name: pumpName, impact: pumpName))
        print("Mendelskii\(dummyPumps.count)")
    }
}

