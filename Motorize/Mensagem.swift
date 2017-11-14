
//
//  Mensagem.swift
//  Motorize_Final
//
//  Created by joao cedeira on 11/07/17.
//  Copyright © 2017 JCDevelopers. All rights reserved.
//

import Foundation


class Mensagem{
    
    var  title : String
    
    var  msg : String
    
    var  cel : String
    
    var  id_user : Int

    init( title : String,  msg : String,  cel : String,  id_user : Int) {
    self.title = title
    self.msg = msg
    self.cel = cel
    self.id_user = id_user
    }
}
