//
//  IntentHandler.swift
//  LadderWidgetIntent
//
//  Created by Tikhonov, Aleksandr on 19.01.21.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
}

extension IntentHandler: DynamicProfileSelectionIntentHandling {
    func provideProfileTypeOptionsCollection(for intent: DynamicProfileSelectionIntent, with completion: @escaping (INObjectCollection<ProfileType>?, Error?) -> Void) {

        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let items: [ProfileType] = [
                ProfileType(identifier: "1", display: "Bloodseeker"),
                ProfileType(identifier: "2", display: "Morphling"),
                ProfileType(identifier: "3", display: "Lina")
            ]
            let collection = INObjectCollection(items: items)
            completion(collection, nil)
        }
    }
}
