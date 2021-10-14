//
//  Image+Extension.swift
//  CNXUIKit
//
//  Created by Veera Subhash on 09/09/21.
//

import SwiftUI

extension Image {
    static func createImageFromCNXUIKit(with name: String) -> Image {
        return Image(name, bundle: Bundle(identifier: "com.cnxone.CNXUIKit"))
    }
}
