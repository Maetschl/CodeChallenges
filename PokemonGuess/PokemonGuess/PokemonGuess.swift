//
//  PokemonGuess.swift
//  PokemonGuess
//
//  Created by Julian Arias Maetschl on 24-07-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import Foundation

enum AppStatus {
    case running
    case exit
}

enum GameStatus {
    case fetching
    case fetch
    case guessting
}

func randomPokemonNumber() -> Int {
    return Int.random(in: 1 ... 151)
}

var appStatus: AppStatus = .running
var gameStatus: GameStatus = .fetch

var currentPokemon: Pokemon!
var currentPokemonSpecie: PokemonSpecie?

func runGame() {

    while appStatus == .running {
        switch gameStatus {
        case .fetching:
            fetching()
        case .fetch:
            fetch()
        case .guessting:
            guessting()
        }
    }

}

func fetching() {
}

func fetch() {
    let number = randomPokemonNumber()
    let pokemonUrl: URL = URL(string: "https://pokeapi.co/api/v2/pokemon/\(number)")!
    let task = URLSession.shared.pokemonTask(with: pokemonUrl) { pokemon, response, error in
        if let pokemon = pokemon {
            currentPokemon = pokemon
            let pokemonSpecieUrl: URL = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(number)")!
            let task = URLSession.shared.pokemonSpecieTask(with: pokemonSpecieUrl) { pokemonSpecie, response, error in
                gameStatus = .guessting
                if let pokemonSpecie = pokemonSpecie {
                    currentPokemonSpecie = pokemonSpecie
                    showHint()
                }
            }
            task.resume()
        }
    }
    task.resume()
    gameStatus = .fetching
}

func showHint() {
    printWithSpacers(" 🔎 Hint 🔎 ")
    // printWithSpacers("🌟 Was: \(currentPokemon.name) 🌟") // Only for debug testing
    if let flavorText = currentPokemonSpecie?.flavorTextEntries?.first(where: { $0?.language?.name == "en" }) {
        if let text = flavorText?.flavorText {
            printWithSpacers(text)
        }
    } else {
        print("KKKKKKK")
    }
}

var maxAttempts: Int = 3
var currentAttempts: Int = 0

func guessting() {
    if let inputText = readLine()?.lowercased() {
        currentAttempts += 1
        if inputText == "x" || inputText == "exit" || inputText == "close" {
            appStatus = .exit
        }
        if inputText == currentPokemon.name {
            cleanScreen()
            gameStatus = .fetch
            printWithSpacers("🥳  You Win!! 🥳")
            printWithSpacers("🌟 Was: \(currentPokemon.name) 🌟")
        } else {
            if currentAttempts == maxAttempts {
                cleanScreen()
                currentAttempts = 0
                gameStatus = .fetch
                printWithSpacers("You Lose!! 😵")
                printWithSpacers("🌟 Was: \(currentPokemon.name) 🌟")
            } else {
                printWithSpacers("Wrong answer ❌")
                printWithSpacers(" \(maxAttempts - currentAttempts) attempts remaining")
            }
        }
    }
}
