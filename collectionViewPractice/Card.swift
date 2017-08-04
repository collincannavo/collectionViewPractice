//
//  Card.swift
//  collectionViewPractice
//
//  Created by Collin Cannavo on 8/3/17.
//  Copyright © 2017 Collin Cannavo. All rights reserved.
//

import Foundation
import CloudKit

public class Person {
    
    public static let nameKey = "name"
    public static let recordType = "Person"
    public static let appleUserReferenceKey = "appleUserReference"
    public static let receivedCardsKey = "receivedCards"
    public var ckRecordID: CKRecordID?
    public var userCKReference: CKReference?
    public var name: String
    public var blockedUsers: [CKReference] = []
    public var receivedCards: [CKReference] = []
    public var personalCards: [Card] = []
    public var cards: [Card] = []
    
    public var ckReference: CKReference? {
        guard let ckRecordID = ckRecordID else { return nil }
        return CKReference(recordID: ckRecordID, action: .none)
    }
    
    public var CKrecord: CKRecord {
        let recordID = self.ckRecordID ?? CKRecordID(recordName: UUID().uuidString)
        
        let record = CKRecord(recordType: Person.recordType, recordID: recordID)
        record[Person.nameKey] = name as CKRecordValue?
        record[Person.appleUserReferenceKey] = userCKReference as CKRecordValue?
        
        if !receivedCards.isEmpty {
            record[Person.receivedCardsKey] = receivedCards as CKRecordValue?
        }
        self.ckRecordID = recordID
        
        return record
    }
    
    public init(name: String, userCKReference: CKReference) {
        self.name = name
        self.userCKReference = userCKReference
    }
    
    public init?(CKRecord: CKRecord) {
        guard let name = CKRecord[Person.nameKey] as? String else { return nil }
        self.name = name
        self.userCKReference = CKRecord[Person.appleUserReferenceKey] as? CKReference
        
        let receivedCards = CKRecord[Person.receivedCardsKey] as? [CKReference] ?? []
        self.receivedCards = receivedCards
        self.ckRecordID = CKRecord.recordID
    }
    
    public func updateCKRecord(record: inout CKRecord) {
        record[Person.nameKey] = name as CKRecordValue?
        record[Person.appleUserReferenceKey] = userCKReference as CKRecordValue?
        
        if !receivedCards.isEmpty {
            record[Person.receivedCardsKey] = receivedCards as CKRecordValue?
        }
    }
}

extension Person: Equatable {
    public static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.ckRecordID == rhs.ckRecordID
    }
}










