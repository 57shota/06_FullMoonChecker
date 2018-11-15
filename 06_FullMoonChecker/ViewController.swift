//
//  ViewController.swift
//  06_FullMoonChecker
//
//  Created by shota ito on 02/10/2018.
//  Copyright © 2018 shota ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moonView: UIImageView!
    @IBOutlet weak var moonPhase: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var daysLeft: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         --------------------------------------------------
         Moon phase calculation
         1. 2018 - 2000 = 18
         2. 18 * 11 = 198
         3. 198 + month + day = x
         4. x - 8 = y
         5. y - 30 until less than 30 (y - 30 - 30 - 30...)
         6. y = MoonPhase
         --------------------------------------------------
         Phase number
         0  new
         2-3 waxing crescent
         4-6
         7-8 first quarter
         9-13
         14-15 full moon
         16-20
         21-22 third quarter
         23-26
         27-28 waning crescent
         --------------------------------------------------
        */
        
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let cycle = 14
        var daysNum = 0
        
        // calculate phase number
        var phaseNum = (198 + month + day) - 8
        while phaseNum > 30 {
            phaseNum -= 30
        }
        
        
        
        // added this algorithm 10/10/19
        if phaseNum >= 16 {
            let x = cycle - phaseNum
            daysNum = 30 + x
        }else{
            daysNum = cycle - phaseNum
        }
        
        
        
        
        
        // images are not determinded yet. Must be modified later
        switch phaseNum {
        case 0:
            let newMoon = UIImage(named: "newMoon")
            moonView.image = newMoon
            moonPhase.text! = "New Moon"
            days.text! = "\(daysNum)"
        case 1:
            let newMoon = UIImage(named: "newMoon")
            moonView.image = newMoon
            moonPhase.text! = "-"
            days.text! = "\(daysNum)"
        case 2...3:
            let waxCres = UIImage(named: "waxCrescent")
            moonView.image = waxCres
            moonPhase.text! = "Waxing Crescent"
            days.text! = "\(daysNum)"
        case 4...6:
            let waxCres = UIImage(named: "waxCrescent")
            moonView.image = waxCres
            moonPhase.text! = "-"
            days.text! = "\(daysNum)"
        case 7...8:
            let fq = UIImage(named: "firstQuarter")
            moonView.image = fq
            moonPhase.text! = "First Quarter"
            days.text! = "\(daysNum)"
        case 9...13:
            let fq = UIImage(named: "firstQuarter")
            moonView.image = fq
            moonPhase.text! = "-"
            days.text! = "\(daysNum)"
            
        // full moon
        case 14...15:
            let fm = UIImage(named: "fullMoon")
            moonView.image = fm
            moonPhase.text! = "Full Moon"
            days.text! = ""
            daysLeft.text! = ""
        case 16...20:
            let fm = UIImage(named: "fullMoon")
            moonView.image = fm
            moonPhase.text! = "-"
            days.text! = "\(daysNum)"
        case 21...22:
            let tq = UIImage(named: "firstQuarter")
            moonView.image = tq
            moonPhase.text! = "Third Quarter"
            days.text! = "\(daysNum)"
        case 23...26:
            let wanCres = UIImage(named: "waxCrescent")
            moonView.image = wanCres
            moonPhase.text! = "-"
            days.text! = "\(daysNum)"
        case 27...28:
            let wanCres = UIImage(named: "waxCrescent")
            moonView.image = wanCres
            moonPhase.text! = "Waning Crescent"
            days.text! = "\(daysNum)"
        case 29:
            let newMoon = UIImage(named: "newMoon")
            moonView.image = newMoon
            moonPhase.text! = "-"
            days.text! = "\(daysNum)"
        default:
            break
        }
        
        
        
    }


}

