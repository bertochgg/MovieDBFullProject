//
//  Colors.swift
//  MovieDBFullProject
//
//  Created by Cesar Humberto Grifaldo Garcia on 04/10/23.
//

import UIKit

extension UIColor {
    
    class var titleWhite: UIColor {
        return UIColor(hexString: "#EEEFF0") ?? .white
    }
    
    class var descriptionGray: UIColor {
        return UIColor(hexString: "#B9BFC1") ?? .gray
    }
    
    class var moviesBlack: UIColor {
        return UIColor(hexString: "#191B1C") ?? .black
    }
    
    class var customButtonGray: UIColor {
        return UIColor(hexString: "#272B2C") ?? .darkGray
    }
    
    class var customTextLightGray: UIColor {
        return UIColor(hexString: "#747E83") ?? .lightGray
    }
}

