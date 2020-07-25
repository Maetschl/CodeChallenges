//
//  PokemonSpecie.swift
//  PokemonGuess
//
//  Created by Julian Arias Maetschl on 24-07-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonSpecie = try? newJSONDecoder().decode(PokemonSpecie.self, from: jsonData)

import Foundation

// MARK: - PokemonSpecie
struct PokemonSpecie: Codable {
    let baseHappiness, captureRate: Int?
    let color: Color?
    let eggGroups: [Color?]?
    let evolutionChain: EvolutionChain?
    let evolvesFromSpecies: Color?
    let flavorTextEntries: [FlavorTextEntry?]?
    let formDescriptions: [JSONAny?]?
    let formsSwitchable: Bool?
    let genderRate: Int?
    let genera: [Genus?]?
    let generation, growthRate, habitat: Color?
    let hasGenderDifferences: Bool?
    let hatchCounter, id: Int?
    let isBaby: Bool?
    let name: String?
    let names: [Name?]?
    let order: Int?
    let palParkEncounters: [PalParkEncounter?]?
    let pokedexNumbers: [PokedexNumber?]?
    let shape: Color?
    let varieties: [Variety?]?

    enum CodingKeys: String, CodingKey {
        case baseHappiness = "base_happiness"
        case captureRate = "capture_rate"
        case color
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        case formDescriptions = "form_descriptions"
        case formsSwitchable = "forms_switchable"
        case genderRate = "gender_rate"
        case genera, generation
        case growthRate = "growth_rate"
        case habitat
        case hasGenderDifferences = "has_gender_differences"
        case hatchCounter = "hatch_counter"
        case id
        case isBaby = "is_baby"
        case name, names, order
        case palParkEncounters = "pal_park_encounters"
        case pokedexNumbers = "pokedex_numbers"
        case shape, varieties
    }
}

// MARK: - Color
struct Color: Codable {
    let name: String?
    let url: String?
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    let url: String?
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String?
    let language, version: Color?

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }
}

// MARK: - Genus
struct Genus: Codable {
    let genus: String?
    let language: Color?
}

// MARK: - Name
struct Name: Codable {
    let language: Color?
    let name: String?
}

// MARK: - PalParkEncounter
struct PalParkEncounter: Codable {
    let area: Color?
    let baseScore, rate: Int?

    enum CodingKeys: String, CodingKey {
        case area
        case baseScore = "base_score"
        case rate
    }
}

// MARK: - PokedexNumber
struct PokedexNumber: Codable {
    let entryNumber: Int?
    let pokedex: Color?

    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
}

// MARK: - Variety
struct Variety: Codable {
    let isDefault: Bool?
    let pokemon: Color?

    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case pokemon
    }
}
