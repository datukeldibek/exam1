//
//  main.swift
//  exam1
//
//  Created by Jarae on 12/12/22.
//

//Воин, Колдун, Медик, Защитник
//warrior, wizard,doctor, Defender
//У каждого по 1000 ХП изначально (у защитника 1500)
//Каждый раунд наносят удар по 200, 300, 0, 100
//Медик лечит один раз в 2 раунда всю команду на 200 ХП кроме себя самого
//Медик наносить удар не может
//Мёртвых игроков лечить нельзя и они не наносят урон

//Босс
//5000 ХП изначально
//Наносит по 200 ХП урона каждому игроку в течение игры пока не умрет
//Игра заканчивается когда умирает БОСС и жив хотябы один игрок, либо когда все игроки мертвы, а босс жив
//В конце выводится print - сколько раундов прошло, сколько урона нанес каждый игрок и кто всё-таки стал победителем

//1 раунд
//Герои атакуют
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//Босс Атакует
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)

//Игроки победили, БОСС мертв
//9 раундов прошло
//Если ХП - 0 (т.е герой умер - делаете принт (Герой) мертв)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)

import Foundation

var players = [[String]]()

var warrior = ["Воин", "1000", "200"]
var wizard = ["Колдун", "1000", "300"]
var doctor = ["Медик", "1000", "0"]
var defender = ["Защитник", "1500", "100"]

players.append(warrior)
players.append(wizard)
players.append(doctor)
players.append(defender)

var boss = [5000, 200]

var diedPlayers = [String]()
var allPlayersDied: Bool = false
var isBossDied: Bool = false
var round = 1

//money > 0 ? print("Some money") : print("No money")
while boss[0] >= 0 || allPlayersDied == false{
    print("\nROUND \(round)")
    //+200 хп каждому герою кроме медика, каждые 2 раунда
    if round % 2 == 0{
        for (index, item) in players.enumerated(){
            if index != 2{
                players[index][1] = String(Int(item[1])! + 200)
            }
        }
    }
    
    
    //Герои атакуют
    print("Герои атакуют")
    for (_, item) in players.enumerated(){
        boss[0] -= Int(item[2])!
        print("\(item[0]) нанес \(item[2]) урона БОССУ. ХП босса - \(boss[0])")
        
        if boss[0] == 0{
            isBossDied = true
            break;
        }
    }
    if isBossDied == true{
        print("Игроки победили, БОСС мертв")
        print("\(round) раундов прошло")
        for i in players{
            print("ХП героя \(i[0]) - \(i[1])")
        }
        for i in diedPlayers{
            print("\(i) мертв")
        }
        break
    }
    
    
    print("\nБосс Атакует")
    
    for (index, item) in players.enumerated(){
        let playerHP = Int(item[1])! - 200
        print("ХП героя \(item[0]) - \(playerHP)")
        
        players[index][1] = String(playerHP)
        if players.count == 0{
            allPlayersDied = true
            break
        }
    }
    for (index, item) in players.enumerated(){
        if item[1] == "0"{
            diedPlayers.append(item[0])
            players.remove(at: index)
        }
    }
    if allPlayersDied == true{
        print("БОСС победил, Игроки мертвы")
        print("\(round) раундов прошло")
        break
    }
    round += 1
}
