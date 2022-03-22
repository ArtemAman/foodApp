//
//  DetailArticleOutput.swift
//  Fooder
//
//  Created by Artyom Amankeldiev on 07.03.2022.
//

import UIKit
protocol DetailArticleOutput: AnyObject {
    func viewLoaded()
    func favourite(ifWeWriteToBase: Bool)
    var detailArticleModel: DetailArticleViewModelProtocol? { get }
}
