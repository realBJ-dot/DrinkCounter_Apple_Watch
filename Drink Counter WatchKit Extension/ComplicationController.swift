//
//  ComplicationController.swift
//  Drink Counter WatchKit Extension
//
//  Created by Vivek Bhookya on 11/4/21.
//

import ClockKit
import WatchKit
import UIKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    
    // MARK: - Complication Configuration

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(identifier: "complication", displayName: "Drink Counter", supportedFamilies: CLKComplicationFamily.allCases)
            // Multiple complication support can be added here with more descriptors
        ]
        
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

    // MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        switch complication.family {
        // https://github.com/MilanistaDev/ComplicationsWatchSample/blob/master/ComplicationsWatchSample%20Extension/ComplicationController.swift#L72
        case .graphicCircular:
            // Infograph modular
            let circularClosedGaugeTemplate = CLKComplicationTemplateGraphicCircularClosedGaugeText()
            
            // TODO 1. Replace the center text with the current drink count data
            // -
            
            let keychain = KeychainSwift()
            print("\nFrom complication:")
            let count = keychain.get("ctr")
            print(count!)
            print("end complication\n")
//            print("all keys")
//            print(keychain.allKeys)
            
            
            // -
            let centerText = CLKSimpleTextProvider(text: count ?? "0")
            centerText.tintColor = .white
            circularClosedGaugeTemplate.centerTextProvider = centerText
            
            // TODO 2. Change the gauge color to a red-green scale OR green?
            let gaugeColor = UIColor(red: 0.0, green: 167.0/255.0, blue: 219.0/255.0, alpha: 1.0)
            
            // TODO 3. fillFraction (currentDrinks / drinkLimit)
            let gaugeProvider = CLKSimpleGaugeProvider(style: .fill, gaugeColor: gaugeColor, fillFraction: (12.0/14.0))
            circularClosedGaugeTemplate.gaugeProvider = gaugeProvider
            
            // TODO 4. What is this timeline entry? What is the Date() doing??
            let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: circularClosedGaugeTemplate)
            
            handler(entry)
        default:
            handler(nil)
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after the given date
        handler(nil)
    }

    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
}
