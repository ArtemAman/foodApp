//
//  ArticleParser.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 14.02.2022.
//

import Foundation
import Alamofire
import SwiftSoup



class ArticleParser {
    
    
    func scrapeNews(page: String, completion: @escaping([Article?]) -> Void) {
        
        AF.request(ServerConstants.baseNewsUrl + "/art/" + page).responseString(completionHandler: { response in
            
            guard let html = response.value else { return }
            let articles = self.parseHtml(html:html)
            completion(articles)
        })
    }
    
    func parseHtml(html: String) -> [Article?] {
        
        var articles = [Article?]()
        
        do {
           let doc: Document = try SwiftSoup.parse(html)
            let info = try doc.getElementsByClass("articlePrevBig")
            for element in info {
                let href = try element.children()
                for element2 in href {
                    let text = try element2.text()
                    let href = try element2.attr("href")
                    let elem3 = try element2.select("img[src$=.jpeg]")
                    let elem4 = try element2.select("img[src$=.jpg]")
                    var imgSrc = try elem4.attr("src")
                    if imgSrc == "" {
                        imgSrc = try elem3.attr("src")
                    }
                    let article = Article(imageUrlString: imgSrc, name: text, urlToFull: href)
                    articles.append(article)
                    print("\(imgSrc)\n\(text)\n\(href)\n\n")
                }
            }
            
        } catch Exception.Error(let type, let message) {
            print(message)
        } catch {
            print("error")
        }
        return articles
    }
}

