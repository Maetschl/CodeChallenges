//
//  PrintUtils.swift
//  PokemonGuess
//
//  Created by Julian Arias Maetschl on 24-07-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import Foundation


func spacer() {
    print("######################")
}

func printWithSpacers(_ texts: [String]) {
    spacer()
    texts.forEach({ print("#\t" + $0 + " \t#") })
    spacer()
}

func printWithSpacers(_ text: String) {
    printWithSpacers([text])
}

func cleanScreen() {
    print("\u{001B}[2J")
}
