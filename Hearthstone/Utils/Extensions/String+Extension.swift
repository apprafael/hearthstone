//
//  String+Extension.swift
//  Hearthstone
//
//  Created by Rafael Almeida on 02/08/23.
//

import Foundation

extension String {
    
    var stringReadingHtml: String? {
        
        let newString: String = self.replacingOccurrences(of: "\n", with: "<br>")
        guard let data = newString.data(using: .unicode, allowLossyConversion: false) else {
            
            return nil
        }
        
        return try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        ).string
    }
}
