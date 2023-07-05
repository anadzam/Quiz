//
//  Constants.swift
//  Quiz
//
//  Created by Ani Dzamelashvili on 20.06.23.
//

import Foundation
import UIKit

enum Constants {
    enum AssetIdentifier: String {
        case backgroundImage
        case illustration
        case loginButton
        
    }
    enum labelNames {
        static let loginLabel: String = "ჩემი პირველი ქვიზი"
        static let placeholder: String = "შეიყვანე სახელი"
    }
    
    enum fonts {
        static let loginLabelFont: String = "AKAD10"
        static let loginTextView: UIFont = .systemFont(ofSize: 12)
        
    }
    
    enum Colors {
        static let placeholder = UIColor(hex: 0xB3B3B3)
        static let textViewBorderColor = UIColor(hex: 0xFFC44A).cgColor
        static let yellowColor = UIColor(hex: 0xFFC44A)
    }
    //    enum TextView {
    //        static let trailing: CGFloat = 2
    //        static let height: CGFloat = 50
    //        static let borderWidth: CGFloat = 1.0
    //        static let cornerRadius: CGFloat = 23
    //        static let font: UIFont = .systemFont(ofSize: 16)
    //        static let placeholder: String = "დაწერეთ შეტყობინება"
    //        static let topEdge: CGFloat = 15
    //        static let leftEdge: CGFloat = 10
    //        static let top: CGFloat = 2
    //        static let bottom: CGFloat = 2
    //        static let maxNumberOfLines: CGFloat = 6
    //    }
    //
    //    enum Label {
    //        static let errorLabel: String = "არ გაიგზავნა"
    //    }
    //
    //    enum SendButton {
    //        static let trailing: CGFloat = 16
    //        static let bottom: CGFloat = 10
    //    }
    //
    //    enum ContainerView {
    //        static let borderWidth: CGFloat = 1
    //        static let cornerRadius: CGFloat = 23
    //    }
    //
    //    enum TableView {
    //        static let top: CGFloat = 50
    //        static let height: CGFloat = 300
    //        static let RecieverCellReuseIdentifier = "RecieverCell"
    //        static let SenderCellReuseIdentifier = "SenderCell"
    //    }
    //
    
    //
    //    enum CenterLine {
    //        static let height: CGFloat = 6
    //    }
    //
    //    enum TopChatView {
    //        static let top: CGFloat = 75
    //        static let bottom: CGFloat = 5
    //    }
    //
    //    enum BottomChatView {
    //        static let top: CGFloat = 5
    //        static let bottom: CGFloat = 10
    //    }
    //
    //    enum SwitchButton {
    //        static let top: CGFloat = 40
    //        static let right: CGFloat = 12
    //    }
    //    enum StackView {
    //        static let spacing: CGFloat = 12
    //        static let gap: CGFloat = 20
    //    }
    //
    //    enum Colors {
    //        static let placeholderColor = UIColor(hex: 0xC7C7C70)
    //        static let borderColor = UIColor(hex: 0x9F60FF).cgColor
    //        static let darkMode = UIColor(hex: 0x160039)
    //        static let bubbleColor = UIColor(hex: 0xDAC2FF)
    //        static let textColor = UIColor(hex: 0x191919)
    //        static let centreLineColor = UIColor(hex: 0xF7CE7F)
    //        static let darkModeTextColor = UIColor(hex: 0xF1F1F1)
    //    }
    //
}
