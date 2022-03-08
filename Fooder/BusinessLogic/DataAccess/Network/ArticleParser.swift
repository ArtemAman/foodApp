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
    
    func scrapeNewsDetail(requestingUrl: String, completion: @escaping(String?) -> Void) {
        AF.request(ServerConstants.baseNewsUrl + requestingUrl).responseString(completionHandler: { response in
            print(requestingUrl)
            guard let html = response.value else { return }
            let text = self.parseHtmlDetail(html: html)
            completion(text)
        })
    }
    
    func scrapeNews(page: String, completion: @escaping([Article?]) -> Void) {
        AF.request(ServerConstants.baseNewsUrl + ServerConstants.articles + "?page=" + page).responseString(completionHandler: { response in
            
            guard let html = response.value else { return }
            let articles = self.parseHtml(html:html)
            completion(articles)
        })
    }
    
    func parseHtmlDetail(html: String) -> String? {
        
        do {
            let doc: Document = try SwiftSoup.parse(html)
            
            let fullPage = try doc.getElementsByClass("blocks-article__grid")
            let text = try fullPage.text()
            return text
        } catch Exception.Error(let type, let message) {
            print(message, type)
            return nil
        } catch {
            print("error")
            return nil
        }
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
                let link = try element.attr("href")
                let href = try element.html()
                urlToFullToReturn = link
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

