//
//  coreDataHelp.swift
//  Pokemon_go_clone
//
//  Created by Dylan on 2/28/17.
//  Copyright © 2017 Dylan Grozdanich. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func addAllPokemon() {
    
    createPokemon(name: "Mew", imageName: "mew")
    createPokemon(name: "Meowth", imageName: "meowth")
    createPokemon(name: "Bulbasaur", imageName: "bullbasaur")
    createPokemon(name: "BellSprout", imageName: "bellsprout")
    createPokemon(name: "Eevee", imageName: "eevee")
    createPokemon(name: "Squirtle", imageName: "squirtle")
    createPokemon(name: "Snorlax", imageName: "snorlax")
    createPokemon(name: "Charmander", imageName: "charmander")
    createPokemon(name: "Caterpie", imageName: "caterpie")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func createPokemon(name : String, imageName: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let pokemon = Pokemon(context: context)
    pokemon.name = name
    pokemon.imageName = imageName
}

func getAllPokemon() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    do {
    let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        
        if pokemons.count == 0 {
            addAllPokemon()
            return getAllPokemon()
        }
        return pokemons
    } catch {}
    
    
    
    return []
}

func getAllCaughtPokemons() -> [Pokemon] {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>

    fetchRequest.predicate = NSPredicate(format: "caught == %@", true as CVarArg)
    do{
    let pokemons = try context.fetch(fetchRequest) 
        return pokemons
    } catch {}
    
    return []
}

func getAllUncaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    
    fetchRequest.predicate = NSPredicate(format: "caught == %@", false as CVarArg)
    do{
        let pokemons = try context.fetch(fetchRequest)
        return pokemons
    } catch {}
    return []
}
