//
//  FileManager+.swift
//  ToDo
//
//  Created by 홍석현 on 9/18/24.
//

import Foundation

extension FileManager {
    func documentsURL(name: String) -> URL {
        guard let documentsURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError()
        }
        return documentsURL.appendingPathComponent(name)
    }
}
