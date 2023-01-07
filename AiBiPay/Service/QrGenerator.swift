//
//  QrGenerator.swift
//  AiBiPay
//
//  Created by Michael on 12/28/22.
//

import Foundation
import CoreImage.CIFilterBuiltins
import UIKit

class QrGenerator {
    static let context = CIContext()
    static let filter = CIFilter.qrCodeGenerator()
    
    static func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage,
            let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        } else {
            return UIImage()
        }
    }
}
