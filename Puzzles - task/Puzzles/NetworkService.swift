//
//  NetworkService.swift
//  Puzzles
//
//  Created by Leonid Serebryanyy on 18.11.2019.
//  Copyright © 2019 Leonid Serebryanyy. All rights reserved.
//

import Foundation
import UIKit


class NetworkService {
	
	let session: URLSession

	init() {
		session = URLSession(configuration: .default)
	}
	
    var results = [UIImage]()
    
	// MARK:- Первое задание
	
	public func loadPuzzle(completion: @escaping (Result<UIImage, Error>) -> ()) {
        
		let firstURL = URL(string: "https://storage.googleapis.com/ios_school/tu.png")!
		let secondURL = URL(string: "https://storage.googleapis.com/ios_school/pik.png")!
		let thirdURL = URL(string: "https://storage.googleapis.com/ios_school/cm.jpg")!
		let fourthURL = URL(string: "https://storage.googleapis.com/ios_school/apple.jpeg")!
		let urls = [firstURL, secondURL, thirdURL, fourthURL]
		let myGroup = DispatchGroup()
        for url in urls {
            myGroup.enter()
            let task = self.session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if let error = error {
                    print(error)
                    myGroup.leave()
                    return
                }
                if let data = data {
                    if let image = UIImage(data: data) {
                        self.results.append(image)
                        myGroup.leave()
                    }
                }
            }
            task.resume()
        }

        myGroup.notify(queue: DispatchQueue.main) {
            if let merged = ImagesServices.image(byCombining: self.results) {
                completion(.success(merged))
            }
        }
    }
	
	
	// MARK:- Второе задание
	
	public func loadQuiz(completion: @escaping(Result<UIImage, Error>) -> ()) {
		let keyURL = URL(string: "https://sberschool-c264c.firebaseio.com/enigma.json?avvrdd_token=AIzaSyDqbtGbRFETl2NjHgdxeOGj6UyS3bDiO-Y")!
        self.session.dataTask(with: keyURL) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data, let str = String(data: data, encoding: .utf8) {
                let newStr = str.replacingOccurrences(of: "\"", with: "")
                guard let newUrl = URL(string: newStr) else { return }
                self.session.dataTask(with: newUrl) { data, response, error in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    if let data = data {
                        if let image = UIImage(data: data) {
                            completion(.success(image))
                        }
                    }
                }
                .resume()
            }
        }
        .resume()
	}
	
}
