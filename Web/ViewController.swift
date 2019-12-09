//
//  ViewController.swift
//  Web
//
//  Created by HT-19R1108 on 2019/12/06.
//  Copyright © 2019 HT-19R1108. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var vwWeb: WKWebView!
    
    @IBOutlet weak var tfWebPage: UITextField!
    
    @IBOutlet weak var aiLoad: UIActivityIndicatorView!
    
    // data保存用def
    var def: UserDefaults!
    
    var array = [String]()
    
    var i = 00
    // MARK: - オーバーライドメソッド
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // nilが入ってるのでdef初期化
        def = UserDefaults.standard
        
        // web読み込み後のデリゲート
        vwWeb.navigationDelegate = self
        
        // 初めに表示されるページ
        readWeb(urlStr: "https://www.google.co.jp")
        
    }

    // MARK: - デリゲートメソッド
    
    // webの読み込み開始時の処理
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        // インジケーター表示
        aiLoad.startAnimating()
        
//        // 表示ページ保存
//        let bufUrl = tfWebPage.text!
//        def.set(bufUrl, forKey: "webUrl\(i)")
//        
//        
    }
    
    // webの読み込み後の処理
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        
        // インジケーター非表示
        aiLoad.stopAnimating()
        
        // URLのテキスト表示
        tfWebPage.text = webView.url?.absoluteString
        
        // 表示ページ保存
        let bufUrl = [tfWebPage.text!]
//        def.set(bufUrl, forKey: "webUrl")
        array += bufUrl
//        print(array)
        
    }
    
    // MARK: - アクションメソッド
    
    // TF更新後 webページ表示処理メソッド呼び出し
    @IBAction func tfWeb(_ sender: UITextField) {
        
        readWeb(urlStr: sender.text!)
        
    }
    
    // retunキー押下で確定処理
    @IBAction func tfWebP(_ sender: Any) {
    }
    
    // 戻るボタン（1つ前のページ）
    @IBAction func btBack(_ sender: UIButton) {
        
        vwWeb.goBack()
////        let bufUrl = def.string(forKey: "webUrl")
//        let bufUrl = array[array.count - 2]
////        print(bufUrl)
//        readWeb(urlStr: bufUrl)
        
    }
    
    
    @IBAction func btSusumu(_ sender: Any) {
        
        vwWeb.goForward()
    }
    
    
    @IBAction func toHome(_ sender: Any) {
        
        readWeb(urlStr: "https://www.google.co.jp")
        
    }
    
    // MARK: - オリジナルメソッド
    
    // webページ表示処理
    func readWeb(urlStr: String) {
        
        let url = URL(string: urlStr)
        let req = URLRequest(url: url!)
        
        vwWeb.load(req)
        

        
        
    }
    
    
}

