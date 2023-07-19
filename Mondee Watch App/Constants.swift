//
//  Constants.swift
//  Mondee Watch App
//
//  Created by Seokmin on 2023/07/15.
//

enum Environment {
    case development
    case release
}

var currentEnvironment: Environment = .development // Change this to .release when you want to switch

struct Constants {
    static var initialSeconds: Int {
        switch currentEnvironment {
        case .development:
            return 120
        case .release:
            return 600
        }
    }
    
    static var initialHeartCount: Int {
        switch currentEnvironment {
        case .development:
            return 3
        case .release:
            return 3
        }
    }
    
    static var semiWarningThreshold: Int {
        switch currentEnvironment {
        case .development:
            return 5
        case .release:
            return 5
        }
    }
    
    static var warningThreshold: Int {
        switch currentEnvironment {
        case .development:
            return 10
        case .release:
            return 20
        }
    }
    
    static var dirtThreshold: Int {
        switch currentEnvironment {
        case .development:
            return 15
        case .release:
            return 25
        }
    }
    
    static var cleanThreshold: Int {
        switch currentEnvironment {
        case .development:
            return 5
        case .release:
            return 5
        }
    }
    
    static var terminationPossibleSeconds: Int {
        switch currentEnvironment {
        case .development:
            return 10
        case .release:
            return 300
        }
    }
}
