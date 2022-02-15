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
        AF.request(ServerConstants.baseNewsUrl + "?page=" + page).responseString(completionHandler: { response in
            
            guard let html = response.value else { return }
            let articles = self.parseHtml(html:html)
            completion(articles)
        })
    }
    
    func parseHtml(html: String) -> [Article?] {
        
        var articles = [Article?]()
        var headerToReturn: String?
        var imgUrlToReturn: String?
        var urlToFullToReturn: String?
        
        do {
            let doc: Document = try SwiftSoup.parse(html)
            
            let link = try doc.getElementsByClass("promo__story")
            for element in link {
                let lenk = try element.attr("href")
                let href = try element.html()
                urlToFullToReturn = href
                let doc2: Document = try SwiftSoup.parse(href)
                let info = try doc2.getElementsByClass("promo__image")
                let header = try doc2.getElementsByClass("promo__title")
    
                for element in header {
                    let headerStr =  try element.text()
                    headerToReturn = headerStr
                }
                
                for element in info {
                    let image = try element.select("img[src$=.jpg]")
                    let imageUrl = try image.attr("src")
                    imgUrlToReturn = imageUrl
                }
                
                let article = Article(imageUrlString: imgUrlToReturn, name: headerToReturn, urlToFull: urlToFullToReturn)
                
                articles.append(article)
                
            }
 
        } catch Exception.Error(let type, let message) {
            print(message)
        } catch {
            print("error")
        }
        return articles
    }
}

