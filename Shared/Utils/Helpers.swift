//
//  Helpers.swift
//  PokeMaster
//
//  Created by vvusu on 7/12/21.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

extension URL {
    var extractedID: Int? {
        Int(lastPathComponent)
    }
}

extension String {
    var newlineRemoved: String {
        return split(separator: "\n").joined(separator: " ")
    }

    var isValidEmailAddress: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

let appDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

let appEncoder: JSONEncoder = {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    return encoder
}()

extension Array where Element: Publisher {
    var zipAll: AnyPublisher<[Element.Output], Element.Failure> {
        let initial = Just([Element.Output]())
            .setFailureType(to: Element.Failure.self)
            .eraseToAnyPublisher()
        return reduce(initial) { result, publisher in
            result.zip(publisher) { $0 + [$1] }.eraseToAnyPublisher()
        }
    }
}

extension JSONDecoder {
    class func jsonDecoder<T: Codable>(_ type: T.Type,from data: Data?) -> T? {
        guard let data = data else {
            return nil;
        }
        let json = JSONDecoder();
        var jsonItem: T? = nil;
        do {
            jsonItem = try json.decode(type, from: data)
        } catch {
            print("data convert json error: \(error)");
        }
        return jsonItem;
    }
    
    class func jsonDecoder<T: Codable>(_ type: T.Type,fromAny data: Any?) -> T? {
        if let data = data as? Data {
            return jsonDecoder(type, from: data);
        }
        guard let data = data else {
            return nil;
        }
        if let stringValue = data as? String {
            return jsonDecoder(type, from: stringValue.data(using: .utf8));
        }
        let jsonData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted);
        return jsonDecoder(type, from: jsonData);
    }
}
