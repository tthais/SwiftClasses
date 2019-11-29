//
//  CoreDataPokemon.swift
//  PokemonGo
//
//  Created by Thais Costa on 28/11/19.
//  Copyright © 2019 tthais. All rights reserved.
//

import UIKit
import CoreData

class CoreDataPokemon {

  //Recuperar o contexto
  func getContext() -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    let context = appDelegate?.persistentContainer.viewContext

    return context!

  }

  //adicionar todos os pokemons
  func adicionarTodosPokemons() {

    let context = self.getContext()

    self.criarPokemon(nome: "Mew", nomeIamgem: "mew", capturado: false)
    self.criarPokemon(nome: "Meowth", nomeIamgem: "meowth", capturado: false)
    self.criarPokemon(nome: "Pikachu", nomeIamgem: "pikachu-2", capturado: true)
    self.criarPokemon(nome: "Squirtle", nomeIamgem: "squirtle", capturado: false)
    self.criarPokemon(nome: "Charmander", nomeIamgem: "charmander", capturado: false)
    self.criarPokemon(nome: "Caterpie", nomeIamgem: "caterpie", capturado: false)
    self.criarPokemon(nome: "Bullbasaur", nomeIamgem: "bullbasaur", capturado: false)
    self.criarPokemon(nome: "BellSprout", nomeIamgem: "bellsprout", capturado: false)
    self.criarPokemon(nome: "PsyDuck", nomeIamgem: "psyduck", capturado: false)
    self.criarPokemon(nome: "Rattata", nomeIamgem: "rattata", capturado: false)
    self.criarPokemon(nome: "Snorlax", nomeIamgem: "snorlax", capturado: false)
    self.criarPokemon(nome: "Zubat", nomeIamgem: "zubat", capturado: false)
    self.criarPokemon(nome: "Pidgey", nomeIamgem: "pidgey", capturado: false)

    do{
      try context.save()
    }catch{}
  }
  //criar os pokemons
  func criarPokemon (nome: String, nomeIamgem: String, capturado: Bool) {

    let context = self.getContext()
    let pokemon = Pokemon(context: context)
    pokemon.nome = nome
    pokemon.nomeImagem = nomeIamgem
    pokemon.capturado = capturado
  }
}
