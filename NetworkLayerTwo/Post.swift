//
//  Post.swift
//  NetworkLayerTwo
//
//  Created by Назар on 21.09.2024.
//

import Foundation

struct Post: Decodable {
    /// ID пользователя, который оставил комментарий
    let userId: Int
    /// ID поста
    let id: Int
    /// Заголовок поста
    let title: String
    /// Тело поста
    let body: String
}
