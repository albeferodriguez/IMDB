//
//  TypeColorTransformer.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 28/9/22.
//

import Foundation
import SwiftUI

enum Types: String {
    case ground = "ground"
    case normal = "normal"
    case fighting = "fighting"
    case flying = "flying"
    case poison = "posion"
    case rock = "rock"
    case bug = "bug"
    case ghost = "ghost"
    case steel = "steel"
    case fire = "fire"
    case grass = "grass"
    case water = "water"
    case electric = "electric"
    case ice = "ice"
    case dragon = "dragon"
    case dark = "dark"
    case fairy = "fairy"
}

struct TypeColorTransformer {

    static func getType(type: String?) -> (Types, Color) {

        guard let type = type else {
            return (.fairy, Color("FairyColor"))
        }

        switch type {
        case Types.ground.rawValue:
            return (.ground, Color("GroundColor"))
        case Types.normal.rawValue:
            return (.normal, Color("NormalColor"))
        case Types.fighting.rawValue:
            return (.fighting, Color("FightingColor"))
        case Types.flying.rawValue:
            return (.flying, Color("FlyingColor"))
        case Types.poison.rawValue:
            return (.poison, Color("PoisonColor"))
        case Types.rock.rawValue:
            return(.rock, Color("RockColor"))
        case Types.bug.rawValue:
            return (.bug, Color("BugColor"))
        case Types.ghost.rawValue:
            return (.ghost, Color("GhostColor"))
        case Types.steel.rawValue:
            return (.steel, Color("SteelColor"))
        case Types.fire.rawValue:
            return (.fire, Color("FireColor"))
        case Types.grass.rawValue:
            return (.grass, Color("GrassColor"))
        case Types.water.rawValue:
            return (.water, Color("WaterColor"))
        case Types.electric.rawValue:
            return (.electric, Color("ElectricColor"))
        case Types.ice.rawValue:
            return (.ice, Color("IceColor"))
        case Types.dragon.rawValue:
            return (.dragon, Color("DragonColor"))
        case Types.dark.rawValue:
            return (.dark, Color("DarkColor"))
        case Types.fairy.rawValue:
            return (.fairy, Color("FairyColor"))
        default:
            return (.fairy, Color("FairyColor"))
        }
    }
}
